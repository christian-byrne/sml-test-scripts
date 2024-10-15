(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for arithSeq *)
val testCasesArithSeq = [
  (* 1. Basic arithmetic sequence starting at 1 with a difference of 2 *)
  (fn (a, d, l) => arithSeq a d l, (1, 2, 5), [1, 3, 5, 7, 9]),

  (* 2. Arithmetic sequence with a negative difference *)
  (fn (a, d, l) => arithSeq a d l, (10, ~2, 5), [10, 8, 6, 4, 2]),

  (* 3. Sequence with a difference of 0 (all elements are the same) *)
  (fn (a, d, l) => arithSeq a d l, (5, 0, 4), [5, 5, 5, 5]),

  (* 4. Sequence of length 1 *)
  (fn (a, d, l) => arithSeq a d l, (7, 3, 1), [7]),

  (* 5. Empty sequence (length 0) *)
  (fn (a, d, l) => arithSeq a d l, (1, 1, 0), []),

  (* 6. Sequence with a starting value of 0 and a positive difference *)
  (fn (a, d, l) => arithSeq a d l, (0, 4, 3), [0, 4, 8]),

  (* 7. Sequence with a negative starting value *)
  (fn (a, d, l) => arithSeq a d l, (~3, 2, 4), [~3, ~1, 1, 3]),

  (* 8. Large sequence to test performance *)
  (fn (a, d, l) => arithSeq a d l, (1, 1, 100), List.tabulate(100, fn i => i + 1)),
  
  (fn (a, d, l) => arithSeq a d l, (0, 5, 4), [0,5,10,15]),

  (* 9. Sequence where the common difference is larger than the starting value *)
  (fn (a, d, l) => arithSeq a d l, (2, 10, 3), [2, 12, 22]),

  (* 10. Sequence with a large negative difference *)
  (fn (a, d, l) => arithSeq a d l, (100, ~20, 4), [100, 80, 60, 40]),

  (* 11. Sequence with large positive starting value and difference *)
  (fn (a, d, l) => arithSeq a d l, (1000, 500, 3), [1000, 1500, 2000]),

  (* 12. Edge case: Sequence with starting value and common difference both 0 *)
  (fn (a, d, l) => arithSeq a d l, (0, 0, 5), [0, 0, 0, 0, 0]),

  (* 13. Large sequence with a mix of positive and negative terms *)
  (fn (a, d, l) => arithSeq a d l, (50, ~5, 10), [50, 45, 40, 35, 30, 25, 20, 15, 10, 5]),

  (* 14. Common difference larger than sequence length *)
  (fn (a, d, l) => arithSeq a d l, (1, 10, 2), [1, 11]),

  (* 15. Large sequence with only decreasing values *)
  (fn (a, d, l) => arithSeq a d l, (500, ~50, 5), [500, 450, 400, 350, 300])
];

runTestsCustomComparator(
  testCasesArithSeq,
  fn (a, d, l) => "arithSeq(" ^ Int.toString a ^ ", " ^ Int.toString d ^ ", " ^ Int.toString l ^ ")",
  valueToStringIntList,
  isEqualList
);
