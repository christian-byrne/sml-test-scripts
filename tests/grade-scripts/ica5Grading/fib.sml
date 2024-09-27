fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting fib...\n";
val act = fib 2;
val score = score + check(act,1);
val act = fib 6;
val score = score + check(act,8);
