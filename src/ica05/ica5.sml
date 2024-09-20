(* functions.sml *)

fun log2(1) = 0
  | log2(n) = 1 + log2(n div 2);

fun factorial(0) = 1
  | factorial(n) = n * factorial(n - 1);

fun fib(0) = 0
  | fib(1) = 1
  | fib(n) = fib(n - 2) + fib(n - 1);

fun countZeros([]) = 0
  | countZeros(li) = 
    if hd(li) = 0 then 1 + countZeros(tl(li))
    else countZeros(tl(li));

fun orList([]) = false
  | orList(boolList) = orList(tl(boolList)) orelse hd(boolList);

fun andList([]) = true
  | andList(boolList) = hd(boolList) andalso andList(tl(boolList));

fun addLists([], []) = []
  | addLists([], li2) = hd(li2) :: addLists([], tl(li2))
  | addLists(li1, []) = hd(li1) :: addLists(tl(li1), [])
  | addLists(li1, li2) = hd(li1) + hd(li2) :: addLists(tl(li1), tl(li2));

fun reverseList([]) = []
  | reverseList(li) = reverseList(tl(li)) @ [hd(li)];

fun removeZeros([]) = []
  | removeZeros(li) =
    if hd(li) = 0 then removeZeros(tl(li))
    else hd(li) :: removeZeros(tl(li));

fun combineLists([], [], operator) = []
  | combineLists([], li2, operator) = operator(hd(li2)) :: combineLists([], tl(li2), operator)
  | combineLists(li1, [], operator) = operator(hd(li1)) :: combineLists(tl(li1), [], operator)
  | combineLists(li1, li2, operator) = operator(hd(li1) + hd(li2)) :: combineLists(tl(li1), tl(li2), operator);
