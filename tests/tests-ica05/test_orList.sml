(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesOrList = [
  (orList, ([true, true, true]), true), 
  (orList, ([true, false, true]), true), 
  (orList, ([false, false, false]), false), 
  (orList, ([true, true, false]), true), 
  (orList, ([false, false, true]), true), 
  (orList, ([false, false, false, false]), false),
  (orList, ([false, true, false, true]), true),
  (orList, ([]), false), (* Empty list case *)
  (orList, ([false]), false), (* Single false element *)
  (orList, ([true]), true) (* Single true element *)
];

fun orListParamsToString(li) = "orList(" ^ valueToStringBoolList(li) ^ ")";
runTests(testCasesOrList, orListParamsToString, valueToStringBool);