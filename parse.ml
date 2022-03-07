(**
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

let acceptable_me checkpoint token pos =
   let triple = (token, pos, pos) in
   let checkpoint = offer checkpoint triple in
   match shifts checkpoint with
   | None -> (false, None)
   | Some _env -> (true, Some _env)

let rec fail (lexer: LexerF.t) env =
   let (_, startp, endp) = LexerF.get lexer in
   Printf.printf "Error: startp.pos_cnum: %d, endp.pos_cnum: %d\n" startp.pos_cnum endp.pos_cnum;
   Printf.printf "current_state_number: %d\n" (current_state_number env);
   print_env env;
   match current_state_number env with
   | 15 ->
      (* for '2+' or '2*3+', we add a fake expression *)
      (* element incoming_symbol + *)
      (* element item: 3: an expression -> an expression + .an expression *)
      let env_new = feed (T T_FAKEEXPRESSION) startp () endp env in
      Printf.printf "BEFORE:\n";
      print_env env;
      Printf.printf "\nAFTER:\n";
      print_env env_new;
      (* for "2+))", we want to "insert" FAKEEXPRESSION before ')', so we use [prev] to resume from ')' *)
      loop (snd (LexerF.prev lexer)) (input_needed env_new)
   | 1 ->
      (* for "()", we add a fake expression *)
      (* element incoming_symbol ( *)
      let env_new = feed (T T_FAKEEXPRESSION) startp () endp env in
      loop (snd (LexerF.prev lexer)) (input_needed env_new)
   | 21 -> (
      (* for '(1' or '(1+2' or '(1+2*3' or '((1+2)', we add ')': *)
      (* element incoming_symbol an expression *)
      match acceptable_me (input_needed env) RPAREN endp with
      | (xxx, Some _env) when xxx ->
         Printf.printf "Adding a ')' can amend\n";
         let env_new = feed (T T_FAKERPAREN) startp () endp _env in
         loop lexer (input_needed env_new)
      | _ -> failwith "don't know, parse.ml")
   | 25 -> ( 
      (* for "3)", "4))", "2+3)": *)
      (* element incoming_symbol an expression *)
      let env_new = feed (T T_EXTRARPAREN) startp () endp env in
      loop lexer (input_needed env_new))
   | 0 ->
      (* state 0 can be ")", "+", etc. *)
      if LexerF.get' lexer = RPAREN 
      (* for ")": *)
      then (
         (* LexerF.print_state ();  *)
         let env_new = feed (T T_FAKEEXPRESSION) startp () endp env in
         loop (snd (LexerF.prev lexer)) (input_needed env_new))
      else failwith "don't know 3, parse.ml"
   | _ ->
      failwith "don't know too, parse.ml"

and loop (lexer: LexerF.t) checkpoint =
   match checkpoint with
   | InputNeeded _env ->
      (* The parser needs a token. Request one from the lexer,
         and offer it to the parser, which will produce a new
         checkpoint. Then, repeat. *)
      let token, lexer = LexerF.next lexer in
      let checkpoint = offer checkpoint token in
      loop lexer checkpoint
   | Shifting _ 
   | AboutToReduce _ ->
      let checkpoint = resume checkpoint in
      loop lexer checkpoint
   | HandlingError _env ->
      fail lexer _env
   | Accepted v ->
      (* The parser has succeeded and produced a semantic value. Print it. *)
      Printf.printf "AST:\n%s\n" (AST.show_expression v);
      checkpoint
   | Rejected ->
      (* The parser rejects this input. This cannot happen, here, because
      we stop as soon as the parser reports [HandlingError]. *)
      assert false

let _main =
   let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in 
   LexerF.initialize lexbuf;
   loop LexerF.start (expressionEOF lexbuf.lex_curr_p)