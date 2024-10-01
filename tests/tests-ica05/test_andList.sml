(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesAndList = [
  (andList, ([true, true, true]), true), 
  (andList, ([true, false, true]), false), 
  (andList, ([false, false, false]), false), 
  (andList, ([]), true), (* Empty list case *)
  (andList, ([true]), true),
  (andList, ([false]), false)
];

fun andListParamsToString(li) = "andList(" ^ valueToStringBoolList(li) ^ ")";
runTests(testCasesAndList, andListParamsToString, valueToStringBool);