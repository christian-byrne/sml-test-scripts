(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

val testCasesApplyInt = [
  (* 1. Empty list (should return empty list) *)
  (apply, ([], fn x => x + 1), []),

  (* 2. Single-element list *)
  (apply, ([2], fn x => x * 2), [4]),

  (* 3. List of integers with addition function *)
  (apply, ([1, 2, 3], fn x => x + 1), [2, 3, 4])
];

runTests(
  testCasesApplyInt,
  fn (li, f) => valueToStringIntList li ^ " with a function",
  valueToStringIntList
);

val testCasesApplyBool = [
  (* 1. List of booleans negated *)
  (apply, ([true, false, true], not), [false, true, false]),

  (* 2. Empty boolean list *)
  (apply, ([], not), []),

  (* 3. List with alternating booleans *)
  (apply, ([true, false, true, false], not), [false, true, false, true])
];

runTests(
  testCasesApplyBool,
  fn (li, f) => valueToStringBoolList li ^ " with a function",
  valueToStringBoolList
);

val testCasesApplyString = [
  (* 1. List of single-character strings (convert to ord) *)
  (apply, ([#"a", #"b", #"c"], ord), [97, 98, 99]),

  (* 2. List with repeated characters *)
  (apply, ([#"a", #"a", #"c", #"c"], ord), [97, 97, 99, 99])
];

runTests(
  testCasesApplyString,
  fn (li, f) => valueToStringCharList li ^ " with a function",
  valueToStringIntList
);
