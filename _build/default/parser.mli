
(* The type of tokens. *)

type token = 
  | VAR
  | THEN
  | STAR
  | SEMICOLON
  | RPAREN
  | RETURN
  | RBRACE
  | PLUS
  | LPAREN
  | LINT of (int)
  | LBRACE
  | IF
  | ID of (string)
  | EQ
  | EOF
  | ELSE
  | DEF
  | COMMA

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val expressionEOF: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (AST.expression)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
  (* The indexed type of terminal symbols. *)
  
  type _ terminal = 
    | T_error : unit terminal
    | T_VAR : unit terminal
    | T_THEN : unit terminal
    | T_STAR : unit terminal
    | T_SEMICOLON : unit terminal
    | T_RPAREN : unit terminal
    | T_RETURN : unit terminal
    | T_RBRACE : unit terminal
    | T_PLUS : unit terminal
    | T_LPAREN : unit terminal
    | T_LINT : (int) terminal
    | T_LBRACE : unit terminal
    | T_IF : unit terminal
    | T_ID : (string) terminal
    | T_EQ : unit terminal
    | T_EOF : unit terminal
    | T_ELSE : unit terminal
    | T_DEF : unit terminal
    | T_COMMA : unit terminal
  
  (* The indexed type of nonterminal symbols. *)
  
  type _ nonterminal = 
    | N_separated_nonempty_list_COMMA_expression_ : (AST.expression list) nonterminal
    | N_loption_separated_nonempty_list_COMMA_expression__ : (AST.expression list) nonterminal
    | N_identifier : (AST.identifier) nonterminal
    | N_function_identifier : (AST.function_identifier) nonterminal
    | N_expressionEOF : (AST.expression) nonterminal
    | N_expression : (AST.expression) nonterminal
  
  (* The inspection API. *)
  
  include MenhirLib.IncrementalEngine.INSPECTION
    with type 'a lr1state := 'a lr1state
    with type production := production
    with type 'a terminal := 'a terminal
    with type 'a nonterminal := 'a nonterminal
    with type 'a env := 'a env
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val expressionEOF: Lexing.position -> (AST.expression) MenhirInterpreter.checkpoint
  
end
