(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

val testTriangleR = [
  (* Test Cases That Should Fail (Return false) *)
  (triangleR, 1.0, 2.0, 4.0, false), 
  (triangleR, 0.0, 0.0, 0.0, false), 
  (triangleR, 0.0, 5.0, 7.0, false), 
  (triangleR, 1000000.0, 1.0, 1.0, false), 
  (triangleR, 10.0, 10.0, 25.0, false),
  (triangleR, ~1.0, ~1.0, ~1.0, false),
  (triangleR, ~3.0, 4.0, 5.0, false),
  (triangleR, 1.0, 1.0, 3.0, false),
  (triangleR, 2.0, 0.0, 2.0, false),
  (triangleR, 2.0, 2.0, 0.0, false),
  
  (* Test Cases That Should Pass (Return true) *)
  (triangleR, 3.0, 4.0, 5.0, true),
  (triangleR, 5.0, 5.0, 5.0, true),
  (triangleR, 5.0, 5.0, 8.0, true),
  (triangleR, 100.0, 100.0, 100.0, true),
  (triangleR, 1000000.0, 1000000.0, 1000000.0, true),
  (triangleR, 6.0, 8.0, 10.0, true),
  (triangleR, 1.0, 1000.0, 1001.0, true),
  (triangleR, 10.0, 10.0, 15.0, true),
  (triangleR, 1.0, 1.0, 1.0, true),
  (triangleR, 500000.0, 600000.0, 700000.0, true)
];

runTestCasesRealRealRealBool(testTriangleR);
