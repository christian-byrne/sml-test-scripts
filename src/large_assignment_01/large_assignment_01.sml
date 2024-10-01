(* 
 *  Author: Christian Byrne
 *  Date: 9/27/24
 *  Large Assignment #1
 *  Description: Practice functions in SML, 
 *               focusing on pattern matching 
 *               and recursion.
 *)


(* 
 *  Type: `int * int * int -> bool`
 *  Description: The triangle inequality theorem states that the sum of any 
 *               two sides of a triangle must be greater than or equal to the 
 *               third side. This function should return true if the three 
 *               integers can make a triangle and false otherwise.
 *)
fun triangle(0, _, _) = false
  | triangle(_, 0, _) = false
  | triangle(_, _, 0) = false
  | triangle(a, b, c) = a + b >= c andalso a + c >= b andalso b + c >= a;


(*
 *  Type: `real * real * real -> bool`
 *  Description: The triangle inequality theorem states that the sum
 *               of any two sides of a triangle must be greater than
 *               or equal to the third side. This function should
 *               return true if the three real numbers can make a
 *               triangle and false otherwise.
 *)
fun triangleR(a, b, c) = 
  let
    val epsilon = 1.0E~10
    fun is_zero(x) = abs(x) < epsilon
    fun sum_geq_to(a, b, to) = a + b >= to
  in
    not(is_zero(a)) andalso not(is_zero(b)) andalso not(is_zero(c)) andalso
    sum_geq_to(a, b, c) andalso sum_geq_to(a, c, b) andalso sum_geq_to(b, c, a)
  end;


(*
 *  Type: `int * 'a list -> 'a list`
 *  Description: Given an integer n and a list l, cycle n elements
 *               from the list to the end of the list. You can assume
 *               the input for n will be non-negative.
 *  Example: cycle(4,[1,2,3,4,5,6,7]) → [5,6,7,1,2,3,4]
 *)
 fun cycle(0, li) = li
  | cycle(_, []) = []
  | cycle(n, x::xs) = cycle(n - 1, xs @ [x]);