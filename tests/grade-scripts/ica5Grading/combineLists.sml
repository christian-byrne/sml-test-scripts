fun check (a,e) = if a = e then 0.5 else 0.0;
val score = 0.0;

print "\nTesting combineLists...\n";
val act = combineLists ([1,2,3,4,5],[~1,~2,~3],(op * ));
val score = score + check(act,[~1,~4,~9]);
val act = combineLists(["a","b","c"],explode "arizona", (fn (s,c) => s ^ str c)); 
val score = score + check(act,["aa","br","ci"]);


