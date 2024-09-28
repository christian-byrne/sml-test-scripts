(* 
 *  Author: Christian Byrne
 *  Date: 9/27/24
 *  Large Assignment #1
 *  Description: Practice functions in SML, 
 *               focusing on pattern matching 
 *               and recursion.
 *)


(* 
 *  `triangle`
 *
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
  *  `triangleR`
  *
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
