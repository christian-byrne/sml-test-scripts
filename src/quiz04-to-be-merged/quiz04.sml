fun foo l = map real l;
foo [1,2,3];

fun foo l = foldr (fn (e, li) => e::e::li) [] l;
foo [1,2,3];

fun foo p l = foldr (fn (e, (lt, gt)) => if e <= p then (e::lt,gt) else (lt,e::gt)) ([],[]) l;
foo 3 [1,2,3,4,5];

fun cubelist li = map (fn(cur) => cur*cur*cur) li;
cubelist [1,2,3];

fun removeAll li x = foldr (fn (cur, acc) => if cur = x then acc else cur::acc) [] li;
removeAll [1,2,3,4,5,6,7,8,9,10] 5;

(* You can rearrange the order of the params like this *)
fun removeAll x li = foldr (fn (cur, acc) => if cur = x then acc else cur::acc) [] li;
removeAll 0 [1,2,0,3,4,0,5];