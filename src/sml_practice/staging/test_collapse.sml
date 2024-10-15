(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

val testCasesCollapseInt = [
  (* 1. Example from the function: collapse([1,2,3,4,5],0,(op +)) → 15 *)
  (collapse, ([1, 2, 3, 4, 5], 0, op +), 15),

  (* 2. Empty list (should return the starting value) *)
  (collapse, ([], 0, op +), 0),

  (* 3. Single-element list *)
  (collapse, ([5], 10, op +), 15),

  (* 4. Product of multiple elements *)
  (collapse, ([1, 2, 3, 4], 1, op * ), 24),
  
  (collapse, ([1,2,3,4], 5, op + ), 15),

  (* 5. List with negative numbers (sum) *)
  (collapse, ([~1, ~2, ~3], 0, op +), ~6),

  (* 6. Hard-coded large list with addition *)
  (collapse, ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0, op +), 55)
];

runTests(
  testCasesCollapseInt,
  fn (li, startVal, f) => valueToStringIntList li ^ ", " ^ Int.toString startVal ^ " with a function",
  Int.toString
);

val testCasesCollapseString = [
  (* 1. Example: Concatenate strings (right associative) *)
  (collapse, (["a", "b", "c"], "", op ^ ), "abc"),

  (* 2. Concatenate with a starting string (right associative) *)
  (collapse, (["world", "!"], "Hello ", op ^) , "world!Hello "),

  (* 3. Empty list with string start value *)
  (collapse, ([], "empty", op ^ ), "empty")
];

runTests(
  testCasesCollapseString,
  fn (li, startVal, f) => valueToStringStringList li ^ ", \"" ^ startVal ^ "\" with a function",
  (fn x => x) (* Identity function for string output *)
);

val testCasesCollapseBool = [
  (* 1. Logical AND on all elements *)
  (collapse, ([true, true, false], true, fn (cur, acc) => cur andalso acc), false),

  (* 2. Logical OR on all elements *)
  (collapse, ([false, false, true], false, fn (cur, acc) => cur orelse acc), true),

  (* 3. Empty list with true as starting value *)
  (collapse, ([], true, fn (cur, acc) => cur andalso acc), true),

  (* 4. Single-element list *)
  (collapse, ([false], true, fn (cur, acc) => cur andalso acc), false)
];

runTests(
  testCasesCollapseBool,
  fn (li, startVal, f) => valueToStringBoolList li ^ ", " ^ Bool.toString startVal ^ " with a function",
  Bool.toString
);
