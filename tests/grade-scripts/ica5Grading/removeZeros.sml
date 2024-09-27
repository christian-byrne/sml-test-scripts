fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting removeZeros...\n";
val act = removeZeros [1,2,3,4,5];
val score = score + check(act,[1,2,3,4,5]);
val act = removeZeros [0,1,0,2,0,3,0,4,0,5,0,6];
val score = score + check(act,[1,2,3,4,5,6]);


