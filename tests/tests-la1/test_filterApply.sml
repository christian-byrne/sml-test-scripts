(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Helper function to append "x" to a string *)
fun appendX s = s ^ "x";

(* Test cases for integer lists *)
val testCasesFilterApplyInt = [
  (* 1. Increment all even numbers *)
  (fn li => filterApply li (fn x => x mod 2 = 0) (fn x => x + 1), 
   [1, 2, 3, 4, 5], 
   [1, 3, 3, 5, 5]),

  (* 2. Multiply all negative numbers by -1 *)
  (fn li => filterApply li (fn x => x < 0) (fn x => ~x), 
   [~1, 2, ~3, 4, ~5], 
   [1, 2, 3, 4, 5]),

  (fn li => filterApply li (fn x => x mod 2 = 0) (fn x => x + 1), 
   [1,2,3,4,5], 
   [1,3,3,5,5]),
  
  (* 3. Add 10 to all numbers greater than 3 *)
  (fn li => filterApply li (fn x => x > 3) (fn x => x + 10), 
   [1, 2, 3, 4, 5], 
   [1, 2, 3, 14, 15]),

  (* 4. No elements match the condition (should return the same list) *)
  (fn li => filterApply li (fn x => x > 10) (fn x => x + 1), 
   [1, 2, 3], 
   [1, 2, 3]),

  (* 5. All elements match the condition *)
  (fn li => filterApply li (fn x => x >= 0) (fn x => x * 2), 
   [1, 2, 3], 
   [2, 4, 6]),

  (* 6. Empty list (should return an empty list) *)
  (fn li => filterApply li (fn x => x mod 2 = 0) (fn x => x + 1), 
   [], 
   [])
];

runTestsCustomComparator(
  testCasesFilterApplyInt,
  fn li => "filterApply " ^ valueToStringIntList li ^ " (fn x => x mod 2 = 0) (fn x => x + 1)",
  valueToStringIntList,
  isEqualList
);

(* Test cases for string lists *)
val testCasesFilterApplyString = [
  (* 1. Append "x" to all strings that start with 'a' *)
  (fn li => filterApply li (fn s => String.sub(s, 0) = #"a") appendX, 
   ["apple", "banana", "apricot", "grape"], 
   ["applex", "banana", "apricotx", "grape"]),

  (* 2. Append "x" to all strings of length 3 *)
  (fn li => filterApply li (fn s => String.size s = 3) appendX, 
   ["one", "two", "three", "four"], 
   ["onex", "twox", "three", "four"]),

  (* 3. No strings match the condition (should return the same list) *)
  (fn li => filterApply li (fn s => String.size s > 10) appendX, 
   ["hello", "world"], 
   ["hello", "world"]),

  (* 4. Append "x" to all strings of length <= 5 *)
  (fn li => filterApply li (fn s => String.size s <= 5) appendX, 
   ["hi", "hey", "hello"], 
   ["hix", "heyx", "hellox"]),

  (* 5. Empty list (should return an empty list) *)
  (fn li => filterApply li (fn s => String.size s = 3) appendX, 
   [], 
   [])
];

runTestsCustomComparator(
  testCasesFilterApplyString,
  fn li => "filterApply " ^ valueToStringStringList li ^ " (fn s => String.size s = 3) appendX",
  valueToStringStringList,
  isEqualList
);
