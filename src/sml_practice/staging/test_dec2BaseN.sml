

(* Large Assignment 01 Tests *)

use "src/large_assignment_01/large_assignment_01.sml";
use "tests/utils.sml";

(* Test cases for the dec2BaseN function *)
val testCasesToBaseN = [
  (* 1. Convert 0 to any base (should return "0") *)
  (fn (base, num) => dec2BaseN base num, (2, 0), "0"),
  (fn (base, num) => dec2BaseN base num, (10, 0), "0"),

  (* 2. Convert 1 to various bases *)
  (fn (base, num) => dec2BaseN base num, (2, 1), "1"),
  (fn (base, num) => dec2BaseN base num, (10, 1), "1"),

  (* 3. Convert a number to binary (base 2) *)
  (fn (base, num) => dec2BaseN base num, (2, 5), "101"),
  
  (fn (base, num) => dec2BaseN base num, (2, 12), "1100"),
  
  (fn (base, num) => dec2BaseN base num, (2, 13), "1101"),
  (fn (num, base) => dec2BaseN num base, (2, 10), "1010"),

  (* 4. Convert a number to octal (base 8) *)
  (fn (base, num) => dec2BaseN base num, (8, 8), "10"),
  (fn (base, num) => dec2BaseN base num, (8, 17), "21"),

  (* 5. Convert a number to decimal (base 10) *)
  (fn (base, num) => dec2BaseN base num, (10, 42), "42"),

  (* 6. Edge case: Smallest and largest bases *)
  (fn (base, num) => dec2BaseN base num, (2, 255), "11111111"),
  (fn (base, num) => dec2BaseN base num, (10, 255), "255"),

  (* 7. Large number in a smaller base (binary) *)
  (fn (base, num) => dec2BaseN base num, (2, 1023), "1111111111"),

  (* 8. Large number in octal *)
  (fn (base, num) => dec2BaseN base num, (8, 1023), "1777"),

  (* 9. Check base boundaries (valid: 2 and 10) *)
  (fn (base, num) => dec2BaseN base num, (2, 42), "101010"),
  (fn (base, num) => dec2BaseN base num, (10, 42), "42"),

  (* 10. Test for negative input *)
  (fn (base, num) => dec2BaseN base num, (2, ~5), "~101"),
  (fn (base, num) => dec2BaseN base num, (2, ~13), "~1101")
];

runTests(
  testCasesToBaseN,
  fn (base, num) => "dec2BaseN(" ^ Int.toString base ^ ", " ^ Int.toString num ^ ")",
  (fn s => s) (* Identity function for string output *)
);
