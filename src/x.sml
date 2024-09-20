
explode;
val string_ : string = "abcd";
val explodedCharList = explode(string_);

val charList : char list = [#"a", #"b"];
val imploded_string : string = implode(charList);

ord;
val char_ : char = #"a";
val int_ : int = ord(char_);

(* real -> int *)
val real_ : real = 3.14;

val trunc_int_ : int = trunc(real_);
val floor_int_ : int = floor(real_);
val ceil_int_ : int = ceil(real_);
val round_int_ : int = round(real_);

(* chr: int -> char *)
val int_ = 5;
val chr_ : char = chr int_;

(* str: char -> string *)
val string_ : string = str(chr_);


(* (op +); *)
(* (op =); *)

(* ------------------ *)

(2.3, 0, false, "hello");
((1,2), (2,3), (3,4));
(true, (op +));

val x = (1, 2, 3);
val x2 = #2 x;

(2, 3.2, real);
(* int * real * (int -> real) *)

((op ~), #"A");
(* (int -> int) * char *)

val a = [1,2,3];
val d = [];
val b = [(true,2),(false,4),(true,5),(false,7)];
val c = [[1,2,3],[4,5],[],[6,7,8,9],[0]];
val e = nil;
val f = explode "hello";









