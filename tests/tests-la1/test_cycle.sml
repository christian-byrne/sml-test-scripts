(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testCycle = [
  (* 1. Simple case: cycle 4 elements from the front to the back *)
  (cycle, (4, [1,2,3,4,5,6,7]), [5,6,7,1,2,3,4]),

  (* 2. Cycling by 0 should return the list unchanged *)
  (cycle, (0, [1,2,3,4,5,6,7]), [1,2,3,4,5,6,7]),
  
  (cycle, (4, [1,2,3,4,5]), [5,1,2,3,4]),

  (* 3. Cycling by 1 should move the first element to the end *)
  (cycle, (1, [1,2,3,4,5]), [2,3,4,5,1]),

  (* 4. Cycling by the list length should return the list unchanged *)
  (cycle, (7, [1,2,3,4,5,6,7]), [1,2,3,4,5,6,7]),

  (* 5. Cycling by more than the list length (n > length) *)
  (cycle, (11, [1,2,3,4,5]), [2,3,4,5,1]),

  (* 6. Empty list should return an empty list *)
  (cycle, (3, []), []),

  (* 7. Single element list, cycling should return the same list *)
  (cycle, (2, [42]), [42]),

  (* 8. Cycling by a number greater than the length in a single element list *)
  (cycle, (5, [99]), [99]), (* No effect regardless of cycle length *)

  (* 9. Cycling by the full length of the list *)
  (cycle, (3, [1,2,3]), [1,2,3]), (* Equivalent to cycling by 3 mod 3 = 0, no change *)

  (* 10. Cycling by 2 elements in a list of 4 *)
  (cycle, (2, [10,20,30,40]), [30,40,10,20]),

  (* 11. Cycling by a multiple of the list returns the list unchanged *)
  (cycle, (36, [1,2,3,4,5,6]), [1,2,3,4,5,6])
];

fun cycleParamsToString((n, li)) = "cycle(" ^ Int.toString(n) ^ ", " ^ valueToStringIntList(li) ^ ")";

runTests(testCycle, cycleParamsToString, valueToStringIntList);