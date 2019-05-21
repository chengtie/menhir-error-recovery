(** This example parser illustrates how error recovery can be
   programmed using the incremental parsers generated by Menhir.

   There are many ways to recover from parsing errors and they often
   are specific to the grammar we are parsing. Here is our strategy.
   From the grammar, we know that a command is probably ended by a
   semicolon or followed right brace if the semicolon is
   absent. Therefore, if there is a parse error in a command, we can
   skip all the tokens until we consumed the ending semicolon or until
   we are about to consume the right brace. After that we are ready to
   continue parsing, either by closing a block or by moving to another
   command.

   The problem is that we want to continue parsing from a
   syntactically valid state of the parser: a parser which is in the
   middle of a syntactically-ill command is not in such a state. For
   this reason, we maintain the last state of the parser which
   successfully recognized a full command or a full definition: we
   always recover parsing from this state, as if the syntactically
   invalid subsequence of tokens never existed.

   This strategy can be refined to avoid skipping too large part of
   the input.

   Maintaining several coexisting state of the parser is free with the
   incremental mode of Menhir because parsers are purely
   functional. For the lexer generated with ocamllex, it is a bit less
   direct. See {!PureLexer}.

*)

open Parser
open Parser.Incremental
open Parser.MenhirInterpreter
open Lexing
open PureLexer
open ParseError

(**
   [last_reduction] is the last state of the parser which successfully
   [`FoundDefinitionAt] some checkpoint, [`FoundCommandAt] some checkpoint
   or, at the beginning of the input, [`FoundNothingAt] some checkpoint.

   Depending on the context, we decide to skip the tokens which correspond
   to the next (syntactically invalid) command or definition. For this we
   use an heuristic which seems to work in practice:

   - If the previously recognized nonterminal was a command, we skip the
     tokens until we consumed a semicolon or we are just before a right brace.

   - If the previously recognized nonterminal was a definition, we
     skip the tokens until the next DEF or VAR, that is to what is likely
     to start a new definition.

*)
let resume_on_error last_reduction lex =
  match last_reduction with
  | `FoundCommandAt checkpoint ->
     let lex =
       Lexer.skip_until_before (fun t -> t = SEMICOLON || t = RBRACE) lex
     in
     let lex =
       if Lexer.get' lex = SEMICOLON then snd (Lexer.next lex) else lex
     in
     (lex, checkpoint)
  | (`FoundNothingAt checkpoint | `FoundDefinitionAt checkpoint) ->
     (Lexer.skip_until_before
        (function EOF | DEF | VAR -> true | _ -> false)
        lex,
      checkpoint)

(** This function updates the last fully correct state of the parser. *)
let update_last_reduction checkpoint production last_reduction =
  match lhs production with
  | X (N N_command) ->
     `FoundCommandAt checkpoint
  | X (N N_definition) ->
     `FoundDefinitionAt checkpoint
  | _ ->
     last_reduction

let parse lexbuf =
  Lexer.initialize lexbuf;

  let rec on_error last_reduction lexer checkpoint =
    contextual_error_msg lexer checkpoint (fun () ->
      resume_on_error last_reduction lexer
    )

  (** [run] is the loop function of the parser.

      We maintain [last_reduction] as seen earlier but we also
      save [input_needed] which is the last state of the automaton
      that asked for a token. Since we can change the next token
      observe by this state when we skip tokens, it is the right state from
      which a recovering can be triggered.

      [lexer] and [checkpoint] are the (purely functional) state of
      the lexer and the parser respectively.
   *)
  and run last_reduction input_needed lexer checkpoint =
    match checkpoint with
    | InputNeeded _ ->
       let token, lexer = Lexer.next lexer in
       (** Notice that we update [input_needed] here. *)
       run last_reduction checkpoint lexer (offer checkpoint token)
    | Accepted x ->
       (** We will always return a semantic value. *)
       x
    | Rejected
    | HandlingError _ ->
       (** [on_error] is responsible for recovering from the parsing
          error by returning a lexer state and a parser state that can
          work together to complete the analysis if the suffix of the
          input is syntactically correct. *)
       let lexer, after_error = on_error last_reduction lexer input_needed in
       run last_reduction input_needed lexer after_error
    | Shifting _ ->
       (** Nothing special here, we simply resume parsing. *)
       run last_reduction input_needed lexer (resume checkpoint)
    | AboutToReduce (_, production) ->
       (** At this point, we recall that the prefix of the input has been
           successfully recognized as a nonterminal. *)
       run
         (update_last_reduction input_needed production last_reduction)
         input_needed
         lexer
         (resume checkpoint)
  in
  let checkpoint = program lexbuf.lex_curr_p in
  let lexer = Lexer.start in
  run (`FoundNothingAt checkpoint) checkpoint lexer checkpoint

let _main =
  Error.resume_on_error ();
  parse (Lexing.from_channel (open_in Sys.argv.(1)))
