

(* cubeLost *)

fun cubeList li = map (fn(cur) => cur * cur * cur) li;

cubeList([1,2,3]);

(* removeAll *)

fun removeAll li x = foldr (fn(cur, acc) => if cur = x then acc else cur::acc) [] li;

val x = removeAll [1,2,3,3,4] 4;

(* map question *)

fun r li = map real li

val res = r [1,2,3]