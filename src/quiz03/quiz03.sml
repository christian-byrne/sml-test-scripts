
(* -Question 4- *)

fun countZeros([]) = 0
  | countZeros(0::xs) = 1 + countZeros(xs)
  | countZeros(_::xs) = countZeros(xs)


val result = countZeros([1,2,0,0,2,0,1,0]); (* 4 *)


(* -Question 6- *)

fun foo(_, []) = []
  | foo(e, x::xs) = if e = x then foo(e, xs) else x::foo(e, xs);

val result2 = foo(3, [1,2,3,1,2,3]); (* [1,2,1,2] *)
