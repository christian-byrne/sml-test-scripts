fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting log2...\n";
val act = log2 16;
val score = score + check(act,4);
val act = log2 35;
val score = score + check(act,5);

