(* Question 1 *)
fun log2 1 = 0
| log2 n = 1 + log2(n div 2);

(* Question 2 *)
fun factorial 0 = 1
| factorial n = n * factorial(n-1);

(* Question 3 *)
fun fib 0 = 0
| fib 1 = 1
| fib n = fib(n-1) + fib(n-2);

(* Question 4 *)
fun countZeros [] = 0
| countZeros (0::tail) = 1 + countZeros(tail)
| countZeros (_::tail) = countZeros(tail);

(* Question 5 *)
fun orList [] = false
| orList (x::xs) = x orelse orList(xs);

(* Question 6 *)
fun andList [] = true
| andList (x::xs) = x andalso andList(xs);

(* Question 7 *)
fun addLists ([],_) = []
| addLists (_,[]) = []
| addLists (x::xs, y::ys) = (x+y)::addLists(xs,ys);

(* Question 8 *)
fun reverseList [] = []
| reverseList (x::xs) = reverseList(xs)@[x];

(* Question 9 *)
fun removeZeros [] = []
| removeZeros (0::xs) = removeZeros(xs)
| removeZeros (x::xs) = x::removeZeros(xs);

(* Question 10 *)
fun combineLists ([],_,_) = []
| combineLists (_,[],_) = []
| combineLists (x::xs,y::ys,f) = f(x,y)::combineLists(xs,ys,f);

