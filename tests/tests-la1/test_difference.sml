(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Helper function to compare lists as sets (order doesn't matter) *)
fun isEqualSet([], []) = true
  | isEqualSet(x::xs, ys) = List.exists (fn y => y = x) ys 
                            andalso isEqualSet(xs, List.filter (fn y => y <> x) ys)
  | isEqualSet(_, _) = false;

(* Test cases for integer lists *)
val testCasesDifferenceInt = [
  (* 1. Difference of two disjoint sets (should return the first set) *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2], [3, 4]), [1, 2]),

  (* 2. Difference of two sets with some common elements *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3], [2, 3, 4]), [1]),

  (* 3. Difference when the first set is empty *)
  (fn (li1, li2) => difference(li1, li2), ([], [1, 2, 3]), []),
  
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3], [2, 3, 4, 5]), [1]),

  (* 4. Difference when the second set is empty *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3], []), [1, 2, 3]),

  (* 5. Difference of two identical sets (should return empty) *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3], [1, 2, 3]), []),

  (* 6. Difference with negative numbers *)
  (fn (li1, li2) => difference(li1, li2), ([~1, ~2, 3], [3]), [~1, ~2]),

  (* 7. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3, 4, 5, 6], [2, 4]), [1, 3, 5, 6]),

  (* 8. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2], [2, 3, 4, 5, 6]), [1]),

  (* 9. List 1 longer by 1 element *)
  (fn (li1, li2) => difference(li1, li2), ([1, 2, 3], [2, 3]), [1]),

  (* 10. List 2 longer by 1 element *)
  (fn (li1, li2) => difference(li1, li2), ([2, 3], [1, 2, 3]), [])
];

runTestsCustomComparator(
  testCasesDifferenceInt,
  fn (li1, li2) => "difference(" ^ valueToStringIntList li1 ^ ", " ^ valueToStringIntList li2 ^ ")",
  valueToStringIntList,
  isEqualSet
);

(* Test cases for string lists *)
val testCasesDifferenceString = [
  (* 1. Difference of two disjoint sets of strings (should return the first set) *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b"], ["c", "d"]), ["a", "b"]),

  (* 2. Difference of two sets with some common strings *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b", "c"], ["b", "c", "d"]), ["a"]),

  (* 3. Difference when the first set is empty *)
  (fn (li1, li2) => difference(li1, li2), ([], ["a", "b", "c"]), []),

  (* 4. Difference when the second set is empty *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b", "c"], []), ["a", "b", "c"]),

  (* 5. Difference of two identical sets of strings (should return empty) *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b", "c"], ["a", "b", "c"]), []),

  (* 6. Difference with one common element *)
  (fn (li1, li2) => difference(li1, li2), (["x", "y"], ["y", "z"]), ["x"]),

  (* 7. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b", "c", "d", "e", "f"], ["c", "e"]), ["a", "b", "d", "f"]),

  (* 8. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => difference(li1, li2), (["a", "b"], ["b", "c", "d", "e", "f"]), ["a"]),

  (* 9. Difference with repeated strings (sets are assumed) *)
  (fn (li1, li2) => difference(li1, li2), (["foo"], ["foo"]), [])
];

runTestsCustomComparator(
  testCasesDifferenceString,
  fn (li1, li2) => "difference(" ^ valueToStringStringList li1 ^ ", " ^ valueToStringStringList li2 ^ ")",
  valueToStringStringList,
  isEqualSet
);
