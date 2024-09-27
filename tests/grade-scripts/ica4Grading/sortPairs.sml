val score = 0.0;
fun check (exp, act) = if exp = act then 0.5 else 0.0;
fun diff (r1 : real, r2) = if r1 < r2 then r2 - r1 else r1 - r2;
fun checkR (exp, act) = if diff (exp, act) <= 0.000001 then 0.5 else 0.0;

(* Testing sortPairs *)
val act = sortPairs((0, 5), (2, 1));
val exp = ((2,1),(0,5));
val score = score + check(act, exp);
val act = sortPairs((~4,6),(10,~5));
val exp = ((~4,6),(10,~5));
val score = score + check(act, exp);
