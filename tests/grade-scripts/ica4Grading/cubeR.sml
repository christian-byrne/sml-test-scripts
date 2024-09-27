val score = 0.0;
fun check (exp, act) = if exp = act then 0.5 else 0.0;
fun diff (r1 : real, r2) = if r1 < r2 then r2 - r1 else r1 - r2;
fun checkR (exp, act) = if diff (exp, act) <= 0.000001 then 0.5 else 0.0;

(* Testing cubeR *)
val act = cubeR 1.2;
val score = score + checkR(1.728,act);
val act = cubeR ~2.5;
val score = score + checkR(~15.625,act);

