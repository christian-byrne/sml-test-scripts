(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesCondenseListsInt = [
  (* 1. Condense with addition (sum) *)
  (fn li => condenseLists (op +) 0 li, [[1, 2], [3, 4], [5, 6]], [3, 7, 11]),

  (* 2. Condense with multiplication *)
  (fn li => condenseLists (op * ) 1 li, [[1, 2], [3, 4], [5, 6]], [2, 12, 30]),

  (* 3. Condense with addition and empty lists *)
  (fn li => condenseLists (op +) 0 li, [[], [1, 2, 3], []], [0, 6, 0]),
  
  (fn li => condenseLists (op +) 0 li, [[], [1, 2, 3, 4], [5,6]], [0, 10, 11]),

  (* 4. Condense single-element lists *)
  (fn li => condenseLists (op +) 0 li, [[1], [2], [3]], [1, 2, 3]),

  (* 5. Condense with multiplication on nested lists *)
  (fn li => condenseLists (op * ) 1 li, [[2], [3, 3], [4, 5]], [2, 9, 20])
];

runTestsCustomComparator(
  testCasesCondenseListsInt,
  fn li => "condenseLists (op +) 0 " ^ valueToStringIntListList li,
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesCondenseListsString = [
  (* 1. Condense with string concatenation *)
  (fn li => condenseLists (op ^) "" li, [["a"], ["b", "c"], ["d"]], ["a", "bc", "d"]),

  (* 2. Concatenate with separator *)
  (fn li => condenseLists (fn (x, acc) => x ^ ", " ^ acc) "" li, [["a"], ["b", "c"], ["d"]], ["a, ", "b, c, ", "d, "]),

  (* 3. Condense with empty strings *)
  (fn li => condenseLists (op ^) "" li, [[""], ["a"], ["b", ""]], ["", "a", "b"]),

  (* 4. Condense a single-element list *)
  (fn li => condenseLists (op ^) "" li, [["hello"]], ["hello"])
];

runTestsCustomComparator(
  testCasesCondenseListsString,
  fn li => "condenseLists (op ^) \"\" " ^ valueToStringStringListList li,
  valueToStringStringList,
  isEqualList
);
