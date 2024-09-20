
(* 'a list -> 'a | returns head *)

hd;
(*'a list -> 'a list | returns list*)
tl;
(*'a list * 'a list -> 'a list | isEmpty*)
null;
(*'a list -> bool | append lists together*) 
op @;
(*'a * 'a list -> 'a list | prepend "cons"*)
op ::;
(*'a list -> int *) 
length;
(*string -> char list *)
explode;
(*char list -> string *) 
implode;
(*string * string -> string string concat*)
op ^;
val x = "hello" ^ "goodbye";

(* Prepend function that adds an element to the front of a list *)
fun prepend(x, []) = [x]  (* If the list is empty, return a new list with the element *)
  | prepend(x, lst) = x :: lst;  (* Prepend the element to the front of the list *)





list_append([1, 2], "a");



