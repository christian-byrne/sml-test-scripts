(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testCasesReverseInt = [
  (* 1. Empty list (should remain empty) *)
  (reverse, ([]), []),

  (* 2. Single-element list (should remain the same) *)
  (reverse, ([1]), [1]),

  (* 3. Two-element list *)
  (reverse, ([1, 2]), [2, 1]),

  (* 4. Three-element list *)
  (reverse, ([1, 2, 3]), [3, 2, 1]),

  (* 5. List with duplicate elements *)
  (reverse, ([1, 2, 2, 3]), [3, 2, 2, 1]),

  (* 6. List with negative numbers *)
  (reverse, ([~1, ~2, ~3]), [~3, ~2, ~1]),
  
  (reverse, ([1,2,3,4]), [4,3,2,1]),

  (* 7. Large list (reversal should be correct) *)
  (* (reverse, (List.tabulate(10, fn i => i + 1)), List.tabulate(10, fn i => 10 - i)), *)

  (* 8. List with alternating elements *)
  (reverse, ([1, 0, 1, 0]), [0, 1, 0, 1])
];

runTests(
  testCasesReverseInt,
  valueToStringIntList,
  valueToStringIntList
);

val testCasesReverseBool = [
  (* 1. List with booleans *)
  (reverse, ([true, false, true]), [true, false, true]),

  (* 2. All true values *)
  (reverse, ([true, true, true]), [true, true, true]),

  (* 3. All false values *)
  (reverse, ([false, false, false]), [false, false, false]),

  (* 4. Single boolean element *)
  (reverse, ([true]), [true]),

  (* 5. Empty boolean list *)
  (reverse, ([]), [])
];

runTests(
  testCasesReverseBool,
  valueToStringBoolList,
  valueToStringBoolList
);

val testCasesReverseString = [
  (* 1. List of strings *)
  (reverse, (["a", "b", "c"]), ["c", "b", "a"]),

  (* 2. List with repeated strings *)
  (reverse, (["x", "x", "y"]), ["y", "x", "x"]),

  (* 3. List with one string *)
  (reverse, (["hello"]), ["hello"]),

  (* 4. Empty string list *)
  (reverse, ([]), [])
];

runTests(
  testCasesReverseString,
  valueToStringStringList,
  valueToStringStringList
);
