type program = definition list
[@@deriving show]

and definition =
  | Fun of function_identifier * identifier list * block
  | Var of identifier * expression
  | InvalidDefinition
  [@@deriving show]

and block =
  | Block of command list
  | InvalidBlock
  [@@deriving show]

and command =
  | Assign of identifier * expression
  | If of expression * block * block
  | Return of expression
  | InvalidCommand
  [@@deriving show]

and expression =
  | Int of int
  | Read of identifier
  | Binop of binop * expression * expression
  | Call of function_identifier * expression list
  | Paren of expression
  | ParenFakeRparen of expression
  | InvalidExpression
  | FakeExpression
  [@@deriving show]

and binop = Add | Mul | Equal
[@@deriving show]

and function_identifier = FId of string
[@@deriving show]

and identifier = Id of string
[@@deriving show]