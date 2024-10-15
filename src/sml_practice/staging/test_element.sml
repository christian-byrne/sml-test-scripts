(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesElementInt = [
  (* 1. Element is present at the beginning of the list *)
  (fn (x, li) => element x li, (1, [1, 2, 3, 4, 5]), true),

  (* 2. Element is present in the middle of the list *)
  (fn (x, li) => element x li, (3, [1, 2, 3, 4, 5]), true),

  (* 3. Element is present at the end of the list *)
  (fn (x, li) => element x li, (5, [1, 2, 3, 4, 5]), true),

  (* 4. Element is not present in the list *)
  (fn (x, li) => element x li, (6, [1, 2, 3, 4, 5]), false),

  (* 5. Empty list (should always return false) *)
  (fn (x, li) => element x li, (1, []), false),

  (* 6. Element is negative and present *)
  (fn (x, li) => element x li, (~3, [~3, ~2, ~1]), true),

  (* 7. Element is zero and present *)
  (fn (x, li) => element x li, (0, [0, 1, 2, 3]), true),
  
  (fn (x, li) => element x li, (5, [1,2,3,4,5,6,7,8]), true),

  (* 8. Element is positive and not present *)
  (fn (x, li) => element x li, (4, [1, 2, 3]), false)
];

runTests(
  testCasesElementInt,
  fn (x, li) => "element(" ^ Int.toString x ^ ", " ^ valueToStringIntList li ^ ")",
  Bool.toString
);

(* Test cases for string lists *)
val testCasesElementString = [
  (* 1. String is present at the beginning *)
  (fn (x, li) => element x li, ("a", ["a", "b", "c"]), true),

  (* 2. String is present at the end *)
  (fn (x, li) => element x li, ("c", ["a", "b", "c"]), true),

  (* 3. String is not present *)
  (fn (x, li) => element x li, ("d", ["a", "b", "c"]), false),

  (* 4. Empty list (should always return false) *)
  (fn (x, li) => element x li, ("a", []), false),

  (* 5. Element is an empty string and present *)
  (fn (x, li) => element x li, ("", ["", "b", "c"]), true),

  (* 6. Element is an empty string but not present *)
  (fn (x, li) => element x li, ("", ["a", "b", "c"]), false)
];

runTests(
  testCasesElementString,
  fn (x, li) => "element(" ^ x ^ ", " ^ valueToStringStringList li ^ ")",
  Bool.toString
);
