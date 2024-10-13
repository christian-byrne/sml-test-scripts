(* 
 *  Author: Christian Byrne
 *  Date: 9/27/24
 *  Large Assignment #1
 *  Desc: Practice functions in SML, 
 *        focusing on pattern matching 
 *        and recursion.
 *)


(* 
 *  Type: `int * int * int -> bool`
 *  Desc: The triangle inequality theorem states that the sum of any 
 *        two sides of a triangle must be greater than or equal to the 
 *        third side. This function should return true if the three 
 *        integers can make a triangle and false otherwise.
 *)
fun triangle(0, _, _) = false
  | triangle(_, 0, _) = false
  | triangle(_, _, 0) = false
  | triangle(a, b, c) = a + b >= c andalso a + c >= b andalso b + c >= a;


(*
 *  Type: `real * real * real -> bool`
 *  Desc: The triangle inequality theorem states that the sum
 *        of any two sides of a triangle must be greater than
 *        or equal to the third side. This function should
 *        return true if the three real numbers can make a
 *        triangle and false otherwise.
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
 *  Desc: Given an integer n and a list l, cycle n elements
 *        from the list to the end of the list. You can assume
 *        the input for n will be non-negative.
 *  Example: 
 *    cycle(4,[1,2,3,4,5,6,7]) → [5,6,7,1,2,3,4]
 *)
 fun cycle(0, li) = li
  | cycle(_, []) = []
  | cycle(n, x::li) = cycle(n - 1, li @ [x]);


(*
 *  Type: `'a list -> 'a list`
 *  Desc: Mirror the list. You may not use any reverse function
 *        (even as a helper function).
 *  Example: 
 *    mirror [1,2,3,4] → [1,2,3,4,4,3,2,1]
 *)
 fun mirror([]) = []
  | mirror(x::li) = x::mirror(li) @ [x];


(*
 *  Type: `int list * int -> int list`
 *  Desc: Take a list l and an integer n and return a list that
 *        contains all the elements in l that are greater than
 *        n. Keep the same relative order of items.
 *)
 fun gtList(_, []) = []
  | gtList(n, x::li) = if x > n then x::gtList(n, li) else gtList(n, li);


