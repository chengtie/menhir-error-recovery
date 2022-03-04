
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20210419

module MenhirBasics = struct
  
  exception Error
  
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
    | LINT of (
# 5 "parser.mly"
      (int)
# 25 "parser.ml"
  )
    | LBRACE
    | IF
    | ID of (
# 6 "parser.mly"
      (string)
# 32 "parser.ml"
  )
    | EQ
    | EOF
    | ELSE
    | DEF
    | COMMA
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

# 1 "parser.mly"
   (* Emacs, open this file with -*- tuareg -*- *)
   open AST

# 51 "parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | COMMA ->
          18
      | DEF ->
          17
      | ELSE ->
          16
      | EOF ->
          15
      | EQ ->
          14
      | ID _ ->
          13
      | IF ->
          12
      | LBRACE ->
          11
      | LINT _ ->
          10
      | LPAREN ->
          9
      | PLUS ->
          8
      | RBRACE ->
          7
      | RETURN ->
          6
      | RPAREN ->
          5
      | SEMICOLON ->
          4
      | STAR ->
          3
      | THEN ->
          2
      | VAR ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | COMMA ->
          Obj.repr ()
      | DEF ->
          Obj.repr ()
      | ELSE ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | ID _v ->
          Obj.repr _v
      | IF ->
          Obj.repr ()
      | LBRACE ->
          Obj.repr ()
      | LINT _v ->
          Obj.repr _v
      | LPAREN ->
          Obj.repr ()
      | PLUS ->
          Obj.repr ()
      | RBRACE ->
          Obj.repr ()
      | RETURN ->
          Obj.repr ()
      | RPAREN ->
          Obj.repr ()
      | SEMICOLON ->
          Obj.repr ()
      | STAR ->
          Obj.repr ()
      | THEN ->
          Obj.repr ()
      | VAR ->
          Obj.repr ()
  
  and default_reduction =
    (4, "\000 0\r\007\000P\000\000\240\129\t")
  
  and error =
    (19, "\000d\000\012\128\000\000\na\144\000\000\000\128\001\025\000\000\000\004\000\000\000\000R\b\1282\000\000\000\000\200\005 \200\003 \020\129 \012\128\000\000\nA\000\000\000\000\000\004 \192\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\r\r\000\007\000\0172\000\b\000\026\r\000\r\n\r*\r\000J\000\000\026\000"), (8, ")\026)\006\n)%\014.&\r))\r\000).\0005\r\r6\000\r.\000\021>_6-F\000\000\006\n\021\000\014\021.\000R\000\0006\000\000\000\000\000>"))
  
  and lhs =
    (4, "\006fffT2!\016")
  
  and goto =
    ((8, "\006\026\000\000\000\000\003\000\000\000\000\"\000*\0002\000\018\000\000\000\000\000\000"), (8, "\b\t\005\006\000\011\005\006\022\023\019\000\005\006\000\011\005\006\000\020\005\006\000\r\005\006\000\015\005\006\000\017"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 5 "parser.mly"
      (int)
# 172 "parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.expression) = 
# 61 "parser.mly"
(
  Int x
)
# 182 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (AST.identifier) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.expression) = 
# 65 "parser.mly"
(
  Read x
)
# 209 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (AST.expression) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (AST.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (AST.expression) = let b = 
# 82 "parser.mly"
       ( Add   )
# 248 "parser.ml"
         in
        
# 69 "parser.mly"
(
  Binop (b, e1, e2)
)
# 255 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (AST.expression) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (AST.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (AST.expression) = let b = 
# 83 "parser.mly"
       ( Mul   )
# 294 "parser.ml"
         in
        
# 69 "parser.mly"
(
  Binop (b, e1, e2)
)
# 301 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (AST.expression) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (AST.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (AST.expression) = let b = 
# 84 "parser.mly"
       ( Equal )
# 340 "parser.ml"
         in
        
# 69 "parser.mly"
(
  Binop (b, e1, e2)
)
# 347 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = f;
                MenhirLib.EngineTypes.startp = _startpos_f_;
                MenhirLib.EngineTypes.endp = _endpos_f_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let xs : (AST.expression list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let f : (AST.function_identifier) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__4_ in
        let _v : (AST.expression) = let es = 
# 232 "<standard.mly>"
    ( xs )
# 393 "parser.ml"
         in
        
# 73 "parser.mly"
(
  Call (f, es)
)
# 400 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (AST.expression) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (AST.expression) = 
# 77 "parser.mly"
(
  Paren e
)
# 441 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let e : (AST.expression) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos__2_ in
        let _v : (AST.expression) = 
# 20 "parser.mly"
(
  e
)
# 475 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 6 "parser.mly"
      (string)
# 496 "parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.function_identifier) = 
# 92 "parser.mly"
(
  FId x
)
# 506 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 6 "parser.mly"
      (string)
# 527 "parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.identifier) = 
# 87 "parser.mly"
(
  Id x
)
# 537 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (AST.expression list) = 
# 142 "<standard.mly>"
    ( [] )
# 555 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (AST.expression list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.expression list) = 
# 144 "<standard.mly>"
    ( x )
# 580 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (AST.expression) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (AST.expression list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 605 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (AST.expression list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (AST.expression) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (AST.expression list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 644 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
  module Symbols = struct
    
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
      | T_LINT : (
# 5 "parser.mly"
      (int)
# 684 "parser.ml"
    ) terminal
      | T_LBRACE : unit terminal
      | T_IF : unit terminal
      | T_ID : (
# 6 "parser.mly"
      (string)
# 691 "parser.ml"
    ) terminal
      | T_EQ : unit terminal
      | T_EOF : unit terminal
      | T_ELSE : unit terminal
      | T_DEF : unit terminal
      | T_COMMA : unit terminal
    
    type _ nonterminal = 
      | N_separated_nonempty_list_COMMA_expression_ : (AST.expression list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_expression__ : (AST.expression list) nonterminal
      | N_identifier : (AST.identifier) nonterminal
      | N_function_identifier : (AST.function_identifier) nonterminal
      | N_expressionEOF : (AST.expression) nonterminal
      | N_expression : (AST.expression) nonterminal
    
  end
  
  include Symbols
  
  include MenhirLib.InspectionTableInterpreter.Make (Tables) (struct
    
    include TI
    
    include Symbols
    
    include MenhirLib.InspectionTableInterpreter.Symbols (Symbols)
    
    let terminal =
      fun t ->
        match t with
        | 0 ->
            X (T T_error)
        | 1 ->
            X (T T_VAR)
        | 2 ->
            X (T T_THEN)
        | 3 ->
            X (T T_STAR)
        | 4 ->
            X (T T_SEMICOLON)
        | 5 ->
            X (T T_RPAREN)
        | 6 ->
            X (T T_RETURN)
        | 7 ->
            X (T T_RBRACE)
        | 8 ->
            X (T T_PLUS)
        | 9 ->
            X (T T_LPAREN)
        | 10 ->
            X (T T_LINT)
        | 11 ->
            X (T T_LBRACE)
        | 12 ->
            X (T T_IF)
        | 13 ->
            X (T T_ID)
        | 14 ->
            X (T T_EQ)
        | 15 ->
            X (T T_EOF)
        | 16 ->
            X (T T_ELSE)
        | 17 ->
            X (T T_DEF)
        | 18 ->
            X (T T_COMMA)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 6 ->
            X (N N_expression)
        | 5 ->
            X (N N_expressionEOF)
        | 4 ->
            X (N N_function_identifier)
        | 3 ->
            X (N N_identifier)
        | 2 ->
            X (N N_loption_separated_nonempty_list_COMMA_expression__)
        | 1 ->
            X (N N_separated_nonempty_list_COMMA_expression_)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\020\022\028\007\t\020\003\005\012\r\b\r\018\r\030\r&\003\r\012\011\r ")
    
    and rhs =
      ((8, "\011\022\007\r\018\r\r\b\r\r\030\r\t\020\005\012\020\r\012\r \028\028\003\r\r&\003"), (8, "\000\001\002\003\006\t\012\016\019\021\022\023\023\024\025\028"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023")
    
    and lr0_items =
      ((16, "\000\000\028\001\004\001(\001$\001\b\001\024\001\024\0020\001\024\003\024\0048\0014\001\020\001\016\001\012\001\016\002\020\001\016\003\016\001\012\001\012\002\020\001\016\001\012\003\012\001\020\002\020\003\020\001\016\001\012\0018\0028\003\028\002\020\001\016\001\012\001\028\003\000\001 \001\020\001\016\001\012\001 \002"), (8, "\000\001\002\003\005\006\007\b\t\n\011\016\017\021\022\026\027\031 !%&'+,"))
    
    and nullable =
      " "
    
    and first =
      (19, "\000d\000\012\128\001\144\000\002\000\000@\000\200\000\025\000")
    
  end) (ET) (TI)
  
end

let expressionEOF =
  fun lexer lexbuf ->
    (Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf) : (AST.expression))

module Incremental = struct
  
  let expressionEOF =
    fun initial_position ->
      (Obj.magic (MenhirInterpreter.start 0 initial_position) : (AST.expression) MenhirInterpreter.checkpoint)
  
end

# 269 "<standard.mly>"
  

# 818 "parser.ml"