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

