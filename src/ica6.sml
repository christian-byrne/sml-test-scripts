fun runTestCases([]) = ()
  | runTestCases(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
    in
      if result <> expected then print("Test failed\n")
      else print("");
      runTestCases(tl(testCaseList))
    end;

(* Question 1 *)
fun log2(1) = 0
  | log2(n) = 1 + log2(n div 2);

(* Question 2 *)
fun factorial(0) = 1
  | factorial(n) = n * factorial(n-1);

(* Question 3 *)
fun fib(0) = 0
  | fib(1) = 1
  | fib(n) = fib(n-2) + fib(n-1);

(* Question 4 *)
fun countZeros([]) = 0
  | countZeros(li) = 
    if hd(li) = 0 then 1 + countZeros(tl(li))
    else countZeros(tl(li));

(* Question 5 *)
fun orList([]) = false
  | orList(boolList) = 
    orList(tl(boolList)) orelse hd(boolList);

(* Question 6 *)
fun andList([]) = true
  | andList(boolList) =
    hd(boolList) andalso andList(boolList);

(* Question 7 *)
fun addLists([], []) = []
  | addLists([], li2) = hd(li2) :: 
      addLists([], tl(li2))
  | addLists(li1, []) = hd(li1) :: 
      addLists(tl(li1), [])
  | addLists(li1, li2) = 
      hd(li1) + hd(li2) :: 
      addLists(tl(li1), tl(li2));

(* Question 8 *)
fun reverseList([]) = []
  | reverseList(li) = 
    reverseList(tl(li)) @ [hd(li)];

(* Question 9 *)
fun removeZeros([]) = []
  | removeZeroes(li) =
    if hd(li) = 0 then li
    else removeZeros(tl(li)) :: hd(li);
    
(* Question 10 *)
fun combineLists([], [], operator) = []
  | combineLists([], li2, operator) = 
      hd(li2) :: 
      combineLists([], tl(li2), operator)
  | combineLists(li1, [], operator) = 
      hd(li1) :: 
      combineLists(tl(l1), [], operator)
  | combineLists(li1, li2, operator) = 
      operator(hd(li1) + hd(li2)) :: 
      combineLists(tl(l1), tl(l2), operator);

val testCasesOrList = [
  (orList, [true, true, true], true), (* true *)
  (orList, [true, false, true], true), (* true *)
  (orList, [false, false, false], false), (* false *)
  (orList, [true, true, false], true), (* true *)
  (orList, [false, false, true], true) (* true *)
];
runTestCases(testCasesOrList);

val testCasesLog2 = [
  (log2, 1, 0), (* 2^0 = 1 *)
  (log2, 2, 1), (* 2^1 = 2 *)
  (log2, 4, 2), (* 2^2 = 4 *)
  (log2, 8, 3), (* 2^3 = 8 *)
  (log2, 16, 4) (* 2^4 = 16 *)
];
runTestCases(testCasesLog2);

val testCasesFactorial = [
  (factorial, 0, 1), (* 0! = 1 *)
  (factorial, 1, 1), (* 1! = 1 *)
  (factorial, 2, 2), (* 2! = 2 *)
  (factorial, 3, 6), (* 3! = 6 *)
  (factorial, 4, 24), (* 4! = 24 *)
  (factorial, 5, 120) (* 5! = 120 *)
];
runTestCases(testCasesFactorial);

val testCasesFib = [
  (* a_n = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34} *)
  (fib, 0, 0), (* a_0 = 0 *)
  (fib, 1, 1), (* a_1 = 1 *)
  (fib, 2, 1), (* a_2 = 1 *)
  (fib, 3, 2), (* a_3 = 2 *)
  (fib, 4, 3), (* a_4 = 3 *)
  (fib, 5, 5), (* a_5 = 5 *)
  (fib, 6, 8), (* a_6 = 8 *)
  (fib, 7, 13) (* a_7 = 13 *)
];
runTestCases(testCasesFib);

val testCasesCountZeros = [
  (countZeros, [0, 1, 0, 1, 0], 3), (* 3 zeros *)
  (countZeros, [1, 1, 1, 1, 1], 0), (* 0 zeros *)
  (countZeros, [0, 0, 0, 0, 0], 5), (* 5 zeros *)
  (countZeros, [], 0), (* 0 zeros *)
  (countZeros, [0], 0), (* 1 zeros *)
  (countZeros, [1], 0) (* 0 zeros *)
];
runTestCases(testCasesCountZeros);
