(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesCountZeros = [
  (countZeros, ([0, 1, 0, 1, 0]), 3), 
  (countZeros, ([1, 1, 1, 1, 1]), 0), 
  (countZeros, ([0, 0, 0, 0, 0]), 5), 
  (countZeros, ([]), 0), 
  (countZeros, ([0]), 1), 
  (countZeros, ([1]), 0),
  (countZeros, ([0, 0, 0, 1, 0]), 4), 
  (countZeros, ([1, 0, 1, 0, 1]), 2), 
  (countZeros, ([0, 0, 1, 0, 0, 0]), 5)
];

fun countZerosParamsToString(li) = "countZeros(" ^ valueToStringIntList(li) ^ ")";
runTests(testCasesCountZeros, countZerosParamsToString, Int.toString);