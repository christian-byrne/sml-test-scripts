(* Test case generator chat session: https://chatgpt.com/c/66f74278-0154-800a-9ca0-abe87126291e *)

(* --------------------------- toString Functions --------------------------- *)

(* Function to convert int to string *)
fun valueToStringInt(n: int) = Int.toString(n);

(* Function to convert bool to string *)
fun valueToStringBool(true) = "true"
  | valueToStringBool(false) = "false";

(* Function to convert int list to string *)
fun valueToStringIntList([]) = "[]"
  | valueToStringIntList(lst) =
      "[" ^ String.concatWith ", " (List.map Int.toString lst) ^ "]";

(* Function to convert bool list to string *)
fun valueToStringBoolList([]) = "[]"
  | valueToStringBoolList(lst) =
      "[" ^ String.concatWith ", " (List.map valueToStringBool lst) ^ "]";

(* Function to convert string list to string *)
fun valueToStringStringList([]) = "[]"
  | valueToStringStringList(lst) =
      "[" ^ String.concatWith ", " lst ^ "]";

(* Function to convert char list to string *)
fun valueToStringCharList([]) = "[]"
  | valueToStringCharList(lst) =
      "[" ^ String.concatWith ", " (List.map Char.toString lst) ^ "]";


(* ---------------------- Comparator/Equality Functions --------------------- *)

fun isEqualList([], []) = true
  | isEqualList(x::xs, y::ys) = x = y andalso isEqualList(xs, ys)
  | isEqualList(_, _) = false;

(* ------------------------------- Formatters ------------------------------- *)

(* Function to color the output in the terminal *)
fun red(s) = "\027[31m" ^ s ^ "\027[0m";
fun green(s) = "\027[32m" ^ s ^ "\027[0m";

(* ------------------------------ Test Runners ------------------------------ *)

(* Generic test runner *)
fun runTests([], _, _) = ()
  | runTests(testCase::testCaseList, paramToString, resultToString) =
    let
      val (f, params, expected) = testCase
      val result = f(params)
      val testMessage =
        if result <> expected then
          red("Test failed\n") ^
          "Arguments: " ^ paramToString(params) ^ "\n" ^
          "Expected: " ^ resultToString(expected) ^ "\n" ^
          "Actual: " ^ resultToString(result) ^ "\n\n"
        else
          green("Test passed\n")
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed")
      else runTests(testCaseList, paramToString, resultToString)
    end;

(* Generic test runner with custom comparator equality function *)
fun runTestsCustomComparator([], _, _, _) = ()
  | runTestsCustomComparator(testCase::testCaseList, paramToString, resultToString, isEqual) =
    let
      val (f, params, expected) = testCase
      val result = f(params)
      val testMessage =
        if not(isEqual(result, expected)) then
          red("Test failed\n") ^
          "Arguments: " ^ paramToString(params) ^ "\n" ^
          "Expected: " ^ resultToString(expected) ^ "\n" ^
          "Actual: " ^ resultToString(result) ^ "\n\n"
        else
          green("Test passed\n")
    in
      print(testMessage);
      (* Error code so GH actions can detect if a test failed *)
      if not(isEqual(result, expected)) then raise Fail("Test failed")
      else runTestsCustomComparator(testCaseList, paramToString, resultToString, isEqual)
    end;

