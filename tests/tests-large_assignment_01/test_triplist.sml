(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesTriplistInt = [
  (* 1. List with multiple elements *)
  (fn li => triplist li, [1, 2, 3], [1, 1, 1, 2, 2, 2, 3, 3, 3]),

  (* 2. List with a single element *)
  (fn li => triplist li, [42], [42, 42, 42]),
  
  (fn li => triplist li, [1,2,3], [1,1,1,2,2,2,3,3,3]),

  (* 3. Empty list (should return an empty list) *)
  (fn li => triplist li, [], []),

  (* 4. List with repeated elements *)
  (fn li => triplist li, [2, 2, 3], [2, 2, 2, 2, 2, 2, 3, 3, 3]),

  (* 5. List with negative numbers *)
  (fn li => triplist li, [~1, ~2, 0], [~1, ~1, ~1, ~2, ~2, ~2, 0, 0, 0])
];

runTestsCustomComparator(
  testCasesTriplistInt,
  fn li => "triplist " ^ valueToStringIntList li,
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesTriplistString = [
  (* 1. List with multiple strings *)
  (fn li => triplist li, ["a", "b", "c"], ["a", "a", "a", "b", "b", "b", "c", "c", "c"]),

  (* 2. List with a single string *)
  (fn li => triplist li, ["hello"], ["hello", "hello", "hello"]),

  (* 3. Empty list (should return an empty list) *)
  (fn li => triplist li, [], []),

  (* 4. List with repeated strings *)
  (fn li => triplist li, ["foo", "foo", "bar"], ["foo", "foo", "foo", "foo", "foo", "foo", "bar", "bar", "bar"])
];

runTestsCustomComparator(
  testCasesTriplistString,
  fn li => "triplist " ^ valueToStringStringList li,
  valueToStringStringList,
  isEqualList
);
