fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting log2...\n";
val act = log2 16;
val score = score + check(act,4);
val act = log2 35;
val score = score + check(act,5);

print "\nTesting factorial...\n";
val act = factorial 4;
val score = score + check(act,24);
val act = factorial 0;
val score = score + check(act,1);

print "\nTesting fib...\n";
val act = fib 2;
val score = score + check(act,1);
val act = fib 6;
val score = score + check(act,8);

print "\nTesting countZeros...\n";
val act = countZeros [1,2,3,4,5,6,7];
val score = score + check(act,0);
val act = countZeros [0,1,0,2,0,3,0,4,0,5];
val score = score + check(act,5);

print "\nTesting orList...\n";
val act = orList [false,false,false];
val score = score + check(act,false);
val act = orList [false,false,true,false];
val score = score + check(act,true);

print "\nTesting andList...\n";
val act = andList [true,true,false];
val score = score + check(act,false);
val act = andList [true,true,true,true];
val score = score + check(act,true);

print "\nTesting addLists...\n";
val act = addLists ([1,3,4,5],[~1,0,~8]);
val score = score + check(act,[0,3,~4]);
val act = addLists ([0,1,1,2,3],[2,2,3,4,5,6]);
val score = score + check(act,[2,3,4,6,8]);

print "\nTesting reverseList...\n";
val act = reverseList [1,2,3,4,5];
val score = score + check(act,[5,4,3,2,1]);
val act = implode(reverseList(explode "arizona"));
val score = score + check(act,"anozira");

print "\nTesting removeZeros...\n";
val act = removeZeros [1,2,3,4,5];
val score = score + check(act,[1,2,3,4,5]);
val act = removeZeros [0,1,0,2,0,3,0,4,0,5,0,6];
val score = score + check(act,[1,2,3,4,5,6]);

print "\nTesting combineLists...\n";
val act = combineLists ([1,2,3,4,5],[~1,~2,~3],(op * ));
val score = score + check(act,[~1,~4,~9]);
val act = combineLists(["a","b","c"],explode "arizona", (fn (s,c) => s ^ str c)); 
val score = score + check(act,["aa","br","ci"]);


