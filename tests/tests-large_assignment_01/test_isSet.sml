(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesIsSetInt = [
  (* 1. A list with unique elements *)
  (fn li => isSet li, [1, 2, 3, 4, 5], true),

  (* 2. A list with duplicate elements *)
  (fn li => isSet li, [1, 2, 2, 3, 4], false),

  (* 3. A list with all identical elements *)
  (fn li => isSet li, [42, 42, 42], false),

  (* 4. A list with only one element *)
  (fn li => isSet li, [1], true),

  (* 5. An empty list (should be considered a set) *)
  (fn li => isSet li, [], true),

  (* 6. A list with negative numbers and no duplicates *)
  (fn li => isSet li, [~1, ~2, ~3], true),

  (* 7. A list with zero and no duplicates *)
  (fn li => isSet li, [0, 1, 2, 3], true),
  
  (fn li => isSet li, [1, 2, 3, 4, 5], true),

  (* 8. A list with zero and duplicate positive numbers *)
  (fn li => isSet li, [0, 1, 2, 2], false)
];

runTests(
  testCasesIsSetInt,
  fn li => "isSet " ^ valueToStringIntList li,
  Bool.toString
);

(* Test cases for string lists *)
val testCasesIsSetString = [
  (* 1. A list with unique strings *)
  (fn li => isSet li, ["a", "b", "c"], true),

  (* 2. A list with duplicate strings *)
  (fn li => isSet li, ["a", "b", "a"], false),

  (* 3. A list with only one string *)
  (fn li => isSet li, ["hello"], true),

  (* 4. An empty list (should be considered a set) *)
  (fn li => isSet li, [], true),

  (* 5. A list with repeated identical strings *)
  (fn li => isSet li, ["x", "x", "x"], false),

  (* 6. A list with an empty string and other unique strings *)
  (fn li => isSet li, ["", "a", "b"], true),

  (* 7. A list with an empty string repeated *)
  (fn li => isSet li, ["", ""], false)
];

runTests(
  testCasesIsSetString,
  fn li => "isSet " ^ valueToStringStringList li,
  Bool.toString
);
