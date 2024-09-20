(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesFib = [
  (* a_n = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55} *)
  (fib, 0, 0), 
  (fib, 1, 1), 
  (fib, 2, 1), 
  (fib, 3, 2), 
  (fib, 4, 3), 
  (fib, 5, 5), 
  (fib, 6, 8), 
  (fib, 7, 13), 
  (fib, 8, 21), 
  (fib, 9, 34), 
  (fib, 10, 55)
];
runTestCasesIntInt(testCasesFib);