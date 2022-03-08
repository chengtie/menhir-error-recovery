type expression =
  | Int of int
  | Read of identifier
  | Binop of binop * expression * expression
  | Call of function_identifier * expression list
  | Paren of expression
  | ParenFakeRparen of expression
  | InvalidExpression
  | FakeExpression
  | ExtraRparen of expression
  [@@deriving show]

and binop = Add | Mul | Equal
[@@deriving show]

and function_identifier = FId of string
[@@deriving show]

and identifier = Id of string
[@@deriving show]