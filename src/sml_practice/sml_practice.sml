
(* map = fn : ('a -> 'b) -> 'a list -> 'b list *)
(* foldl = fn : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)
(* foldr = fn : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)

(* il2rl *)
(* turns an int list into a real list *)
fun il2rl a = map (fn(i) => real(i)) a

val test_il2rl = il2rl([1,2,3,4])

(* squareList *)
(* takes an int list and returns a list of all the squares of
the integer *)
fun squareList a = map (fn(i) => i * i) a

val test_squareList = squareList([1, 2, 3, 4]) (* [1,4,9,16] *)

(* sqSum *)
(* takes an int list and returns the sum of the squares of the integers in the list *)
fun sqSum d = foldr (fn (a, b) => (a * a) + b) 0 d;

val test_sqSum = sqSum([1,2,3,4]) (* 30 *)

(* dupList *)
(* takes list of any type and returns a new list where all the elements are duplicated *)
fun dupList li = foldr (fn (cur, accumulator) => [cur, cur] @ accumulator) [] li;

val test_dupList = dupList([1,2,3,4]);

(* myLength *)
(* takes a list and counts the number of elements in the list
(without using the built-in length function) *)
fun myLength li = foldr (fn (cur, accumulator) => accumulator + 1) 0 li;

val test_myLength = myLength([1,2,3,4]);

(* il2absrl *)
(* takes an integer list and returns a list containing the absolute value of each element as a real *)
fun il2absrl li = foldl (fn (cur, accumulator) => accumulator @ [real(if cur > 0 then cur else cur * ~1)]) [] li;

val test_il2absrl = il2absrl([~1, 2, 3, ~4]) (* [1.0,2.0,3.0,4.0] *)

(* countTrue *)
(* takes a function and a list and counts the number of elements in the list for which the function returns true (e.g. countTrue (fn x => x mod 2 = 0) *)
fun countTrue func li = foldr (fn(cur, accumulator) => accumulator + (if func(cur) = true then 1 else 0)) 0 li;

val test_countTrue = countTrue (fn(x) => x mod 2 = 0) [1,2,3,4,5,6]; (* 3 *)


(* max *)
(* return the max element in a list of integers *)
fun max li = foldr (fn(cur, accumulator) => if cur > accumulator then cur else accumulator) ~99999999 li;

val test_max = max [1,2,3,4];

(* member *)
(* takes an element and a list and returns true if the element is in the list and false otherwise *)
fun member isInCandidate li = foldr (fn(cur, accumulator) => if isInCandidate = cur then true else if accumulator = true then true else false) false li;

val test_member = member 4 [1,2,3,4]; (* true *)

(* pivot *)
(* takes an integer and a list of integers and returns two lists of integers where the first list contains all the elements in the original list that are less than or equal to the integer argument and the second list contains all the elements in the original list that are greater than the integer argument *)
fun pivot cutOffNum li = (foldr (fn(cur1, accumulator1) => if cur1 <= cutOffNum then accumulator1 @ [cur1] else accumulator1) [] li, foldr (fn(cur1, accumulator1) => if cur1 > cutOffNum then accumulator1 @ [cur1] else accumulator1) [] li)

val test_pivot = pivot 3 [1,2,3,4,5,1,2,3,4,5]; (* ([1,2,3,1,2,3],[4,5,4,5]) *)