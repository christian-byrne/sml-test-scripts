(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testCasesSuffixInt = [
  (* 1. Both lists are empty (suffix of each other) *)
  (suffix, ([], []), true),

  (* 2. First list is empty, second list is non-empty (suffix of any list) *)
  (suffix, ([], [1, 2, 3]), true),

  (* 3. Second list is empty, first list is non-empty (not a suffix) *)
  (suffix, ([1, 2, 3], []), false),

  (* 4. First list is a suffix of the second *)
  (suffix, ([3, 4], [1, 2, 3, 4]), true),

  (* 5. First list is not a suffix of the second *)
  (suffix, ([2, 3], [1, 2, 3, 4]), false),

  (* 6. Both lists are equal (a list is a suffix of itself) *)
  (suffix, ([1, 2, 3], [1, 2, 3]), true),
  
  (suffix, ([3, 4, 5], [1, 2, 3, 4, 5]), true),

  (* 7. First list is longer than the second (cannot be a suffix) *)
  (suffix, ([1, 2, 3, 4], [3, 4]), false),

  (* 8. First list is an exact suffix (lengths equal, last elements match) *)
  (suffix, ([4], [1, 2, 3, 4]), true),

  (* 9. First list is not a suffix due to one element mismatch *)
  (suffix, ([3, 5], [1, 2, 3, 4]), false),

  (* 10. List with duplicate elements (valid suffix) *)
  (suffix, ([3, 3], [2, 3, 3]), true),

  (* 11. List with duplicate elements *)
  (suffix, ([3, 3], [3, 2, 3, 3]), true)
];

runTests(testCasesSuffixInt, fn (li1, li2) => "(" ^ valueToStringIntList li1 ^ ", " ^ valueToStringIntList li2 ^ ")", valueToStringBool);

val testCasesSuffixBool = [
  (* 1. Both lists are empty (suffix of each other) *)
  (suffix, ([], []), true),

  (* 2. First list is empty, second list is non-empty (suffix of any list) *)
  (suffix, ([], [true, false, true]), true),

  (* 3. Second list is empty, first list is non-empty (not a suffix) *)
  (suffix, ([true, false, true], []), false),

  (* 4. First list is a suffix of the second *)
  (suffix, ([true, false], [true, false, true, false]), true),

  (* 5. First list is not a suffix of the second *)
  (suffix, ([false, true], [true, false, true, false]), false),

  (* 6. Both lists are equal (a list is a suffix of itself) *)
  (suffix, ([true, false, true], [true, false, true]), true),

  (* 7. First list is longer than the second (cannot be a suffix) *)
  (suffix, ([true, false, true, false], [true, false]), false),

  (* 8. First list is an exact suffix (lengths equal, last elements match) *)
  (suffix, ([false], [true, false]), true),

  (* 9. First list is not a suffix due to one element mismatch *)
  (suffix, ([true, false], [true, false, true]), false),

  (* 10. List with duplicate elements (valid suffix) *)
  (suffix, ([true, true], [false, true, true]), true),

  (* 11. List with duplicate elements *)
  (suffix, ([true, true], [true, false, true, true]), true)
];

runTests(testCasesSuffixBool, fn (li1, li2) => "(" ^ valueToStringBoolList li1 ^ ", " ^ valueToStringBoolList li2 ^ ")", valueToStringBool);

val testCasesSuffixString = [
  (* 1. Both lists are empty (suffix of each other) *)
  (suffix, ([], []), true),

  (* 2. First list is empty, second list is non-empty (suffix of any list) *)
  (suffix, ([], ["a", "b", "c"]), true),

  (* 3. Second list is empty, first list is non-empty (not a suffix) *)
  (suffix, (["a", "b", "c"], []), false),

  (* 4. First list is a suffix of the second *)
  (suffix, (["b", "c"], ["a", "b", "c"]), true),

  (* 5. First list is not a suffix of the second *)
  (suffix, (["a", "b"], ["a", "b", "c"]), false),

  (* 6. Both lists are equal (a list is a suffix of itself) *)
  (suffix, (["a", "b", "c"], ["a", "b", "c"]), true),

  (* 7. First list is longer than the second (cannot be a suffix) *)
  (suffix, (["a", "b", "c", "d"], ["b", "c"]), false),

  (* 8. First list is an exact suffix (lengths equal, last elements match) *)
  (suffix, (["d"], ["a", "b", "c", "d"]), true),

  (* 9. First list is not a suffix due to one element mismatch *)
  (suffix, (["c", "e"], ["a", "b", "c", "d"]), false),

  (* 10. List with duplicate elements (valid suffix) *)
  (suffix, (["c", "c"], ["b", "c", "c"]), true),

  (* 11. List with duplicate elements *)
  (suffix, (["c", "c"], ["c", "b", "c", "c"]), true)
];

runTests(testCasesSuffixString, fn (li1, li2) => "(" ^ valueToStringStringList li1 ^ ", " ^ valueToStringStringList li2 ^ ")", valueToStringBool);
