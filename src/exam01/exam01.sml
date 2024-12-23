
fun raiseIfFalse(result) = if result then print("\nTest Passed\n") else raise Fail "Test failed";

(* char lengths question *)
fun charLengths li = foldl (fn (cur, acc) => acc + length(explode(cur))) 0 li;

val testCharLengths = charLengths ["hello", "world", "this", "is", "a", "test"]; (* should be 21 *)
raiseIfFalse(testCharLengths = 21);


(* insert question *)
fun insert comp add li = 
  let
    fun getLeft comp add li = foldr (fn (cur, acc) => if comp(cur, add) then cur::acc else acc) [] li;
    fun getRight comp add li = foldr (fn (cur, acc) => if comp(add, cur) then cur::acc else acc) [] li;
    val left = getLeft comp add li;
    val right = getRight comp add li;
  in
    left @ [add] @ right
  end


val testInsert = insert (fn (a, b) => a < b) 5 [1, 2, 3, 4, 6, 7, 8]; (* should be [1, 2, 3, 4, 5, 6, 7, 8] *)
raiseIfFalse(testInsert = [1, 2, 3, 4, 5, 6, 7, 8]);

(* map to tuple question *)
fun foo f li = map (fn (cur) => (cur, f(cur))) li;
val bar = foo (fn x => x * x) [1, 2, 3, 4]; (* should be [(1, 1), (2, 4), (3, 9), (4, 16)] *)
raiseIfFalse(bar = [(1, 1), (2, 4), (3, 9), (4, 16)]);

(* remove symmetric dups question *)
fun foo f li = foldr (fn ((cur1, cur2), acc) => if f(cur1) = f(cur2) then (cur1, cur2)::acc else acc) [] li;


