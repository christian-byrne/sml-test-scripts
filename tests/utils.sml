(* Function to convert int to string *)
fun valueToStringInt(n: int) = Int.toString(n);

(* Function to convert bool to string *)
fun valueToStringBool(true) = "true"
  | valueToStringBool(false) = "false";

(* Function to convert int list to string *)
fun valueToStringIntList([]) = "[]"
  | valueToStringIntList(lst) = "[" ^ String.concatWith ", " (List.map Int.toString lst) ^ "]";

(* Function to color the output in the terminal *)
fun red(s) = "\027[31m" ^ s ^ "\027[0m"
fun green(s) = "\027[32m" ^ s ^ "\027[0m";

(* Generic test runner for int * int * int -> bool functions *)
fun runTestCasesIntIntIntBool([]) = ()
  | runTestCasesIntIntIntBool(testCaseList) = 
    let 
      val (f, param1, param2, param3, expected) = hd(testCaseList);
      val result = f(param1, param2, param3);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Arguments: " ^ valueToStringInt(param1) ^ ", " ^ valueToStringInt(param2) ^ ", " ^ valueToStringInt(param3) ^ "\n" ^
          "Expected: " ^ valueToStringBool(expected) ^ "\n" ^
          "Actual: " ^ valueToStringBool(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesIntIntIntBool(tl(testCaseList))
    end;

(* Generic test runner for real * real * real -> bool functions *)
fun runTestCasesRealRealRealBool([]) = ()
  | runTestCasesRealRealRealBool(testCaseList) = 
    let 
      val (f, param1, param2, param3, expected) = hd(testCaseList);
      val result = f(param1, param2, param3);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Arguments: " ^ Real.toString(param1) ^ ", " ^ Real.toString(param2) ^ ", " ^ Real.toString(param3) ^ "\n" ^
          "Expected: " ^ valueToStringBool(expected) ^ "\n" ^
          "Actual: " ^ valueToStringBool(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesRealRealRealBool(tl(testCaseList))
    end;

(* Generic test runner for int * int -> bool functions *)

(* Generic test runner for int -> int functions *)
fun runTestCasesIntInt([]) = ()
  | runTestCasesIntInt(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Expected: " ^ valueToStringInt(expected) ^ "\n" ^
          "Actual: " ^ valueToStringInt(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesIntInt(tl(testCaseList))
    end;

(* Generic test runner for bool list -> bool functions *)
fun runTestCasesBoolListBool([]) = ()
  | runTestCasesBoolListBool(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Expected: " ^ valueToStringBool(expected) ^ "\n" ^
          "Actual: " ^ valueToStringBool(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesBoolListBool(tl(testCaseList))
    end;

fun runTestCasesIntListInt([]) = ()
(* going from int list to a single int *)
  | runTestCasesIntListInt(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Expected: " ^ valueToStringInt(expected) ^ "\n" ^
          "Actual: " ^ valueToStringInt(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesIntListInt(tl(testCaseList))
    end;

(* Generic test runner for int list -> int list functions *)
fun runTestCasesIntListIntList([]) = ()
  | runTestCasesIntListIntList(testCaseList) = 
    let 
      val (f, param, expected) = hd(testCaseList);
      val result = f(param);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ 
          "Expected: " ^ valueToStringIntList(expected) ^ "\n" ^
          "Actual: " ^ valueToStringIntList(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesIntListIntList(tl(testCaseList))
    end;

(* Generic test runner for int list -> int list -> int list -> int list functions *)
fun runTestCasesIntListIntListOperatorToIntList([]) = ()
  | runTestCasesIntListIntListOperatorToIntList(testCaseList) = 
    let 
      val (f, param1, param2, operator, expected) = hd(testCaseList);
      val result = f(param1, param2, operator);
      val testMessage = 
        if result <> expected then
          red("Test failed\n") ^ "Expected: " ^ valueToStringIntList(expected) ^ "\n" ^
          "Actual: " ^ valueToStringIntList(result) ^ "\n\n"
        else 
          green("Test passed\n");
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCasesIntListIntListOperatorToIntList(tl(testCaseList))
    end;
