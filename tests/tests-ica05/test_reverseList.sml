(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesReverseList = [
  (reverseList, [1, 2, 3], [3, 2, 1]), 
  (reverseList, [1], [1]), 
  (reverseList, [], []), 
  (reverseList, [4, 5, 6, 7], [7, 6, 5, 4]),
  (reverseList, [1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
  (reverseList, [1, 2, 3, 4, 5, 6], [6, 5, 4, 3, 2, 1]),
  (reverseList, [1, 0, 0, 1, 0], [0, 1, 0, 0, 1]),
  (reverseList, [0, 0, 0], [0, 0, 0])  
];
runTestCasesIntListIntList(testCasesReverseList);
