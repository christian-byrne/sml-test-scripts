(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testCasesSubListInt = [
  (* 1. Start index equals end index (single element) *)
  (subList, ([1, 2, 3], 1, 1), [2]),

  (* 2. Start index greater than end index (should return empty list) *)
  (subList, ([1, 2, 3], 2, 1), []),

  (* 3. Empty input list (should return empty list) *)
  (subList, ([], 0, 0), []),

  (* 4. Sublist with all elements (entire list) *)
  (subList, ([1, 2, 3, 4], 0, 3), [1, 2, 3, 4]),

  (* 5. Sublist starting from index 0 to end of list *)
  (subList, ([5, 6, 7, 8], 0, 3), [5, 6, 7, 8]),

  (* 6. Sublist of a single element at the last index *)
  (subList, ([10, 20, 30, 40], 3, 3), [40]),
  
  (subList, ([1,2,3,4,5], 1, 3), [2,3,4]),

  (* 7. Large list with sublist in the middle *)
  (* (subList, (List.tabulate(100, fn i => i + 1), 50, 55), [51, 52, 53, 54, 55, 56]), *)

  (* 8. List with negative numbers (partial sublist) *)
  (subList, ([~1, ~2, ~3, ~4], 1, 2), [~2, ~3]),

  (* 9. List with duplicate elements (sublist with repetitions) *)
  (subList, ([1, 2, 2, 3], 1, 3), [2, 2, 3]),
  
  (subList, ([1, 2, 3, 4, 5], 1, 3), [2, 3, 4]),

  (subList, ([1, 2, 2, 3], 0, 1), [1, 2]),
  
  (* 10. Start index out of range (empty result) *)
  (subList, ([1, 2, 3], 5, 6), [])
];

runTests(
  testCasesSubListInt,
  fn (li, i, j) => "(" ^ valueToStringIntList li ^ ", " ^ Int.toString i ^ ", " ^ Int.toString j ^ ")",
  valueToStringIntList
);

val testCasesSubListBool = [
  (* 1. Sublist of all elements (entire list) *)
  (subList, ([true, false, true], 0, 2), [true, false, true]),

  (* 2. Start index equals end index (single element) *)
  (subList, ([false, true], 1, 1), [true]),

  (* 3. Start index greater than end index (empty list) *)
  (subList, ([true, false], 1, 0), []),

  (* 4. Sublist from middle to end *)
  (subList, ([true, false, true, false], 2, 3), [true, false])
];

runTests(
  testCasesSubListBool,
  fn (li, i, j) => "(" ^ valueToStringBoolList li ^ ", " ^ Int.toString i ^ ", " ^ Int.toString j ^ ")",
  valueToStringBoolList
);

val testCasesSubListString = [
  (* 1. Sublist of all elements (entire list) *)
  (subList, (["a", "b", "c"], 0, 2), ["a", "b", "c"]),

  (* 2. Single-element sublist (last element) *)
  (subList, (["x", "y", "z"], 2, 2), ["z"]),

  (* 3. Start index greater than end index (empty list) *)
  (subList, (["x", "y", "z"], 2, 1), []),

  (* 4. Sublist with repeated strings *)
  (subList, (["a", "a", "b"], 1, 2), ["a", "b"]),

  (* 5. Empty input list (should return empty list) *)
  (subList, ([], 0, 0), [])
];

runTests(
  testCasesSubListString,
  fn (li, i, j) => "(" ^ valueToStringStringList li ^ ", " ^ Int.toString i ^ ", " ^ Int.toString j ^ ")",
  valueToStringStringList
);
