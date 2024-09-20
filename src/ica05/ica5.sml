(* Question 1 *)
fun log2(1) = 0
  | log2(n) = 1 + log2(n div 2);

(* Question 2 *)
fun factorial(0) = 1
  | factorial(n) = n * factorial(n - 1);

(* Question 3 *)
fun fib(0) = 0
  | fib(1) = 1
  | fib(n) = fib(n - 2) + fib(n - 1);

(* Question 4 *)
fun countZeros([]) = 0
  | countZeros(li) = 
    if hd(li) = 0 then 1 + countZeros(tl(li))
    else countZeros(tl(li));

(* Question 5 *)
fun orList([]) = false
  | orList(boolList) = orList(tl(boolList)) orelse hd(boolList);

(* Question 6 *)
fun andList([]) = true
  | andList(boolList) = hd(boolList) andalso andList(tl(boolList));

(* Question 7 *)
fun addLists([], []) = []
  | addLists([], li2) = hd(li2) :: addLists([], tl(li2))
  | addLists(li1, []) = hd(li1) :: addLists(tl(li1), [])
  | addLists(li1, li2) = hd(li1) + hd(li2) :: addLists(tl(li1), tl(li2));

(* Question 8 *)
fun reverseList([]) = []
  | reverseList(li) = reverseList(tl(li)) @ [hd(li)];

(* Question 9 *)
fun removeZeros([]) = []
  | removeZeros(li) =
    if hd(li) = 0 then removeZeros(tl(li))
    else hd(li) :: removeZeros(tl(li));

(* Question 10 *)
fun combineLists([], [], operator) = []
  | combineLists([], li2, operator) = operator(hd(li2)) :: combineLists([], tl(li2), operator)
  | combineLists(li1, [], operator) = operator(hd(li1)) :: combineLists(tl(li1), [], operator)
  | combineLists(li1, li2, operator) = operator(hd(li1) + hd(li2)) :: combineLists(tl(li1), tl(li2), operator);
