(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesFactorial = [
  (factorial, (0), 1),  (* 0! = 1 *)
  (factorial, (1), 1),  (* 1! = 1 *)
  (factorial, (2), 2),  (* 2! = 2 *)
  (factorial, (3), 6),  (* 3! = 6 *)
  (factorial, (4), 24), (* 4! = 24 *)
  (factorial, (5), 120),(* 5! = 120 *)
  (factorial, (6), 720),(* 6! = 720 *)
  (factorial, (7), 5040),(* 7! = 5040 *)
  (factorial, (8), 40320),(* 8! = 40320 *)
  (factorial, (10), 3628800) (* 10! = 3628800 *)
];

fun factorialParamsToString(n) = "factorial(" ^ Int.toString(n) ^ ")";
runTests(testCasesFactorial, factorialParamsToString, Int.toString);