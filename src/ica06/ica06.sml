
(* halve: 'a list -> 'a list * a' list) *)

fun halve([]) = ([], [])
  | halve([x]) = ([x], [])
  | halve(x::y::li) = 
    let
      val (a, b) = halve(li)
    in
      (x::a, y::b)
    end;

val halved = [1,2,3,4,5,6];

(* merge: 'a list * 'a list -> 'a list *)
(* precondition: the input lists are sorted *)
(* postcondition: returned lists should be sorted *)

fun merge([], []) = []
  | merge([], x::li2) = x::merge([], li2)
  | merge(x::li1, []) = x:: merge(li1, [])
  | merge(x::li1, y::li2) = x::y::merge(li1, li2);

val merged = merge([1,2,3], [4,5,6]);
