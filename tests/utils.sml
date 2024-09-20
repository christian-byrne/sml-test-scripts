
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
      (* Error code so GH actions can detect if a test failed *)
      if result <> expected then raise Fail("Test failed") else runTestCases(tl(testCaseList))
      (* runTestCases(tl(testCaseList)) *)
    end;
