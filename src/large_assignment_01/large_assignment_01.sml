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
  | cycle(n, x::li) = cycle(n - 1, li @ [x]);


(*
 *  Type: `'a list -> 'a list`
 *  Description: Mirror the list. You may not use any reverse function
 *               (even as a helper function).
 *  Example: mirror [1,2,3,4] → [1,2,3,4,4,3,2,1]
 *)
 fun mirror([]) = []
  | mirror(x::li) = x::mirror(li) @ [x];


(*
 *  Type: `int list * int -> int list`
 *  Description: Take a list l and an integer n and return a list that
 *               contains all the elements in l that are greater than
 *               n. Keep the same relative order of items.
 *)
 fun gtList(_, []) = []
  | gtList(n, x::li) = if x > n then x::gtList(n, li) else gtList(n, li);


(*
 *  Type: `''a list * ''a list -> bool`
 *  Description: Return true if the first list is a suffix of the
 *               second list and false otherwise. Do not reverse
 *               either of the lists.
 *)
 fun suffix([], _) = true
  | suffix(_, []) = false
  | suffix(li1, li2) =
    let
      fun listLength([]) = 0
        | listLength(x::li) = 1 + listLength(li)
      fun truncatePrefix(count, x::li) = if count = 0 then x::li else truncatePrefix(count - 1, li)
      fun suffixEqual([], []) = true
        | suffixEqual(x::a, y::b) = if x = y then suffixEqual(a, b) else false
      val truncateCount = listLength(li2) - listLength(li1)
    in
      if truncateCount < 0 then false
      else suffixEqual(li1, truncatePrefix(truncateCount, li2))
    end;


