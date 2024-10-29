fun q4 _ ([], []) = true
  | q4 _ ([], x::xs) = false
  | q4 _ (x::xs, []) = false
  | q4 f (x::xs,y::ys) = y = (f x) andalso q4 f (xs, ys);


(* Question 4a
   My answer: true
   Correct answer: error, because cannot do equality check on reals
*)
(* q4 (fn x => x + 1.0) ([1.1,2.2,3.3], [2.1,3.2,4.3]);  *)

(* Question 4b
   My answer: true
   Correct answer: error, because the operand should be a tuple of 
                   two lists and this is currying with 2 arguments. 
                   I.e., should be q4 floor ([1.1,2.2,3.3], [1,2,3])
*)
(* q4 floor [1.1,2.2,3.3] [1,2,3]; *)

(* Question 4c
   My answer: false
   Correct answer: false, because of simple arithmetic reasons
*)
q4 (fn x => x*x) ([1,2,3],[1,4,9,16]);

(* Question 4d
   My answer: Error because tries to perform an equality operation between int list and int but equality operator requires two arguments of the same type.
   Correct answer: true
*)
q4 (hd) ([[1,2], [2,3,4], [3,4,5,6,7]],[1,2,3]);