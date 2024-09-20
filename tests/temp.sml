use "src/ica05/ica5.sml" (* Test runner called from root of project *)

(* Tests for log2 *)
val test_log2 = SU.suite "Log2 Tests" [
  SU.test "log2(1)" (fn () => SU.assertEqual (log2 1, 0)),
  SU.test "log2(2)" (fn () => SU.assertEqual (log2 2, 1)),
  SU.test "log2(4)" (fn () => SU.assertEqual (log2 4, 2)),
  SU.test "log2(8)" (fn () => SU.assertEqual (log2 8, 3)),
  SU.test "log2(16)" (fn () => SU.assertEqual (log2 16, 4))
]

(* Tests for factorial *)
val test_factorial = SU.suite "Factorial Tests" [
  SU.test "factorial(0)" (fn () => SU.assertEqual (factorial 0, 1)),
  SU.test "factorial(1)" (fn () => SU.assertEqual (factorial 1, 1)),
  SU.test "factorial(2)" (fn () => SU.assertEqual (factorial 2, 2)),
  SU.test "factorial(3)" (fn () => SU.assertEqual (factorial 3, 6)),
  SU.test "factorial(4)" (fn () => SU.assertEqual (factorial 4, 24)),
  SU.test "factorial(5)" (fn () => SU.assertEqual (factorial 5, 120))
]

(* Tests for fib *)
val test_fib = SU.suite "Fibonacci Tests" [
  SU.test "fib(0)" (fn () => SU.assertEqual (fib 0, 0)),
  SU.test "fib(1)" (fn () => SU.assertEqual (fib 1, 1)),
  SU.test "fib(2)" (fn () => SU.assertEqual (fib 2, 1)),
  SU.test "fib(3)" (fn () => SU.assertEqual (fib 3, 2)),
  SU.test "fib(4)" (fn () => SU.assertEqual (fib 4, 3)),
  SU.test "fib(5)" (fn () => SU.assertEqual (fib 5, 5)),
  SU.test "fib(6)" (fn () => SU.assertEqual (fib 6, 8)),
  SU.test "fib(7)" (fn () => SU.assertEqual (fib 7, 13))
]

(* Tests for countZeros *)
val test_countZeros = SU.suite "Count Zeros Tests" [
  SU.test "countZeros([0,1,0,1,0])" (fn () => SU.assertEqual (countZeros [0,1,0,1,0], 3)),
  SU.test "countZeros([1,1,1,1,1])" (fn () => SU.assertEqual (countZeros [1,1,1,1,1], 0)),
  SU.test "countZeros([0,0,0,0,0])" (fn () => SU.assertEqual (countZeros [0,0,0,0,0], 5)),
  SU.test "countZeros([])" (fn () => SU.assertEqual (countZeros [], 0)),
  SU.test "countZeros([0])" (fn () => SU.assertEqual (countZeros [0], 1)),
  SU.test "countZeros([1])" (fn () => SU.assertEqual (countZeros [1], 0))
]

(* Tests for orList *)
val test_orList = SU.suite "orList Tests" [
  SU.test "orList([true, true, true])" (fn () => SU.assertEqual (orList [true, true, true], true)),
  SU.test "orList([true, false, true])" (fn () => SU.assertEqual (orList [true, false, true], true)),
  SU.test "orList([false, false, false])" (fn () => SU.assertEqual (orList [false, false, false], false)),
  SU.test "orList([true, true, false])" (fn () => SU.assertEqual (orList [true, true, false], true)),
  SU.test "orList([false, false, true])" (fn () => SU.assertEqual (orList [false, false, true], true))
]

(* Tests for andList *)
val test_andList = SU.suite "andList Tests" [
  SU.test "andList([true, true, true])" (fn () => SU.assertEqual (andList [true, true, true], true)),
  SU.test "andList([true, false, true])" (fn () => SU.assertEqual (andList [true, false, true], false)),
  SU.test "andList([false, false, false])" (fn () => SU.assertEqual (andList [false, false, false], false)),
  SU.test "andList([true, true, false])" (fn () => SU.assertEqual (andList [true, true, false], false)),
  SU.test "andList([true, true, true])" (fn () => SU.assertEqual (andList [true, true, true], true))
]

(* Tests for addLists *)
val test_addLists = SU.suite "addLists Tests" [
  SU.test "addLists([1,2,3], [4,5,6])" (fn () => SU.assertEqual (addLists([1,2,3], [4,5,6]), [5,7,9])),
  SU.test "addLists([1,2], [3,4,5])" (fn () => SU.assertEqual (addLists([1,2], [3,4,5]), [4,6,5])),
  SU.test "addLists([1,2,3], [4])" (fn () => SU.assertEqual (addLists([1,2,3], [4]), [5,2,3]))
]

(* Tests for reverseList *)
val test_reverseList = SU.suite "reverseList Tests" [
  SU.test "reverseList([1,2,3])" (fn () => SU.assertEqual (reverseList [1,2,3], [3,2,1])),
  SU.test "reverseList([])" (fn () => SU.assertEqual (reverseList [], [])),
  SU.test "reverseList([1])" (fn () => SU.assertEqual (reverseList [1], [1]))
]

(* Tests for removeZeros *)
val test_removeZeros = SU.suite "removeZeros Tests" [
  SU.test "removeZeros([0,1,0,2,0,3])" (fn () => SU.assertEqual (removeZeros [0,1,0,2,0,3], [1,2,3])),
  SU.test "removeZeros([1,2,3])" (fn () => SU.assertEqual (removeZeros [1,2,3], [1,2,3])),
  SU.test "removeZeros([0,0,0])" (fn () => SU.assertEqual (removeZeros [0,0,0], []))
]

(* Tests for combineLists *)
val test_combineLists = SU.suite "combineLists Tests" [
  SU.test "combineLists([1,2,3], [4,5,6], fn x => x)" (fn () => SU.assertEqual (combineLists([1,2,3], [4,5,6], fn x => x), [5,7,9])),
  SU.test "combineLists([1,2], [3,4], fn x => x * 2)" (fn () => SU.assertEqual (combineLists([1,2], [3,4], fn x => x * 2), [8,12]))
]

(* Run all tests *)
val _ = SU.run test_log2
val _ = SU.run test_factorial
val _ = SU.run test_fib
val _ = SU.run test_countZeros
val _ = SU.run test_orList
val _ = SU.run test_andList
val _ = SU.run test_addLists
val _ = SU.run test_reverseList
val _ = SU.run test_removeZeros
val _ = SU.run test_combineLists
