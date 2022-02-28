(**

   This module demonstrates that we can easily generate contextual
   error message thanks to the introspection API. Indeed, when a
   parsing error occurs, there exist items in the stack whose analysis
   is not completed. Therefore, the non terminals of their productions
   are probably the syntactically classes that are being recognized
   when the error occurred.

*)

open Parser.MenhirInterpreter
open PureLexer

let rec pop_until pred env =
  match top env with
  | None -> []
  | Some elt ->
     match pred elt with
     | [] -> begin match pop env with
             | None -> assert false
             | Some env -> pop_until pred env
             end
     | l -> l

let keep_predictions predictions (production, focus) =
  if focus < List.length (rhs production) then
    (lhs production) :: predictions
  else
    predictions

let element_contains_prediction_items elt =
  match elt with
  | Element (state, v, startp, endp) ->
    Printf.printf "hahahaha element number of state %d\n" (number state);
    Printf.printf "hahahaha element startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
    Printf.printf "hahahaha element endp   %d:%d\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
    Printf.printf "hahahaha element incoming_symbol %s\n" (Symbol.string_of_symbol (X (incoming_symbol state)));
    (match incoming_symbol state with
    | T T_ID -> Printf.printf "hahahaha element v %s\n" v
    | T T_DEF -> Printf.printf "hahahaha element v DEF\n"
    | _ -> Printf.printf "hahahaha element v toComplete\n");
    let xs = items state in
    List.iter (fun x -> Printf.printf "hahahaha element item: %s\n" (Symbol.string_of_item x)) xs;
    xs |> List.fold_left keep_predictions []

let depth env : int =
  let i, found = ref (-1), ref false in
  while not !found do
    i := !i + 1;
    match get !i env with
    | None -> found := true
    | Some _ -> ();
  done;
  !i

let print_element elt: unit =
  match elt with
  | Element (state, _, startp, endp) ->
    Printf.printf "ha element number of state %d\n" (number state);
    Printf.printf "ha element startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
    Printf.printf "ha element endp   %d:%d\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
    Printf.printf "ha element incoming_symbol %s\n\n" (Symbol.string_of_symbol (X (incoming_symbol state)))

let print_env env =
  let i, found = ref (-1), ref false in
  while not !found do
    i := !i + 1;
    let elt = get !i env in
    (match elt with
    | None -> found := true
    | Some elt -> print_element elt);
  done

let find_context = function
  | InputNeeded env ->
     print_env env;
     Printf.printf "hahahaha depth of env %d\n" (depth env);
     Printf.printf "hahahaha current_state_number %d\n" (current_state_number env);
     let (startp, endp) = positions env in
     Printf.printf "hahahaha startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
     Printf.printf "hahahaha endp   %d:%d\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
     (pop_until element_contains_prediction_items env, current_state_number env)
  | _ ->
     assert false (* By the specification of [on_error]. *)

let parse_error pos msg cont =
  Error.error "during parsing" pos msg cont

let contextual_error_msg lexer checkpoint continuation =
  let (nonterminals, currentStateNumber) = find_context checkpoint in
  ((Error.error "parsing" (Lexer.current_position lexer) (Printf.sprintf "Error State %d while analyzing %s." currentStateNumber (String.concat " or " (List.map Symbol.string_of_symbol nonterminals))))
    continuation
    (Some currentStateNumber))

