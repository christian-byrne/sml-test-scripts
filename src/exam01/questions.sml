

(* Question n *)
fun insert comp add li =
  let
    fun getLeft comp add li = foldr (fn (cur, acc) => if comp(cur, add) then cur::acc else acc) [] li
    fun getRight comp add li = foldr (fn (cur, acc) => if comp(add, cur) then cur::acc else acc) [] li
    val left = getLeft comp add li
    val right = getRight comp add li
  in
    left @ [add] @ right
  end;

val res = insert (op <=) 4 [1,2,3,5,6];

(* Question n *)
fun countGreaterThan p li = foldl (fn (cur, acc) => if cur > p then 1 + acc else acc) 0 li;

val res2 = countGreaterThan 4 [1,2,3,4,5,6]; (* shuold be 2 *)

(* Question n *)
fun countDups([]) = 0
  | countDups([_]) = 0
  | countDups(x::y::li) =
    if x = y
    then 1 + countDups(li)
    (* Forget to prepend y back if no duplicate *)
    else countDups(li); (* Should be: else countDups(y::li) *)

val res3 = countDups([1,1,1,2,2,3,3,4,5,6]) (* should be 3 *)


(* Question n *)
fun countChars li = foldl (fn (cur, acc) => acc + length(explode(cur))) 0 li;

val res4 = countChars ["123", "456", "789", "1"]; (* should be 10 *)


