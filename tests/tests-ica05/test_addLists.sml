(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesAddLists = [
  (addLists, ([1, 2, 3], [4, 5, 6]), [5, 7, 9]), 
  (addLists, ([1, 2], [4, 5, 6]), [5, 7]), 
  (addLists, ([1, 2, 3], []), []), 
  (addLists, ([], [4, 5, 6]), []),
  (addLists, ([], []), []),
  (addLists, ([1, 2, 3], [4, 5, 6, 7]), [5, 7, 9]),
  (addLists, ([1, 2, 3, 4, 5], [4, 5, 6, 0, 0]), [5, 7, 9, 4, 5])
];
runTestCasesIntListIntList(testCasesAddLists);
