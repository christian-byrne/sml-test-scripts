(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Helper function to compare two sets *)
fun isEqualSet([], []) = true
  | isEqualSet(x::xs, ys) = List.exists (fn y => y = x) ys 
                            andalso isEqualSet(xs, List.filter (fn y => y <> x) ys)
  | isEqualSet(_, _) = false;

(* Helper function to compare two sets of sets (order doesn't matter) *)
fun isEqualSetOfSets([], []) = true
  | isEqualSetOfSets(x::xs, ys) =
      List.exists (fn y => isEqualSet(x, y)) ys 
      andalso isEqualSetOfSets(xs, List.filter (fn y => not (isEqualSet(x, y))) ys)
  | isEqualSetOfSets(_, _) = false;


(* Test cases for integer lists *)
val testCasesPowersetInt = [
  (* 1. Powerset of an empty set *)
  (fn li => powerset li, [], [[]]),

  (* 2. Powerset of a set with one element *)
  (fn li => powerset li, [1], [[], [1]]),

  (* 3. Powerset of a set with two elements *)
  (fn li => powerset li, [1, 2], [[], [1], [2], [1, 2]]),
  
  (fn li => powerset li, [0, 1], [[], [0], [1], [0, 1]]),

  (* 4. Powerset of a set with three elements *)
  (fn li => powerset li, [1, 2, 3], 
    [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]),

  (* 5. Powerset of a set with negative and positive elements *)
  (fn li => powerset li, [~1, 2], [[], [~1], [2], [~1, 2]])
];

runTestsCustomComparator(
  testCasesPowersetInt,
  fn li => "powerset(" ^ valueToStringIntList li ^ ")",
  (fn ss => "[" ^ String.concatWith ", " (List.map valueToStringIntList ss) ^ "]"),
  isEqualSetOfSets
);

(* Test cases for string lists *)
val testCasesPowersetString = [
  (* 1. Powerset of an empty set *)
  (fn li => powerset li, [], [[]]),

  (* 2. Powerset of a set with one element *)
  (fn li => powerset li, ["a"], [[], ["a"]]),

  (* 3. Powerset of a set with two elements *)
  (fn li => powerset li, ["a", "b"], [[], ["a"], ["b"], ["a", "b"]]),

  (* 4. Powerset of a set with three elements *)
  (fn li => powerset li, ["a", "b", "c"], 
    [[], ["a"], ["b"], ["c"], ["a", "b"], ["a", "c"], ["b", "c"], ["a", "b", "c"]])
];

runTestsCustomComparator(
  testCasesPowersetString,
  fn li => "powerset(" ^ valueToStringStringList li ^ ")",
  (fn ss => "[" ^ String.concatWith ", " (List.map valueToStringStringList ss) ^ "]"),
  isEqualSetOfSets
);
