(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesFlattenInt = [
  (fn li => flatten li, [[]], []),
  (fn li => flatten li, [[1, 2, 3]], [1, 2, 3]),
  (fn li => flatten li, [[1, 2], [3, 4], [5, 6]], [1, 2, 3, 4, 5, 6]),
  (fn li => flatten li, [[], [], []], []),
  (fn li => flatten li, [[1, 2], [], [3], []], [1, 2, 3]),
  (fn li => flatten li, [[1], [2], [3]], [1, 2, 3]),
  
  (fn li => flatten li, [[], [1,2,3], [4,5,6], [], [8,9]], [1,2,3,4,5,6,8,9]),
  
  (fn li => flatten li, [[1, 1], [2, 2], [3, 3]], [1, 1, 2, 2, 3, 3])
];

runTestsCustomComparator(
  testCasesFlattenInt,
  fn li => "flatten(" ^ valueToStringIntListList li ^ ")",
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesFlattenString = [
  (fn li => flatten li, [["a"], ["b", "c"], ["d"]], ["a", "b", "c", "d"]),
  (fn li => flatten li, [["a", "b"], [], ["c"]], ["a", "b", "c"]),
  (fn li => flatten li, [["x"], ["y"], ["z"]], ["x", "y", "z"]),
  (fn li => flatten li, [["foo", "foo"], ["bar", "bar"]], ["foo", "foo", "bar", "bar"])
];

runTestsCustomComparator(
  testCasesFlattenString,
  fn li => "flatten(" ^ valueToStringStringListList li ^ ")",
  valueToStringStringList,
  isEqualList
);

(* Test cases for mixed lists (if allowed)
val testCasesFlattenMixed = [
  (fn li => flatten li, [[1, 2], ["a", "b"]], [1, 2, "a", "b"])
];

runTestsCustomComparator(
  testCasesFlattenMixed,
  fn li => "flatten(" ^ valueToStringMixedListList li ^ ")",
  valueToStringMixedList,
  isEqualList
); *)
