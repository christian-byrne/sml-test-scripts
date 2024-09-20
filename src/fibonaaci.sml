(* fibonacci.sml *)
fun fibonacci 0 = 0
  | fibonacci 1 = 1
  | fibonacci n = fibonacci (n - 1) + fibonacci (n - 2);

(* Calculate the first 10 Fibonacci numbers and store them in a list *)
val fib_list = map fibonacci [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

(* Print the result *)
fib_list;

