(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

val testTriangle = [
  (* Test Cases That Should Fail (Return false) *)
  
  (* 1. One side is too long *)
  (triangle, (1, 2, 4), false), (* 1 + 2 < 4, should fail *)

  (* 2. All sides are zero *)
  (triangle, (0, 0, 0), false), (* No valid triangle can have zero-length sides *)

  (* 3. One side is zero *)
  (triangle, (0, 5, 7), false), (* One side being zero makes it an invalid triangle *)

  (* 4. Extremely large sides that violate inequality *)
  (triangle, (1000000, 1, 1), false), (* 1000000 + 1 < 1, should fail *)

  (* 5. Two equal sides but still invalid *)
  (triangle, (10, 10, 25), false), (* 10 + 10 < 25, should fail *)

  (* 6. All negative sides *)
  (triangle, (~1, ~1, ~1), false), (* Negative values cannot form a triangle *)

  (* 7. One negative side *)
  (triangle, (~3, 4, 5), false), (* Negative sides make it invalid *)

  (* 8. One side is larger than the sum of the other two *)
  (triangle, (1, 1, 3), false), (* 1 + 1 < 3, should fail *)

  (* 9. Middle arg is zero *)
  (triangle, (2, 0, 2), false), (* You cannot make a triangle with a zero-length side *)

  (* 10. Last arg is zero *)
  (triangle, (2, 2, 0), false), (* You cannot make a triangle with a zero-length side *)

  (* 11. Two sides are zero *)
  (triangle, (0, 2, 0), false), (* You cannot make a triangle with a zero-length side *)

  (* 12. Two sides are zero *)
  (triangle, (2, 0, 0), false), (* You cannot make a triangle with a zero-length side *)

  (* 13. Two sides are zero *)
  (triangle, (0, 0, 2), false), (* You cannot make a triangle with a zero-length side *)

  (* Test Cases That Should Pass (Return true) *)
  
  (* 1. Simple valid triangle *)
  (triangle, (3, 4, 5), true), (* Classic 3-4-5 triangle, should pass *)

  (* 2. Equilateral triangle *)
  (triangle, (5, 5, 5), true), (* All sides equal, valid triangle *)

  (* 3. Isosceles triangle *)
  (triangle, (5, 5, 8), true), (* Two sides equal, valid triangle *)

  (* 4. All sides equal but larger values *)
  (triangle, (100, 100, 100), true), (* All sides equal, valid triangle *)

  (* 5. Large valid triangle *)
  (triangle, (1000000, 1000000, 1000000), true), (* Large triangle, all sides equal *)

  (* 6. Right triangle *)
  (triangle, (6, 8, 10), true), (* Pythagorean triple, valid triangle *)

  (* 7. One small side, two large sides *)
  (triangle, (1, 1000, 1001), true), (* 1 + 1000 > 1001, should pass *)

  (* 8. Two equal sides, third side small but valid *)
  (triangle, (10, 10, 15), true), (* 10 + 10 > 15, valid triangle *)

  (* 9. Minimal valid triangle *)
  (triangle, (1, 1, 1), true), (* Smallest valid triangle, all sides 1 *)

  (* 10. Very large triangle with different sides *)
  (triangle, (500000, 600000, 700000), true), (* Large triangle with different sides *)
  
  (* 11. Two sides equal the third *)
  (triangle, (2, 2, 4), true), (* 2 + 2 = 4, but no strict inequality, so should pass *)
  
  (triangle, (2, 3, 4), true),
  
  (* 12. Two large sides, one very small side *)
  (triangle, (9999, 9999, 1), true) (* 9999 + 1 > 9999, should pass always *)
];

fun triangleParamsToString(a, b, c) = "triangle(" ^ valueToStringInt(a) ^ ", " ^ valueToStringInt(b) ^ ", " ^ valueToStringInt(c) ^ ")";
runTests(testTriangle, triangleParamsToString, valueToStringBool);
