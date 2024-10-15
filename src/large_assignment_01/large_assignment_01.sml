(* 
 *  Author: Christian Byrne
 *  Date: 9/27/24
 *  Large Assignment #01
 *  Desc: Practice functions in SML, focusing on features of the 
 *        language such as pattern matching, currying, partial 
 *        application, and higher-order functions.
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
    fun isZero(x) = abs(x) < epsilon
    fun sumGeqTo(a, b, to) = a + b >= to
  in
    not(isZero(a)) andalso not(isZero(b)) andalso not(isZero(c)) andalso
    sumGeqTo(a, b, c) andalso sumGeqTo(a, c, b) andalso sumGeqTo(b, c, a)
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
 fun gtList([], _) = []
  | gtList(x::li, n) = if x > n then x::gtList(li, n) else gtList(li, n);


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
      (* Handle case: li1 longer than li2 *)
      if truncateCount < 0 then false
      else suffixEqual(li1, truncatePrefix(truncateCount, li2))
    end;


(*
 *  Type: `'a list * int → 'a`
 *  Desc: This function takes a list and an integer i and
 *        returns the ith element in the list. Start the
 *        indexing at 0
 *)
fun get([], _) = raise Empty
  | get(cur::li, 0) = cur
  | get(cur::li, index) = get(li, index - 1);


(*
 *  Type: `'a list * int * int → 'a list`
 *  Desc: This function takes a list and two integers i and j
 *        and returns a subList that includes everything from
 *        the ith to the jth element (inclusive). (Hint: you may
 *        want to use the get function from #7 and since it is
 *        required for #7, it does not need to be included in a
 *        let block here.)
 *)
fun subList([], _, _) = []
  | subList(li, startIndex, endIndex) = 
  let
    fun listLength([]) = 0
      | listLength(x::li) = 1 + listLength(li)
    (* Clamp the end index to the length of the list *)
    val clampedEndIndex = if endIndex > listLength(li) then listLength(li) else endIndex
  in
    (* Handle case: start index greater than end index *)
    if startIndex > clampedEndIndex then []
    (* Base case: start index equals end index *)
    else if startIndex = clampedEndIndex then [get(li, startIndex)]
    else [get(li, startIndex)] @ subList(li, startIndex + 1, clampedEndIndex)
  end;


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
 *    apply((explode “hello”),ord) → [104,101,108,108,111]
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
fun collapse([], startVal, f) = startVal
    (* Associativity: right-to-left with (current, accumulator) *)
  | collapse(cur::li, startVal, f) = f(cur, collapse(li, startVal, f));


(*
 *  Type: `('a * 'a → bool) → 'a list → 'a list`
 *  Desc: Sort a list using the quicksort method, but make it
 *        general enough so that you can pass in a function and
 *        sort in either direction and/or sort various types of
 *        data.
 *)
fun quicksort f [] = []
  | quicksort f (pivot::li) = 
  let
    fun partition([], left, right) = (left, right)
      | partition(cur::li, left, right) = 
      if f(cur, pivot) then partition(li, cur::left, right)
      else partition(li, left, cur::right)
    val (left, right) = partition(li, [], [])
  in
    quicksort f left @ [pivot] @ quicksort f right
  end;


(*
 *  Type: `('a * 'a → bool) → 'a list → 'a list`
 *  Desc: Sort a list using the bubble sort method, but make it
 *        general enough so that you can pass in a function and
 *        sort in either direction and/or sort various types of
 *        data.
 *)
fun bubbleSort f [] = []
  | bubbleSort f li =
    let
      fun swap([]) = []
        | swap(x::[]) = [x]
        | swap(x::y::li) = if f(x, y) then x::swap(y::li) else y::swap(x::li)
      fun listLength([]) = 0
        | listLength(x::li) = 1 + listLength(li)
      (* Perform swap sort on the list *)
      val sorted = swap(li)
      (* Get the last element in the sorted list *)
      val lastInSorted = hd(reverse(sorted))
    in
      (* Keep the last item, recurse on the rest of the list *)
      bubbleSort f (subList(sorted, 0, listLength(sorted) - 2)) @ [lastInSorted]
    end;
      

(*
 *  Type: `('a * 'a → bool) → 'a list → 'a list`
 *  Desc: Sort a list using the insertion sort method, but make it
 *        general enough so that you can pass in a function and
 *        sort in either direction and/or sort various types of
 *        data.
 *)
fun insertionSort f [] = []
  | insertionSort f (pivot::li) =
  let
    fun insert([], pivot) = [pivot]
      | insert(cur::li, pivot) = if f(pivot, cur) then pivot::cur::li else cur::insert(li, pivot)
  in
    insert(insertionSort f li, pivot)
  end;


(*
 *  Type: `string → string → bool`
 *  Desc: Determine if a string is a substring of another
 *        string.
 *)
fun substring "" "" = true
  | substring str "" = false
  | substring "" str = true
  | substring str isIn = 
    let
      fun listLength([]) = 0
        | listLength(x::xs) = 1 + listLength(xs)
      fun stringLength(st) = listLength(explode st)
      fun spliceString(startIndex, endIndex, st) = 
        implode(subList(explode(st), startIndex, endIndex))
      val strLen = stringLength(str)
      val isInLen = stringLength(isIn)
    in
      (* Handle case: not a substring *)
      if strLen > isInLen then false
      else if str = spliceString(0, strLen - 1, isIn) then true
      else substring str (spliceString(1, isInLen - 1, isIn))
    end;


(*
 *  Type: `'a → 'a list → int`
 *  Desc: Determine the index of the first occurrence of a value in a list. 
 *        Indexing should start at 0.
 *)
fun indexOf target li = 
  let
    fun listLength([]) = 0
      | listLength(x::xs) = 1 + listLength(xs)
    fun indexOf(_, []) = 1
      | indexOf(target, x::li) = if x = target then 0 else 1 + indexOf(target, li)
    val result = indexOf(target, li)
    val liLen = listLength(li)
  in
    (* Handle case: target not found -> return -1 *)
    if result > liLen then ~1
    else result
  end;


(*
 *  Type: `int → int → string`
 *  Desc: Turn a decimal number into a string representation of base N. 
 *        The input for N will be an integer between 2 and 10 (inclusive).
 *)
fun dec2BaseN base n =
  let
    fun dec2BaseN base 0 = ""
      | dec2BaseN base n =
          if n < base then Int.toString(n)  (* Base case: n is less than base *)
          else (dec2BaseN base (n div base)) ^ Int.toString(n mod base)
    fun absVal(n) = if n < 0 then ~n else n
    val wasNegative = n < 0
    val result = dec2BaseN base (absVal n)
  in
    (* Handle case where n is exactly 0, return "0" instead of empty string *)
    if result = "" then "0"
    (* Add back the negative sign if n was negative *)
    else if wasNegative then "~" ^ result
    else result
  end;


(*
 *  Type: `int → 'a list → 'a list`
 *  Desc: Drop every nth element in a list.
 *)
fun dropNth _ [] = []
  | dropNth 1 _ = [] 
  | dropNth n li = 
    let
      fun listLength([]) = 0
        | listLength(x::xs) = 1 + listLength(xs)
      val liLen = listLength(li)
    in
      (* Handle bad input: n less than 1 *)
      if n < 1 then li
      (* Base case: next nth beyond list bounds *)
      else if n > liLen then li
      else subList(li, 0, n - 2) @ dropNth n (subList(li, n, liLen - 1))
    end;


(*
 *  Type: `'a list list → 'a list`
 *  Desc: Takes a list of lists and flattens it so that it is
 *        now just a single list of elements. It should contain
 *        all the original elements in the same order, but they
 *        should no longer be separated into lists. This should
 *        be a one-liner using map, foldr, and/or foldl.
 *)
fun flatten li = foldr (fn(cur, acc) => cur @ acc) [] li;


(*
 *  Type: `('a * 'b → 'b) → 'b → 'a list list → 'b list`
 *  Desc: Take a list of lists, a function, and a starting
 *        value. Apply the function recursively to each list,
 *        condensing it to a single value. The result is the
 *        list of the results for each inner list. This should
 *        be a one-liner using map, foldr, and/or foldl.
 *)
fun condenseLists f startVal li = foldr (fn(cur, acc) => collapse(cur, startVal, f)::acc) [] li;


(*
 *  Type: `('a → bool) → 'a list → 'a list`
 *  Desc: Remove all the elements from a list for which the
 *        given function returns true. This should be a
 *        one-liner using map, foldr, and/or foldl
 *)
fun remove f li = foldr (fn(cur, acc) => if f(cur) then acc else cur::acc) [] li;


(*
 *  Type: `'a list → 'a list`
 *  Desc: Take a list and create a new list where every element
 *        is repeated three times. Do not use append.
 *)
fun triplist li = foldr (fn(cur, acc) => cur::cur::cur::acc) [] li;


(*
 *  Type: `'a list → int → 'a list`
 *  Desc: Take a list l and an integer n and create a list that
 *        repeats l n times.
 *)
fun repeat li 0 = []
  | repeat li n = li @ repeat li (n - 1);


(*
 *  Type: `'a list → ('a → bool) → ('a → 'a) → 'a list`
 *  Desc: Takes a list l, a function f, and a function g. It
 *        then returns a list where all the elements in l for
 *        which f is true have g applied to them. You should do
 *        this in one line with map, foldr, and/or foldl.
 *)
fun filterApply li f g = foldr (fn(cur, acc) => if f(cur) then g(cur)::acc else cur::acc) [] li;


(*
 *  Type: `int → int → int → int list`
 *  Desc: Given three integers (a, d, and l), create a
 *        list of length l that contains an arithmetic
 *        sequence starting at a with a common difference
 *        of d. Do not use append or a reverse list
 *        function.
 *)
fun arithSeq a d 0 = []
  | arithSeq a d l = a::arithSeq (a + d) d (l - 1); 


(*
 *  Type: `'a → 'a list → bool`
 *  Desc: Return true if the element is in the list, 
 *        false otherwise.
 *)
fun element x [] = false
  | element x (y::li) = if x = y then true else element x li;


(*
 *  Type: `'a list → bool`
 *  Desc: Return true if the list is a set, meaning that
 *        it has no duplicate values. Return false
 *        otherwise.
 *)
fun isSet([]) = true
  | isSet(x::li) = if indexOf x li = ~1 then isSet(li) else false


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists, which you can assume are
 *        sets, to produce the union of the two sets. The
 *        resulting order of the elements does not matter.
 *)
