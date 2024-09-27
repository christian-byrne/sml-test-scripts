fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;


print "\nTesting orList...\n";
val act = orList [false,false,false];
val score = score + check(act,false);
val act = orList [false,false,true,false];
val score = score + check(act,true);

