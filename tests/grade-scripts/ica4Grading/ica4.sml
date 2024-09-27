(* Question 1 *)
fun pTrip (a,b,c) = a*a + b*b = c*c;

(* Question 2 *)
fun cube a = a*a*a;

(* Question 3 *)
fun cubeR r : real = r*r*r;

(* Question 4 *)
fun combine ((i1,i2),(i3,r1),(r2,i4),(r3,r4)) = (real i1 + real i2)*(real i3 + r1)*(r2 + real i4)*(r3 + r4);

(* Question 5 *)
fun firstChars (s1, s2) = implode([hd(explode s1), hd(explode s2)]);

(* Question 6 *)
fun sortPairs ((a,b),(c,d)) = if a + b <= c + d then ((a,b),(c,d)) else ((c,d),(a,b));

