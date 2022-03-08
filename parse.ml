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
open ErrorMessages

let compare_symbolss xs ys =
   List.for_all2 (fun x y -> compare_symbols x y = 0) xs ys

let contain_item env r ls index =
   match top env with
   | Some Element (s, _, _, _) ->
      let items = items s in
      List.exists (fun (p, i) ->
         compare_symbols (lhs p) r = 0 &&
         compare_symbolss (rhs p) ls &&
         i = index
      ) items
   | None -> false

(* for "3)", "4))", "2+3)": *)
let case0 lexer env =
   LexerF.get' lexer = RPAREN && (
   match top env with
   | Some (Element (s, _, _, _)) -> (
      match incoming_symbol s with 
      | N N_expression -> true
      | _ -> false)
   | _ -> false)

(* for ")": *)
let case1 lexer env =
   LexerF.get' lexer = RPAREN && (
   match top env with
   | Some _ -> false
   | _ -> true)
   
let rec fail (lexer: LexerF.t) env (messages: Messages.t list) =
   let (_, startp, endp) = LexerF.get lexer in
   Printf.printf "Error: startp.pos_cnum: %d, endp.pos_cnum: %d\n" startp.pos_cnum endp.pos_cnum;
   Printf.printf "current_state_number: %d\n" (current_state_number env);
   print_env env;
   if contain_item env (X (N N_expression)) [X (N N_expression); X (T T_PLUS); X (N N_expression)] 2 then
      (* for "2+", "2*3+": *)
      (* error message: over '+', "Expression expected" *)
      (* element item: 3: an expression -> an expression + .an expression *)
      let env_new = feed (N N_expression) startp FakeExpression endp env in
      (* for "2+)", "2+))", we want to "insert" FakeExpression before ')', so we use [prev] to resume from ')' *)
      let message = 
         match top env with
         | Some (Element (_, _, startp, endp)) ->
            Messages.make startp.pos_cnum endp.pos_cnum "Expression expected"
         | None -> failwith "not possible"
      in
      loop (snd (LexerF.prev lexer)) (input_needed env_new) (messages @ [message])
   else if contain_item env (X (N N_expression)) [X (T T_LPAREN); X (N N_expression); X (T T_RPAREN)] 1 then
      (* for "()": *)
      (* error message: over the whole pair, "Expression expected" *)
      (* element item: 7: an expression -> ( .an expression ) *)
      let env_new = feed (N N_expression) startp FakeExpression endp env in
      let message = 
         match top env with
         | Some (Element (_, _, startp', _)) ->
            Messages.make startp'.pos_cnum endp.pos_cnum "Expression expected"
         | None -> failwith "not possible"
      in
      loop (snd (LexerF.prev lexer)) (input_needed env_new) (messages @ [message])
   else if contain_item env (X (N N_expression)) [X (T T_LPAREN); X (N N_expression); X (T T_RPAREN)] 2 then
      (* for "(1", "(1+2", "(1+2*3", "((1+2)": *)
      (* error message: from (and including) the opening parenthesis, "Unclosed parenthesis - add ')'." *)
      (* element item: 7: an expression -> ( an expression .) *)
      let semv = 
         match top env with
         | Some (Element (s, v, _, _)) -> (
            match incoming_symbol s with
            | N N_expression -> AST.ExtraRparen v
            | _ -> failwith "not possible")
         | _ -> failwith "not possible"
      in
      let env_new = 
         match pop_many 2 env with
         | Some x -> x
         | _ -> failwith "not possible"
      in
      let env_new = feed (N N_expression) startp semv endp env_new in
      let startp' =
         match find_element_having_lparen env with
         | Some (s, _) -> s
         | _ -> failwith "not possible"
      in
      let message = 
         match top env with
         | Some (Element (_, _, _, endp)) ->
            Messages.make startp'.pos_cnum endp.pos_cnum "Unclosed parenthesis - add ')'."
         | _ -> failwith "not possible"
      in    
      loop lexer (input_needed env_new) (messages @ [message])
   else if case0 lexer env then 
      (* for "3)", "4))", "2+3)": *)
      (* error message: on the closing parenthesis, "Extra closing parenthesis." *)
      (* element incoming_symbol an expression *)
      let semv = 
         match top env with
         | Some (Element (s, v, _, _)) -> (
            match incoming_symbol s with
            | N N_expression -> AST.ExtraRparen v
            | _ -> failwith "not possible")
         | _ -> failwith "not possible"
      in
      let env_new = 
         match pop env with
         | Some x -> x
         | _ -> failwith "not possible"
      in
      let env_new = feed (N N_expression) startp semv endp env_new in
      let message = Messages.make startp.pos_cnum endp.pos_cnum "Extra closing parenthesis." in
      loop lexer (input_needed env_new) (messages @ [message])
   else if case1 lexer env then
      (* for ")": *) 
      (* error message: no message besides extra closing parenthesis coming later *)
      (* element incoming_symbol an expression *)
      let env_new = feed (N N_expression) startp FakeExpression endp env in
      loop (snd (LexerF.prev lexer)) (input_needed env_new) messages
   else failwith "don't know too, parse.ml"

and loop (lexer: LexerF.t) checkpoint messages =
   match checkpoint with
   | InputNeeded _env ->
      (* The parser needs a token. Request one from the lexer,
         and offer it to the parser, which will produce a new
         checkpoint. Then, repeat. *)
      let token, lexer = LexerF.next lexer in
      let checkpoint = offer checkpoint token in
      loop lexer checkpoint messages
   | Shifting _ 
   | AboutToReduce _ ->
      let checkpoint = resume checkpoint in
      loop lexer checkpoint messages
   | HandlingError _env ->
      fail lexer _env messages
   | Accepted v ->
      (* The parser has succeeded and produced a semantic value. Print it. *)
      Printf.printf "AST:\n%s\n" (AST.show_expression v);
      Printf.printf "Error Messages:\n";
      Messages.print_messages messages;
      checkpoint
   | Rejected ->
      (* The parser rejects this input. This cannot happen, here, because
      we stop as soon as the parser reports [HandlingError]. *)
      assert false

let _main =
   let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in 
   LexerF.initialize lexbuf;
   loop LexerF.start (expressionEOF lexbuf.lex_curr_p) []