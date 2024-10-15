(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testCasesGtList = [
  (* 1. Empty list case *)
  (gtList, ([], 0), []),

  (* 2. All elements greater than n *)
  (gtList, ([4, 5, 6], 3), [4, 5, 6]),

  (* 3. No elements greater than n *)
  (gtList, ([1, 2, 3, 4, 5], 10), []),

  (* 4. Some elements greater than n *)
  (gtList, ([1, 4, 2, 5, 3, 6], 3), [4, 5, 6]),

  (* 5. Single element list, element greater than n *)
  (gtList, ([1], 0), [1]),

  (gtList, ([1,2,3,4,5], 2), [3,4,5]),
  
  (* 6. Single element list, element not greater than n *)
  (gtList, ([1], 2), []),

  (* 7. List with duplicate elements, some greater than n *)
  (gtList, ([2, 3, 3, 1, 4, 2], 2), [3, 3, 4]),

  (* 8. List with negative elements, looking for positives greater than n *)
  (gtList, ([~1, ~2, 1, 2, ~3], 0), [1, 2]),

  (* 9. List with mixed positive and negative numbers *)
  (gtList, ([~5, 0, ~2, 2, 3], ~1), [0, 2, 3]),

  (* 10. List with all elements less than n *)
  (gtList, ([5, 6, 7, 8, 9], 10), []),

  (* 11. List with all elements equal to n *)
  (gtList, ([3, 3, 3, 3], 3), []),

  (* 12. List with elements that alternate greater and less than n *)
  (gtList, ([1, 4, 2, 5, 3, 6], 3), [4, 5, 6]),

  (* 13. List where only the last element is greater than n *)
  (gtList, ([1, 2, 1, 2, 1, 3], 2), [3]),

  (* 14. List with a large n, no elements greater *)
  (gtList, ([50, 60, 70], 100), []),

  (* 15. List with a large n, some elements greater *)
  (gtList, ([50, 65, 70, 40, 80], 60), [65, 70, 80])
];

runTests(
  testCasesGtList,
  fn (li, n) => "(" ^ valueToStringIntList li ^ ", " ^ Int.toString n ^ ")",
  valueToStringIntList
);
