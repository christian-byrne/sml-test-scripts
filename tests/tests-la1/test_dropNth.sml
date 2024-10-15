(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Integer List Test Cases *)
val testCasesDropNthInt = [
  (* 1. Drop every 1st element (should return an empty list) *)
  (fn (n, li) => dropNth n li, (1, [1, 2, 3, 4, 5]), []),

  (* 2. Drop every 2nd element *)
  (fn (n, li) => dropNth n li, (2, [1, 2, 3, 4, 5]), [1, 3, 5]),

  (* 3. Drop every 3rd element *)
  (fn (n, li) => dropNth n li, (3, [1, 2, 3, 4, 5, 6, 7, 8, 9]), [1, 2, 4, 5, 7, 8]),

  (* 4. Drop every nth element where n > length of list (should return the same list) *)
  (fn (n, li) => dropNth n li, (10, [1, 2, 3, 4, 5]), [1, 2, 3, 4, 5]),
  
  (fn (n, li) => dropNth n li, (2, [1, 2, 3, 4, 5]), [1, 3, 5]),

  (* 5. Drop every nth element for an empty list *)
  (fn (n, li) => dropNth n li, (3, []), []),

  (* 6. Drop every nth element in a single-element list *)
  (fn (n, li) => dropNth n li, (1, [42]), []),
  (fn (n, li) => dropNth n li, (2, [42]), [42]),

  (* 7. Drop every nth element in a list with repeated elements *)
  (fn (n, li) => dropNth n li, (2, [1, 1, 1, 1, 1]), [1, 1, 1]),

  (* 8. Large list without List.tabulate *)
  (fn (n, li) => dropNth n li, (5, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]), [1, 2, 3, 4, 6, 7, 8, 9])
];

runTests(
  testCasesDropNthInt,
  fn (n, li) => "dropNth(" ^ Int.toString n ^ ", " ^ valueToStringIntList li ^ ")",
  valueToStringIntList
);

(* String List Test Cases *)
val testCasesDropNthString = [
  (* 1. Drop every 1st element from a list of strings *)
  (fn (n, li) => dropNth n li, (1, ["a", "b", "c", "d"]), []),

  (* 2. Drop every 2nd element from a list of strings *)
  (fn (n, li) => dropNth n li, (2, ["a", "b", "c", "d"]), ["a", "c"]),

  (* 3. Drop every 3rd element from a list of strings *)
  (fn (n, li) => dropNth n li, (3, ["a", "b", "c", "d", "e", "f"]), ["a", "b", "d", "e"]),

  (* 4. Drop every nth element where n > length of list (should return the same list) *)
  (fn (n, li) => dropNth n li, (10, ["a", "b", "c"]), ["a", "b", "c"]),

  (* 5. Drop every nth element for a single-element list of strings *)
  (fn (n, li) => dropNth n li, (1, ["hello"]), []),
  (fn (n, li) => dropNth n li, (2, ["hello"]), ["hello"])
];

runTests(
  testCasesDropNthString,
  fn (n, li) => "dropNth(" ^ Int.toString n ^ ", " ^ valueToStringStringList li ^ ")",
  valueToStringStringList
);
