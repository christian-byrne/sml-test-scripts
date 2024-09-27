fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting countZeros...\n";
val act = countZeros [1,2,3,4,5,6,7];
val score = score + check(act,0);
val act = countZeros [0,1,0,2,0,3,0,4,0,5];
val score = score + check(act,5);

