(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Helper function to compare lists as sets (order doesn't matter) *)
fun isEqualSet([], []) = true
  | isEqualSet(x::xs, ys) = List.exists (fn y => y = x) ys 
                            andalso isEqualSet(xs, List.filter (fn y => y <> x) ys)
  | isEqualSet(_, _) = false;

(* Test cases for integer lists *)
val testCasesIntersectionInt = [
  (* 1. Intersection of two disjoint sets (should be empty) *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2], [3, 4]), []),

  (* 2. Intersection of two sets with some common elements *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3], [2, 3, 4]), [2, 3]),

  (* 3. Intersection of two identical sets *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3], [1, 2, 3]), [1, 2, 3]),

  (* 4. Intersection with an empty set (first set empty) *)
  (fn (li1, li2) => intersection(li1, li2), ([], [1, 2, 3]), []),
  
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3], [2, 3, 4, 5]), [2, 3]),

  (* 5. Intersection with an empty set (second set empty) *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3], []), []),

  (* 6. Intersection with negative numbers *)
  (fn (li1, li2) => intersection(li1, li2), ([~1, ~2, 3], [3, ~1]), [~1, 3]),

  (* 7. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3, 4, 5, 6], [2, 4]), [2, 4]),

  (* 8. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => intersection(li1, li2), ([2, 4], [1, 2, 3, 4, 5, 6]), [2, 4]),

  (* 9. List 1 longer by 1 element *)
  (fn (li1, li2) => intersection(li1, li2), ([1, 2, 3], [2, 3]), [2, 3]),

  (* 10. List 2 longer by 1 element *)
  (fn (li1, li2) => intersection(li1, li2), ([2, 3], [1, 2, 3]), [2, 3])
];

runTestsCustomComparator(
  testCasesIntersectionInt,
  fn (li1, li2) => "intersection(" ^ valueToStringIntList li1 ^ ", " ^ valueToStringIntList li2 ^ ")",
  valueToStringIntList,
  isEqualSet
);

(* Test cases for string lists *)
val testCasesIntersectionString = [
  (* 1. Intersection of two disjoint sets of strings (should be empty) *)
  (fn (li1, li2) => intersection(li1, li2), (["a", "b"], ["c", "d"]), []),

  (* 2. Intersection of two sets with some common strings *)
  (fn (li1, li2) => intersection(li1, li2), (["a", "b", "c"], ["b", "c", "d"]), ["b", "c"]),

  (* 3. Intersection of two identical sets of strings *)
  (fn (li1, li2) => intersection(li1, li2), (["a", "b", "c"], ["a", "b", "c"]), ["a", "b", "c"]),

  (* 4. Intersection with an empty set (first set empty) *)
  (fn (li1, li2) => intersection(li1, li2), ([], ["a", "b", "c"]), []),

  (* 5. Intersection with an empty set (second set empty) *)
  (fn (li1, li2) => intersection(li1, li2), (["a", "b", "c"], []), []),

  (* 6. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => intersection(li1, li2), (["a", "b", "c", "d", "e", "f"], ["c", "e"]), ["c", "e"]),

  (* 7. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => intersection(li1, li2), (["c", "e"], ["a", "b", "c", "d", "e", "f"]), ["c", "e"]),

  (* 8. Intersection with one common element *)
  (fn (li1, li2) => intersection(li1, li2), (["x", "y"], ["y", "z"]), ["y"]),

  (* 9. No common elements between the lists *)
  (fn (li1, li2) => intersection(li1, li2), (["foo", "bar"], ["baz", "qux"]), [])
];

runTestsCustomComparator(
  testCasesIntersectionString,
  fn (li1, li2) => "intersection(" ^ valueToStringStringList li1 ^ ", " ^ valueToStringStringList li2 ^ ")",
  valueToStringStringList,
  isEqualSet
);
