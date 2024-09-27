fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting factorial...\n";
val act = factorial 4;
val score = score + check(act,24);
val act = factorial 0;
val score = score + check(act,1);