(*
 *  Type: `''a list * ''a list -> bool`
 *  Desc: Return true if the first list is a suffix of the
 *        second list and false otherwise. Do not reverse
 *        either of the lists.
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



(*
 *  Type: `'a list * int → 'a`
 *  Desc: This function takes a list and an integer i and
 *        returns the ith element in the list. Start the
 *        indexing at 0
 *)
fun get(cur::li, 0) = cur
 |  get(cur::li, index) = get(li, index - 1);



(*
 *  Type: `'a list * int * int → 'a list`
 *  Desc: This function takes a list and two integers i and j
 *        and returns a subList that includes everything from
 *        the ith to the jth element (inclusive). (Hint: you may
 *        want to use the get function from #7 and since it is
 *        required for #7, it does not need to be included in a
 *        let block here.)
 *)
fun subList(li, startIndex, endIndex) = if startIndex = endIndex then [get(li, startIndex)] else [get(li, startIndex)] @ subList(li, startIndex + 1, endIndex);

(*
 *  Type: `'a list → 'a list`
 *  Desc: Reverse the list without using append
 *)
fun reverse li = foldl (fn(cur, acc) => cur::acc) [] li;

(*
 *  Type: `'a list * ('a → 'b) → 'b list`
 *  Desc: Apply a function to a list of elements. You may not
 *        use map, foldr, or foldl.
 *  Example:
 *    apply([(1,2),(3,4),(5,6)],(op +)) → [3,7,11]
 *    apply((explode “hello”),ord) → [104,101,108,108,111
 *)
fun apply([], f) = []
  | apply(x::li, f) = [f(x)] @ apply(li, f);



(*
 *  Type: `'a list * 'b * ('a * 'b → 'b) → 'b`
 *  Desc: Take a list, a starting value, and a function and
 *        collapse the list down using the function. You may
 *        not use map, foldr, or foldl.
 *  Examples:
 *    collapse([1,2,3,4,5],0,(op +)) → 15
 *    collapse([1.1,2.2,3.3],10.0,(op -)) → ~7.8
 *)
fun collapse([], startVal, func) = startVal
  | collapse(cur::li, startVal, func) = func(cur, collapse(li, startVal, func));

(* TODO: fun quicksort = fun *)

(* TODO: fun bubbleSort = fun *)
(* TODO: fun insertionSort = fun *)

(*
 *  Type: `string → string → bool`
 *  Desc: Determine if a string is a substring of another
 *        string.
 *)
fun substring(str, "") = false
  | substring(str, isIn) = if String.size(str) = String.size(isIn) then false else if str = String.substring(isIn, 0, String.size(str)) then true else substring(str, 
    String.substring(
      isIn, 
      1, 
      String.size(isIn)
    )
  );


(*
 *  Type: `'a → 'a list → int`
 *  Desc: Determine the index of the first occurrence of a value in a list. 
 *        Indexing should start at 0.
 *)
fun indexOf(_, []) = ~1
  | indexOf(x, y::ys) = if x = y then 0 else 1 + indexOf(x, ys);


(*
 *  Type: `int → int → string`
 *  Desc: Turn a decimal number into a string representation of base N. 
 *        The input for N will be an integer between 2 and 10 (inclusive).
 *)
fun dec2BaseN(num, base) = (* Implementation pending *);


(*
 *  Type: `int → 'a list → 'a list`
 *  Desc: Drop every nth element in a list.
 *)
fun dropNth(_, []) = []
  | dropNth(n, xs) = (* Implementation pending *);


(*
 *  Type: `'a list list → 'a list`
 *  Desc: Flatten a list of lists into a single list of elements.
 *)
fun flatten(li) = List.concat(li);


(*
 *  Type: `('a * 'b → 'b) → 'b → 'a list list → 'b list`
 *  Desc: Take a list of lists, a function, and a starting value. 
 *        Apply the function recursively to each list, condensing it to a single value.
 *)
fun condenseLists(f, startVal, lists) = List.map (fn xs => List.foldl f startVal xs) lists;


(*
 *  Type: `('a → bool) → 'a list → 'a list`
 *  Desc: Remove all elements from a list for which the given function returns true.
 *)
fun remove(f, xs) = List.filter (fn x => not (f x)) xs;


(*
 *  Type: `'a list → 'a list`
 *  Desc: Take a list and create a new list where every element is repeated three times.
 *)
fun triplist(xs) = List.concat (List.map (fn x => [x, x, x]) xs);


(*
 *  Type: `'a list → int → 'a list`
 *  Desc: Take a list and an integer n and create a list that repeats the original list n times.
 *)
fun repeat(_, 0) = []
  | repeat(xs, n) = xs @ repeat(xs, n - 1);


(*
 *  Type: `'a list → ('a → bool) → ('a → 'a) → 'a list`
 *  Desc: Apply function g to all elements in the list for which function f returns true.
 *)
fun filterApply(xs, f, g) = List.map (fn x => if f x then g x else x) xs;


(*
 *  Type: `int → int → int → int list`
 *  Desc: Create an arithmetic sequence starting at a with a common difference of d 
 *        and a length of l.
 *)
fun arithSeq(a, d, l) = List.tabulate(l, fn i => a + i * d);


(*
 *  Type: `'a → 'a list → bool`
 *  Desc: Return true if the element is in the list, false otherwise.
 *)
fun element(x, xs) = List.exists (fn y => y = x) xs;


(*
 *  Type: `'a list → bool`
 *  Desc: Return true if the list is a set (no duplicates), false otherwise.
 *)
fun isSet(xs) = xs = List.tabulate(List.length xs, fn i => List.nth(xs, i));


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists to produce the union of the two sets.
 *)
fun union(xs, ys) = List.concat [xs, ys];


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists to produce the intersection of the two sets.
 *)
fun intersection(xs, ys) = List.filter (fn x => List.exists (fn y => x = y) ys) xs;


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Produce the difference of two sets (items in the first but not in the second).
 *)
fun difference(xs, ys) = List.filter (fn x => not (List.exists (fn y => y = x) ys)) xs;


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Produce the xor of two sets (items in one set but not both).
 *)
fun xor(xs, ys) = difference(union(xs, ys), intersection(xs, ys));


(*
 *  Type: `'a list → 'a list list`
 *  Desc: Return the powerset of a set.
 *)
fun powerset([]) = [[]]
  | powerset(x::xs) = let
      val rest = powerset(xs)
    in
      rest @ List.map (fn ys => x::ys) rest
    end;


