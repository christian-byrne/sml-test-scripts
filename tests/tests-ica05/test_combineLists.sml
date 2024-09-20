(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

fun mockAdd(x, y) = x + y;
fun mockModulus(x, y) = x mod y;
fun mockDiv(x, y) = x div y;
fun doNothing(x, y) = x;

val testCasesCombineLists = [
  (combineLists, [1, 2, 3], [4, 5, 6], mockAdd, [5, 7, 9]), 
  (combineLists, [1, 2], [4, 5, 6], mockAdd, [5, 7]), 
  (combineLists, [], [4, 5, 6], mockModulus, []),
  (combineLists, [], [], mockModulus, []),
  (combineLists, [1, 2, 3], [4, 5, 6], mockDiv, [0, 0, 0]),
  (combineLists, [1, 2], [4, 5, 6], mockDiv, [0, 0]),
  (combineLists, [8, 8, 3], [4], mockDiv, [2]),
  (combineLists, [4], [4, 5, 6], mockDiv, [1]),
  (combineLists, [], [], mockDiv, []),
  (combineLists, [1, 2, 3], [4, 5, 6], doNothing, [1, 2, 3]),
  (combineLists, [1, 2], [4, 5, 6], doNothing, [1, 2]),
  (combineLists, [1, 2, 3], [], doNothing, []),
  (combineLists, [], [4, 5, 6], doNothing, []),
  (combineLists, [], [], doNothing, [])
];
runTestCasesIntListIntListOperatorToIntList(testCasesCombineLists);