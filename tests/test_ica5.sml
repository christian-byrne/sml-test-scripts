use "src/ica05/ica5.sml";

(* TODO: the test runner functions should be moved to a separate file *)

(* Function to color the output in the terminal *)
fun red(s) = "\027[31m" ^ s ^ "\027[0m"
fun green(s) = "\027[32m" ^ s ^ "\027[0m"


(* Enhanced test case runner with more visual indicators *)
fun runTestCases([]) = ()
  | runTestCases(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Expected: " ^ Int.toString(expected) ^ "\n" ^
          "Actual: " ^ Int.toString(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      runTestCases(tl(testCaseList))
    end;


val testCasesLog2 = [
  (log2, 1, 0), (* 2^0 = 1 *)
  (log2, 2, 1), (* 2^1 = 2 *)
  (log2, 4, 2), (* 2^2 = 4 *)
  (log2, 8, 3), (* 2^3 = 8 *)
  (log2, 16, 4), (* 2^4 = 16 *)
  (log2, 32, 5), (* 2^5 = 32 *)
  (log2, 64, 6), (* 2^6 = 64 *)
  (log2, 128, 7), (* 2^7 = 128 *)
  (log2, 256, 8) (* 2^8 = 256 *)
];
runTestCases(testCasesLog2);

val testCasesFactorial = [
  (factorial, 0, 1), (* 0! = 1 *)
  (factorial, 1, 1), (* 1! = 1 *)
  (factorial, 2, 2), (* 2! = 2 *)
  (factorial, 3, 6), (* 3! = 6 *)
  (factorial, 4, 24), (* 4! = 24 *)
  (factorial, 5, 120), (* 5! = 120 *)
  (factorial, 6, 720), (* 6! = 720 *)
  (factorial, 7, 5040), (* 7! = 5040 *)
  (factorial, 8, 40320), (* 8! = 40320 *)
  (factorial, 10, 3628800) (* 10! = 3628800 *)
];
runTestCases(testCasesFactorial);

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
runTestCases(testCasesFib);

val testCasesCountZeros = [
  (countZeros, [0, 1, 0, 1, 0], 3), 
  (countZeros, [1, 1, 1, 1, 1], 0), 
  (countZeros, [0, 0, 0, 0, 0], 5), 
  (countZeros, [], 0), 
  (countZeros, [0], 1), 
  (countZeros, [1], 0),
  (countZeros, [0, 0, 0, 1, 0], 4), 
  (countZeros, [1, 0, 1, 0, 1], 2), 
  (countZeros, [0, 0, 1, 0, 0, 0], 5)
];
runTestCases(testCasesCountZeros);

val testCasesOrList = [
  (orList, [true, true, true], true), 
  (orList, [true, false, true], true), 
  (orList, [false, false, false], false), 
  (orList, [true, true, false], true), 
  (orList, [false, false, true], true), 
  (orList, [false, false, false, false], false),
  (orList, [false, true, false, true], true),
  (orList, [], false), (* Empty list case *)
  (orList, [false], false), (* Single false element *)
  (orList, [true], true) (* Single true element *)
];
runTestCases(testCasesOrList);

val testCasesAndList = [
  (andList, [true, true, true], true), 
  (andList, [true, false, true], false), 
  (andList, [false, false, false], false), 
  (andList, [], true), (* Empty list case *)
  (andList, [true], true),
  (andList, [false], false)
];
runTestCases(testCasesAndList);

val testCasesAddLists = [
  (addLists, ([1, 2, 3], [4, 5, 6]), [5, 7, 9]), 
  (addLists, ([1, 2], [4, 5, 6]), [5, 7, 6]), 
  (addLists, ([1, 2, 3], []), [1, 2, 3]), 
  (addLists, ([], [4, 5, 6]), [4, 5, 6]),
  (addLists, ([], []), [])
];
runTestCases(testCasesAddLists);

val testCasesReverseList = [
  (reverseList, [1, 2, 3], [3, 2, 1]), 
  (reverseList, [1], [1]), 
  (reverseList, [], []), 
  (reverseList, [4, 5, 6, 7], [7, 6, 5, 4])
];
runTestCases(testCasesReverseList);

fun removeZeros([]) = []
  | removeZeros(li) =
    if hd(li) = 0 then removeZeros(tl(li))
    else hd(li) :: removeZeros(tl(li));

val testCasesRemoveZeros = [
  (removeZeros, [0, 1, 0, 2], [1, 2]), 
  (removeZeros, [0, 0, 0], []), 
  (removeZeros, [1, 2, 3], [1, 2, 3]), 
  (removeZeros, [], []), 
  (removeZeros, [0], [])
];
runTestCases(testCasesRemoveZeros);

fun add(x, y) = x + y;

val testCasesCombineLists = [
  (combineLists, ([1, 2, 3], [4, 5, 6], add), [5, 7, 9]), 
  (combineLists, ([1, 2], [4, 5, 6], add), [5, 7, 6]), 
  (combineLists, ([1, 2, 3], [], add), [1, 2, 3]), 
  (combineLists, ([], [4, 5, 6], add), [4, 5, 6])
];
runTestCases(testCasesCombineLists);
