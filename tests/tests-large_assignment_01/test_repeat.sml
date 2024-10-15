(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesRepeatInt = [
  (* 1. Repeat a list 3 times *)
  (fn (li, n) => repeat li n, ([1, 2, 3], 3), [1, 2, 3, 1, 2, 3, 1, 2, 3]),

  (* 2. Repeat a list with a single element 2 times *)
  (fn (li, n) => repeat li n, ([42], 2), [42, 42]),

  (* 3. Repeat an empty list (should always return an empty list) *)
  (fn (li, n) => repeat li n, ([], 5), []),
  
  (fn (li, n) => repeat li n, ([1,2], 4), [1,2,1,2,1,2,1,2]),

  (* 4. Repeat a list with repeated elements 4 times *)
  (fn (li, n) => repeat li n, ([1, 1, 2], 4), [1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2]),

  (* 5. Repeat a list with negative numbers 3 times *)
  (fn (li, n) => repeat li n, ([~1, ~2, 0], 3), [~1, ~2, 0, ~1, ~2, 0, ~1, ~2, 0]),

  (* 6. Repeat with n = 0 (should return an empty list) *)
  (fn (li, n) => repeat li n, ([1, 2, 3], 0), [])
];

runTestsCustomComparator(
  testCasesRepeatInt,
  fn (li, n) => "repeat " ^ valueToStringIntList li ^ " " ^ Int.toString n,
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesRepeatString = [
  (* 1. Repeat a list of strings 2 times *)
  (fn (li, n) => repeat li n, (["a", "b", "c"], 2), ["a", "b", "c", "a", "b", "c"]),

  (* 2. Repeat a list with a single string 3 times *)
  (fn (li, n) => repeat li n, (["hello"], 3), ["hello", "hello", "hello"]),

  (* 3. Repeat an empty list (should always return an empty list) *)
  (fn (li, n) => repeat li n, ([], 4), []),

  (* 4. Repeat a list with repeated strings 5 times *)
  (fn (li, n) => repeat li n, (["foo", "foo"], 5), ["foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo"]),

  (* 5. Repeat a list of strings 0 times (should return an empty list) *)
  (fn (li, n) => repeat li n, (["x", "y"], 0), [])
];

runTestsCustomComparator(
  testCasesRepeatString,
  fn (li, n) => "repeat " ^ valueToStringStringList li ^ " " ^ Int.toString n,
  valueToStringStringList,
  isEqualList
);
