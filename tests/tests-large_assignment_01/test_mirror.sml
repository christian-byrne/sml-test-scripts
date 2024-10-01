(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

val testCasesMirrorInt = [
  (* 1. Empty list case *)
  (mirror, ([]), []),

  (* 2. Single element list *)
  (mirror, ([1]), [1, 1]),

  (* 3. Two element list *)
  (mirror, ([1, 2]), [1, 2, 2, 1]),

  (* 4. Three element list *)
  (mirror, ([1, 2, 3]), [1, 2, 3, 3, 2, 1]),

  (* 5. Four element list *)
  (mirror, ([1, 2, 3, 4]), [1, 2, 3, 4, 4, 3, 2, 1]),

  (* 6. List with duplicate elements *)
  (mirror, ([1, 1, 1]), [1, 1, 1, 1, 1, 1]),

  (* 7. List with alternating elements *)
  (mirror, ([1, 0, 1, 0]), [1, 0, 1, 0, 0, 1, 0, 1]),

  (* 8. List with negative numbers *)
  (mirror, ([~1, ~2, ~3]), [~1, ~2, ~3, ~3, ~2, ~1]),

  (* 14. Longer list (6 elements) *)
  (mirror, ([1, 2, 3, 4, 5, 6]), [1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1])
];

runTests(testCasesMirrorInt, valueToStringIntList, valueToStringIntList);

val testCasesMirrorBools = [
  (* 9. List of booleans *)
  (mirror, ([true, false, true]), [true, false, true, true, false, true]),

  (* 12. List of boolean values with all true *)
  (mirror, ([true, true, true]), [true, true, true, true, true, true]),

  (* 13. List of boolean values with all false *)
  (mirror, ([false, false]), [false, false, false, false])
];

runTests(testCasesMirrorBools, valueToStringBoolList, valueToStringBoolList);

val testCasesMirrorStrings = [
  (* 10. List of strings *)
  (mirror, (["a", "b", "c"]), ["a", "b", "c", "c", "b", "a"]),

  (* 11. List with mixed types (strings and integers) *)
  (mirror, (["hello", "world"]), ["hello", "world", "world", "hello"])
];

runTests(testCasesMirrorStrings, valueToStringStringList, valueToStringStringList);