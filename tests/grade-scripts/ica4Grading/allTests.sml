val score = 0.0;
fun check (exp, act) = if exp = act then 0.5 else 0.0;
fun diff (r1 : real, r2) = if r1 < r2 then r2 - r1 else r1 - r2;
fun checkR (exp, act) = if diff (exp, act) <= 0.000001 then 0.5 else 0.0;

(* Testing pTrip *)
val act = pTrip(3,4,5);
val score = score + check(true,act);
val act = pTrip(1,1,2);
val score = score + check(false,act);

(* Testing cube *)
val act = cube ~3;
val score = score + check(~27,act);
val act = cube 5;
val score = score + check(125,act);

(* Testing cubeR *)
val act = cubeR 1.2;
val score = score + checkR(1.728,act);
val act = cubeR ~2.5;
val score = score + checkR(~15.625,act);

(* Testing combine *)
val act = combine ((1,2),(2,3.4),(4.5,~2),(6.7,8.9));
val score = score + checkR(631.8,act);
val act = combine ((~1,1),(6,~2.5),(1.11,2),(9.0,2.33));
val score = score + checkR(0.0,act);

(* Testing firstChars *)
val act = firstChars("apple", "banana");
val score = score + check("ab",act);
val act = firstChars("Hello","Goodbye");
val score = score + check("HG",act);

(* Testing sortPairs *)
val act = sortPairs((0, 5), (2, 1));
val exp = ((2,1),(0,5));
val score = score + check(act, exp);
val act = sortPairs((~4,6),(10,~5));
val exp = ((~4,6),(10,~5));
val score = score + check(act, exp);
