(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesRemoveZeros = [
  (removeZeros, ([0, 1, 0, 2]), [1, 2]), 
  (removeZeros, ([0, 0, 0]), []), 
  (removeZeros, ([1, 2, 3]), [1, 2, 3]), 
  (removeZeros, ([]), []), 
  (removeZeros, ([0]), []),
  (removeZeros, ([1]), [1]),
  (removeZeros, ([0, 0, 0, 1, 0]), [1]),
  (removeZeros, ([1, 0, 1, 0, 1]), [1, 1, 1])
];

fun removeZerosParamsToString(li) = "removeZeros(" ^ valueToStringIntList(li) ^ ")";
runTests(testCasesRemoveZeros, removeZerosParamsToString, valueToStringIntList);