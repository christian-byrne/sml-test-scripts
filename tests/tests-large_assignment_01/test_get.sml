(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

val testCasesGetInt = [
  (* 1. Get the first element (index 0) *)
  (get, ([1, 2, 3], 0), 1),

  (* 2. Get the second element (index 1) *)
  (get, ([1, 2, 3], 1), 2),

  (* 3. Get the last element (index 2) *)
  (get, ([1, 2, 3], 2), 3),

  (* 4. Single element list (index 0) *)
  (get, ([42], 0), 42),

  (* 5. Longer list, get middle element *)
  (get, ([1, 2, 3, 4, 5], 2), 3),

  (* 6. Get from list with negative numbers *)
  (get, ([~1, ~2, ~3], 1), ~2),

  (* 7. List with duplicate elements *)
  (get, ([1, 1, 1], 2), 1),

  (* 8. List with alternating elements *)
  (get, ([1, 0, 1, 0], 3), 0)
];

runTests(
  testCasesGetInt, 
  fn (li, idx) => "(" ^ valueToStringIntList li ^ ", " ^ Int.toString idx ^ ")",
  Int.toString
);

val testCasesGetBool = [
  (* 1. Get the first element (index 0) *)
  (get, ([true, false, true], 0), true),

  (* 2. Get the second element (index 1) *)
  (get, ([true, false, true], 1), false),

  (* 3. Get the last element (index 2) *)
  (get, ([true, false, true], 2), true),

  (* 4. Single element list *)
  (get, ([false], 0), false)
];

runTests(
  testCasesGetBool, 
  fn (li, idx) => "(" ^ valueToStringBoolList li ^ ", " ^ Int.toString idx ^ ")",
  Bool.toString
);

val testCasesGetString = [
  (* 1. Get the first element *)
  (get, (["a", "b", "c"], 0), "a"),

  (* 2. Get the second element *)
  (get, (["a", "b", "c"], 1), "b"),

  (* 3. Get the last element *)
  (get, (["a", "b", "c"], 2), "c"),

  (* 4. Single element list *)
  (get, (["hello"], 0), "hello")
];

runTests(
  testCasesGetString, 
  fn (li, idx) => "(" ^ valueToStringStringList li ^ ", " ^ Int.toString idx ^ ")",
  (fn x => x) (* Identity function for strings *)
);