fun union([], []) = []
  | union(li1, []) = li1
  | union([], li2) = li2
  | union(x::li1, li2) = if element x li2 then union(li1, li2) else x::union(li1, li2);


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists, which you can assume are
 *        sets, to produce the intersection of the two
 *        sets. The resulting order of the elements does
 *        not matter.
 *)
fun intersection(li1, li2) = 
  let
    val liUnion = union(li1, li2)
    fun elementInBoth(x) = element x li1 andalso element x li2
  in
    foldr (fn(cur, acc) => if elementInBoth(cur) then cur::acc else acc) [] liUnion
  end;


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists, which you can assume are
 *        sets, to produce the difference of the two sets
 *        (i.e. the items that are in the first set but
 *        not in the second set.) The resulting order of
 *        the elements does not matter.
 *)
fun difference([], _) = []
  | difference(x::li1, li2) = if element x li2 then difference(li1, li2) else x::difference(li1, li2);


(*
 *  Type: `'a list * 'a list → 'a list`
 *  Desc: Combine two lists, which you can assume are
 *        sets, to produce the xor of the two sets (i.e.
 *        any items that are in one set but not the
 *        other.) The resulting order of the elements does
 *        not matter.
 *)
fun xor(li1, li2) = union(difference(li1, li2), difference(li2, li1));


(*
 *  Type: `'a list → 'a list list`
 *  Desc: Given a list that you can assume is a set,
 *        return the powerset of the set (i.e. the set of
 *        all possible subsets.)
 *)
fun powerset([]) = [[]]
  | powerset(x::li) = 
    let
      val ps = powerset(li)
    in
      ps @ map (fn(cur) => x::cur) ps
    end;

