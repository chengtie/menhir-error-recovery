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
  | Element (state, v, startp, endp) ->
    Printf.printf "element number of state %d\n" (number state);
    (match incoming_symbol state with
    | T T_ID -> Printf.printf "element v %s\n" v
    | T T_DEF -> Printf.printf "element v DEF\n"
    | T T_LINT -> Printf.printf "element v %d\n" v
    | _ -> Printf.printf "element v toComplete\n");
    Printf.printf "element startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
    Printf.printf "element endp   %d:%d\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
    Printf.printf "element incoming_symbol %s\n" (Symbol.string_of_symbol (X (incoming_symbol state)));
    let xs = items state in
    List.iter (fun x -> 
      Printf.printf "element item: %s\n" (Symbol.string_of_item x);
      let (p, _) = x in Printf.printf "element item: production: %d\n" (production_index p)
      ) xs;
    Printf.printf "\n"

let print_env env =
  let i, found = ref (-1), ref false in
  while not !found do
    i := !i + 1;
    let elt = get !i env in
    (match elt with
    | None -> found := true
    | Some elt -> print_element elt);
  done

let rec pop_until (pred: element -> xsymbol list) env : xsymbol list =
  match top env with
  | None -> []
  | Some elt ->
     match pred elt with
     | [] -> begin match pop env with
             | None -> assert false
             | Some env -> pop_until pred env
             end
     | l -> l

let keep_predictions (predictions: xsymbol list) (production, focus) =
  if focus < List.length (rhs production) then
    (lhs production) :: predictions
  else
    predictions

let element_contains_prediction_items elt : xsymbol list =
  match elt with
  | Element (state, _, _, _) ->
    print_element elt;
    (* Printf.printf "element number of state %d\n" (number state);
    Printf.printf "element startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
    Printf.printf "element endp   %d:%d\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
    Printf.printf "element incoming_symbol %s\n" (Symbol.string_of_symbol (X (incoming_symbol state)));
    (match incoming_symbol state with
    | T T_ID -> Printf.printf "element v %s\n" v
    | T T_DEF -> Printf.printf "element v DEF\n"
    | _ -> Printf.printf "element v toComplete\n"); *)
    let xs = items state in
    (* List.iter (
      fun x -> Printf.printf "element item: %s\n" (Symbol.string_of_item x); 
      let (p, _) = x in Printf.printf "element item production: %d\n" (production_index p)) xs;
    Printf.printf "\n"; *)
    xs |> List.fold_left keep_predictions []

let find_context = function
  | InputNeeded env ->
     (* print_env env; *)
     Printf.printf "hahahaha depth of env %d\n" (depth env);
     Printf.printf "hahahaha current_state_number %d\n" (current_state_number env);
     let (startp, endp) = positions env in
     Printf.printf "hahahaha startp %d:%d\n" startp.pos_lnum (startp.pos_cnum - startp.pos_bol);
     Printf.printf "hahahaha endp   %d:%d\n\n" endp.pos_lnum (endp.pos_cnum - endp.pos_bol);
     (pop_until element_contains_prediction_items env, current_state_number env, positions env, env)
  | _ ->
     assert false (* By the specification of [on_error]. *)

let parse_error pos msg cont =
  Error.error "during parsing" pos msg cont

let contextual_error_msg lexer checkpoint continuation =
  let (nonterminals, currentStateNumber, positions, env) = find_context checkpoint in
  ((Error.error "parsing" (Lexer.current_position lexer) (Printf.sprintf "Error while analyzing %s." (String.concat " or " (List.map Symbol.string_of_symbol nonterminals))))
    continuation
    (Some currentStateNumber)
    positions
    env)

