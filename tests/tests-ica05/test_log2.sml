(* ICA 5 tests *)

use "src/ica05/ica5.sml";
use "tests/utils.sml";

val testCasesLog2 = [
  (log2, (1), 0),  (* 2^0 = 1 *)
  (log2, (2), 1),  (* 2^1 = 2 *)
  (log2, (4), 2),  (* 2^2 = 4 *)
  (log2, (8), 3),  (* 2^3 = 8 *)
  (log2, (16), 4), (* 2^4 = 16 *)
  (log2, (32), 5), (* 2^5 = 32 *)
  (log2, (64), 6), (* 2^6 = 64 *)
  (log2, (128), 7),(* 2^7 = 128 *)
  (log2, (256), 8) (* 2^8 = 256 *)
];

fun log2ParamsToString(n) = "log2(" ^ Int.toString(n) ^ ")";
runTests(testCasesLog2, log2ParamsToString, Int.toString);