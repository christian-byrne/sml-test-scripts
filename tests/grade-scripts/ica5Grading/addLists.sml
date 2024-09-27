fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting addLists...\n";
val act = addLists ([1,3,4,5],[~1,0,~8]);
val score = score + check(act,[0,3,~4]);
val act = addLists ([0,1,1,2,3],[2,2,3,4,5,6]);
val score = score + check(act,[2,3,4,6,8]);
