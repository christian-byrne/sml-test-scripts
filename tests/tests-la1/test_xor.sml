(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Helper function to compare lists as sets (order doesn't matter) *)
fun isEqualSet([], []) = true
  | isEqualSet(x::xs, ys) = List.exists (fn y => y = x) ys 
                            andalso isEqualSet(xs, List.filter (fn y => y <> x) ys)
  | isEqualSet(_, _) = false;

(* Test cases for integer lists *)
val testCasesXorInt = [
  (* 1. XOR of two disjoint sets (should return all elements) *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2], [3, 4]), [1, 2, 3, 4]),

  (* 2. XOR of two sets with some common elements *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3], [2, 3, 4]), [1, 4]),
  
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3], [2, 3, 4, 5]), [1, 4, 5]),

  (* 3. XOR of two identical sets (should return empty) *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3], [1, 2, 3]), []),

  (* 4. XOR when the first set is empty *)
  (fn (li1, li2) => xor(li1, li2), ([], [1, 2, 3]), [1, 2, 3]),

  (* 5. XOR when the second set is empty *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3], []), [1, 2, 3]),

  (* 6. XOR with negative numbers *)
  (fn (li1, li2) => xor(li1, li2), ([~1, ~2, 3], [3]), [~1, ~2]),

  (* 7. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3, 4, 5, 6], [2, 4]), [1, 3, 5, 6]),

  (* 8. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2], [2, 3, 4, 5, 6]), [1, 3, 4, 5, 6]),

  (* 9. XOR with only one element in common *)
  (fn (li1, li2) => xor(li1, li2), ([1, 2, 3], [3, 4]), [1, 2, 4])
];

runTestsCustomComparator(
  testCasesXorInt,
  fn (li1, li2) => "xor(" ^ valueToStringIntList li1 ^ ", " ^ valueToStringIntList li2 ^ ")",
  valueToStringIntList,
  isEqualSet
);

(* Test cases for string lists *)
val testCasesXorString = [
  (* 1. XOR of two disjoint sets of strings *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b"], ["c", "d"]), ["a", "b", "c", "d"]),

  (* 2. XOR of two sets with some common strings *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b", "c"], ["b", "c", "d"]), ["a", "d"]),

  (* 3. XOR of two identical sets of strings (should return empty) *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b", "c"], ["a", "b", "c"]), []),

  (* 4. XOR when the first set is empty *)
  (fn (li1, li2) => xor(li1, li2), ([], ["a", "b", "c"]), ["a", "b", "c"]),

  (* 5. XOR when the second set is empty *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b", "c"], []), ["a", "b", "c"]),

  (* 6. XOR with only one element in common *)
  (fn (li1, li2) => xor(li1, li2), (["x", "y"], ["y", "z"]), ["x", "z"]),

  (* 7. List 1 longer by more than 3 elements *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b", "c", "d", "e", "f"], ["c", "e"]), ["a", "b", "d", "f"]),

  (* 8. List 2 longer by more than 3 elements *)
  (fn (li1, li2) => xor(li1, li2), (["a", "b"], ["b", "c", "d", "e", "f"]), ["a", "c", "d", "e", "f"])
];

runTestsCustomComparator(
  testCasesXorString,
  fn (li1, li2) => "xor(" ^ valueToStringStringList li1 ^ ", " ^ valueToStringStringList li2 ^ ")",
  valueToStringStringList,
  isEqualSet
);
