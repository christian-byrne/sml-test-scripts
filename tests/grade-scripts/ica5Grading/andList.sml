fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;


print "\nTesting andList...\n";
val act = andList [true,true,false];
val score = score + check(act,false);
val act = andList [true,true,true,true];
val score = score + check(act,true);

