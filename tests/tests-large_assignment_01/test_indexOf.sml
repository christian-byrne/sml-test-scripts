(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for the indexOf function *)
val testCasesIndexOf = [
  (* 1. Single-element list with matching value *)
  (fn (x, li) => indexOf x li, (42, [42]), 0),

  (* 2. Single-element list without matching value *)
  (fn (x, li) => indexOf x li, (99, [42]), ~1),

  (* 3. Value at the beginning of the list *)
  (fn (x, li) => indexOf x li, (1, [1, 2, 3, 4, 5]), 0),

  (* 4. Value at the end of the list *)
  (fn (x, li) => indexOf x li, (5, [1, 2, 3, 4, 5]), 4),

  (* 5. Value in the middle of the list *)
  (fn (x, li) => indexOf x li, (3, [1, 2, 3, 4, 5]), 2),

  (* 6. List with multiple occurrences (should return the first index) *)
  (fn (x, li) => indexOf x li, (2, [1, 2, 2, 2, 3]), 1),

  (* 7. List with all identical elements (should return index 0) *)
  (fn (x, li) => indexOf x li, (1, [1, 1, 1, 1]), 0),

  (* 8. Value not found in the list *)
  (fn (x, li) => indexOf x li, (99, [1, 2, 3, 4, 5]), ~1),

  (* 9. Empty list *)
  (fn (x, li) => indexOf x li, (42, []), ~1),

  (* 10. List with negative numbers *)
  (fn (x, li) => indexOf x li, (~2, [1, ~2, 3, ~2, 5]), 1)
];

runTests(
  testCasesIndexOf,
  fn (x, li) => "indexOf(" ^ Int.toString x ^ ", " ^ valueToStringIntList li ^ ")",
  Int.toString
);
