(* Large Assignment 01 Tests *)

use "src/la1/la1.sml";
use "tests/utils.sml";

(* Test cases for the substring function *)
val testCasesSubstring = [
  (* 1. Empty substring (should always return true) *)
  (fn (s1, s2) => substring s1 s2, ("", "hello"), true),

  (* 2. Empty string to search within (should return false) *)
  (fn (s1, s2) => substring s1 s2, ("hello", ""), false),

  (* 3. Substring at the beginning *)
  (fn (s1, s2) => substring s1 s2, ("he", "hello"), true),

  (* 4. Substring at the end *)
  (fn (s1, s2) => substring s1 s2, ("lo", "hello"), true),

  (* 5. Substring in the middle *)
  (fn (s1, s2) => substring s1 s2, ("ell", "hello"), true),

  (* 6. Full string match *)
  (fn (s1, s2) => substring s1 s2, ("hello", "hello"), true),

  (* 7. Substring not found *)
  (fn (s1, s2) => substring s1 s2, ("world", "hello"), false),

  (* 8. Substring longer than the string *)
  (fn (s1, s2) => substring s1 s2, ("hello world", "hello"), false),
  
  (fn (s1, s2) => substring s1 s2, ("zon", "arizona"), true),

  (* 9. Case sensitivity check *)
  (fn (s1, s2) => substring s1 s2, ("Hello", "hello"), false),

  (* 10. Special characters *)
  (fn (s1, s2) => substring s1 s2, ("@", "email@example.com"), true),

  (* 11. Empty string is in Empty string *)
  (fn (s1, s2) => substring s1 s2, ("", ""), true),

  (* 12. Empty string is in one-character string *)
  (fn (s1, s2) => substring s1 s2, ("", "a"), true),

  (* 13. One-character string is in one-character string *)
  (fn (s1, s2) => substring s1 s2, ("a", "a"), true),

  (* 14. One-character string is not in one-character string *)
  (fn (s1, s2) => substring s1 s2, ("a", "b"), false),

  (* 15.a One-character string is not in string *)
  (fn (s1, s2) => substring s1 s2, ("a", "zcedfgfjklergioegmgelwk"), false),
  
  (* 15.b One-character string is last char in long string *)
  (fn (s1, s2) => substring s1 s2, ("a", "acedfgfjklergioegmgelwk"), true),

  (* 16. Two-character string is in two-character string *)
  (fn (s1, s2) => substring s1 s2, ("ab", "ab"), true),

  (* 17. Right arg is in left arg - supposedly not supposed to be covered; i.e., should be subtring, string *)
  (fn (s1, s2) => substring s1 s2, ("abc", "ab"), false)
];

runTests(
  testCasesSubstring,
  fn (s1, s2) => "substring(\"" ^ s1 ^ "\", \"" ^ s2 ^ "\")",
  valueToStringBool
);
