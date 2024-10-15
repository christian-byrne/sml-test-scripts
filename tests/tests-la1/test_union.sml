(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Helper function to compare lists as sets (order doesn't matter) *)
fun isEqualSet([], []) = true
  | isEqualSet(x::xs, ys) = List.exists (fn y => y = x) ys 
                            andalso isEqualSet(xs, List.filter (fn y => y <> x) ys)
  | isEqualSet(_, _) = false;

(* Test cases for integer lists *)
val testCasesUnionInt = [
  (* 1. Union of two disjoint sets *)
  (fn (li1, li2) => union(li1, li2), ([1, 2], [3, 4]), [1, 2, 3, 4]),
  
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3], [2, 3, 4, 5]), [1, 2, 3, 4, 5]),

  (* 2. Union of two sets with common elements *)
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3], [3, 4, 5]), [1, 2, 3, 4, 5]),

  (* 3. Union with an empty set (first set empty) *)
  (fn (li1, li2) => union(li1, li2), ([], [1, 2, 3]), [1, 2, 3]),

  (* 4. Union with an empty set (second set empty) *)
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3], []), [1, 2, 3]),

  (* 5. Union of two identical sets *)
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3], [1, 2, 3]), [1, 2, 3]),

  (* 6. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3, 4, 5, 6], [7, 8]), [1, 2, 3, 4, 5, 6, 7, 8]),

  (* 7. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => union(li1, li2), ([1, 2], [3, 4, 5, 6, 7, 8]), [1, 2, 3, 4, 5, 6, 7, 8]),

  (* 8. List 1 longer by 1 element *)
  (fn (li1, li2) => union(li1, li2), ([1, 2, 3], [4, 5]), [1, 2, 3, 4, 5]),

  (* 9. List 2 longer by 1 element *)
  (fn (li1, li2) => union(li1, li2), ([1, 2], [3, 4, 5]), [1, 2, 3, 4, 5]),

  (* 10. Union with negative and positive numbers *)
  (fn (li1, li2) => union(li1, li2), ([~1, 2], [~1, 3]), [~1, 2, 3])
];

runTestsCustomComparator(
  testCasesUnionInt,
  fn (li1, li2) => "union(" ^ valueToStringIntList li1 ^ ", " ^ valueToStringIntList li2 ^ ")",
  valueToStringIntList,
  isEqualSet
);

(* Test cases for string lists *)
val testCasesUnionString = [
  (* 1. Union of two disjoint sets of strings *)
  (fn (li1, li2) => union(li1, li2), (["a", "b"], ["c", "d"]), ["a", "b", "c", "d"]),

  (* 2. Union of two sets with common strings *)
  (fn (li1, li2) => union(li1, li2), (["a", "b", "c"], ["c", "d", "e"]), ["a", "b", "c", "d", "e"]),

  (* 3. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => union(li1, li2), (["a", "b", "c", "d", "e", "f"], ["g", "h"]), ["a", "b", "c", "d", "e", "f", "g", "h"]),

  (* 4. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => union(li1, li2), (["a", "b"], ["c", "d", "e", "f", "g", "h"]), ["a", "b", "c", "d", "e", "f", "g", "h"]),

  (* 5. List 1 longer by 1 element *)
  (fn (li1, li2) => union(li1, li2), (["a", "b", "c"], ["d", "e"]), ["a", "b", "c", "d", "e"]),

  (* 6. List 2 longer by 1 element *)
  (fn (li1, li2) => union(li1, li2), (["a", "b"], ["c", "d", "e"]), ["a", "b", "c", "d", "e"]),

  (* 7. Union with repeated strings (sets are assumed) *)
  (fn (li1, li2) => union(li1, li2), (["foo"], ["foo"]), ["foo"])
];

runTestsCustomComparator(
  testCasesUnionString,
  fn (li1, li2) => "union(" ^ valueToStringStringList li1 ^ ", " ^ valueToStringStringList li2 ^ ")",
  valueToStringStringList,
  isEqualSet
);
