module Messages : sig
  type t 
  val make: int -> int -> string -> t
  val print_messages: t list -> unit
end = struct
  type t = {
    (* given "abc", 
      the startp of 'a' is 0, the endp of 'a' is 1;
      the startp of 'b' is 1, the endp of 'b' is 2 
      *)
    startp : int; 
    endp : int;
    message: string
  }  
  [@@deriving show]

  let make startp endp m = 
    { startp = startp; endp = endp; message = m }

  let print_messages messages =
    List.iter (fun m -> Printf.printf "%s\n" (show m)) messages
end