val score = 0.0;
fun check (exp, act) = if exp = act then 0.5 else 0.0;
fun diff (r1 : real, r2) = if r1 < r2 then r2 - r1 else r1 - r2;
fun checkR (exp, act) = if diff (exp, act) <= 0.000001 then 0.5 else 0.0;

(* Testing combine *)
val act = combine ((1,2),(2,3.4),(4.5,~2),(6.7,8.9));
val score = score + checkR(631.8,act);
val act = combine ((~1,1),(6,~2.5),(1.11,2),(9.0,2.33));
val score = score + checkR(0.0,act);

