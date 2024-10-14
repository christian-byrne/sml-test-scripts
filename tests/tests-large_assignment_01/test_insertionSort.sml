(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Integer Test Cases *)
val testCasesInsertionSortInt = [
  (fn li => insertionSort (fn (a, b) => a < b) li, [42], [42]),
  (fn li => insertionSort (fn (a, b) => a < b) li, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]),
  (fn li => insertionSort (fn (a, b) => a < b) li, [5, 4, 3, 2, 1], [1, 2, 3, 4, 5]),
  (fn li => insertionSort (fn (a, b) => a < b) li, [3, 1, 4, 1, 5], [1, 1, 3, 4, 5]),
  (fn li => insertionSort (fn (a, b) => a > b) li, [1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
  (fn li => insertionSort (fn (a, b) => a < b) li, [3, ~1, ~2, 5, 0], [~2, ~1, 0, 3, 5]),
  (fn li => insertionSort (fn (a, b) => a < b) li, [], []),
  (fn li => insertionSort (fn (a, b) => a < b) li, [1, 1, 1, 1], [1, 1, 1, 1])
];

runTestsCustomComparator(
  testCasesInsertionSortInt,
  fn li => "insertionSort on " ^ valueToStringIntList(li),
  valueToStringIntList,
  isEqualList
);

(* String Test Cases *)
val testCasesInsertionSortString = [
  (fn li => insertionSort (fn (a, b) => String.compare(a, b) = LESS) li, [], []),
  (fn li => insertionSort (fn (a, b) => String.compare(a, b) = LESS) li, ["hello"], ["hello"]),
  (fn li => insertionSort (fn (a, b) => String.compare(a, b) = LESS) li, ["apple", "banana", "cherry"], ["apple", "banana", "cherry"]),
  (fn li => insertionSort (fn (a, b) => String.compare(a, b) = GREATER) li, ["apple", "banana", "cherry"], ["cherry", "banana", "apple"]),
  (fn li => insertionSort (fn (a, b) => String.compare(a, b) = LESS) li, ["a", "b", "a", "c"], ["a", "a", "b", "c"])
];

runTestsCustomComparator(
  testCasesInsertionSortString,
  fn li => "insertionSort on " ^ valueToStringStringList(li),
  valueToStringStringList,
  isEqualList
);

(* Boolean Test Cases *)
val testCasesInsertionSortBool = [
  (fn li => insertionSort (fn (a, b) => a = false andalso b = true) li, [true, false, true], [false, true, true]),
  (fn li => insertionSort (fn (a, b) => a = true andalso b = false) li, [false, true, false], [true, false, false]),
  (fn li => insertionSort (fn (a, b) => a = false andalso b = true) li, [false, false, false], [false, false, false]),
  (fn li => insertionSort (fn (a, b) => a = false andalso b = true) li, [true, true, true], [true, true, true])
];

runTestsCustomComparator(
  testCasesInsertionSortBool,
  fn li => "insertionSort on " ^ valueToStringBoolList(li),
  valueToStringBoolList,
  isEqualList
);
