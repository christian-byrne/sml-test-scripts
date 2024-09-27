fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting reverseList...\n";
val act = reverseList [1,2,3,4,5];
val score = score + check(act,[5,4,3,2,1]);
val act = implode(reverseList(explode "arizona"));
val score = score + check(act,"anozira");

