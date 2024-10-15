(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Test cases for integer lists *)
val testCasesRemoveInt = [
  (* 1. Remove all even numbers *)
  (fn li => remove (fn x => x mod 2 = 0) li, [1, 2, 3, 4, 5, 6], [1, 3, 5]),

  (* 2. Remove all odd numbers *)
  (fn li => remove (fn x => x mod 2 <> 0) li, [1, 2, 3, 4, 5, 6], [2, 4, 6]),

  (* 3. Remove all numbers greater than 3 *)
  (fn li => remove (fn x => x > 3) li, [1, 2, 3, 4, 5], [1, 2, 3]),
  
  (fn li => remove (fn x => x mod 3 = 0) li, [1,2,3,4,5,6,7,8,9], [1,2,4,5,7,8]),

  (* 4. Remove all negative numbers *)
  (fn li => remove (fn x => x < 0) li, [~1, 2, ~3, 4, 5], [2, 4, 5]),

  (* 5. No elements match the condition (should return the same list) *)
  (fn li => remove (fn x => x > 10) li, [1, 2, 3], [1, 2, 3]),

  (* 6. All elements match the condition (should return an empty list) *)
  (fn li => remove (fn x => x >= 0) li, [1, 2, 3], []),

  (* 7. Empty list (should return an empty list) *)
  (fn li => remove (fn x => x mod 2 = 0) li, [], [])
];

runTestsCustomComparator(
  testCasesRemoveInt,
  fn li => "remove (fn x => x mod 2 = 0) " ^ valueToStringIntList li,
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesRemoveString = [
  (* 1. Remove all strings starting with 'a' *)
  (fn li => remove (fn s => String.sub(s, 0) = #"a") li, ["apple", "banana", "apricot", "grape"], ["banana", "grape"]),

  (* 2. Remove all strings with length 3 *)
  (fn li => remove (fn s => String.size s = 3) li, ["one", "two", "three", "four"], ["three", "four"]),

  (* 3. No strings match the condition (should return the same list) *)
  (fn li => remove (fn s => String.size s > 10) li, ["hello", "world"], ["hello", "world"]),

  (* 4. All strings match the condition (should return an empty list) *)
  (fn li => remove (fn s => String.size s <= 5) li, ["hi", "hey", "hello"], []),

  (* 5. Empty list (should return an empty list) *)
  (fn li => remove (fn s => String.size s = 3) li, [], [])
];

runTestsCustomComparator(
  testCasesRemoveString,
  fn li => "remove (fn s => String.size s = 3) " ^ valueToStringStringList li,
  valueToStringStringList,
  isEqualList
);
