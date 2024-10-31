use "la1.sml";

val score = 0.0;
fun check (a,b,score) = if a = b then score else 0.0;
fun checkR (a,b,score) = if abs(a - b) <= 0.00001 then score else 0.0;
fun eqR (a,b) = abs(a-b) <= 0.00001;
fun abs r = if r >= 0.0 then r else ~r;
fun eqRList ([],[]) = true
| eqRList ([],x::xs) = false
| eqRList (x::xs,[]) = false
| eqRList (x::xs,y::ys) = eqR(x,y) andalso eqRList(xs,ys);
fun checkRList (l1,l2,score) = if eqRList(l1,l2) then score else 0.0;

val iList = [2,6,1,7,8];
val cList = explode "wildcats";
val emptyList : int list = [];
val sList = ["Phoenix", "Little Rock", "Montgomery", "Hartford", "Denver"];
val lList = [[],[1,2,3],[4,5,6,7]];
val pList = [(1,2),(4,5),(~2,3),(8,4)];
val rList = [1.5, 2.5, 3.5];
val clList = map explode sList;

print "\ntriangle\n"; (* 1 point *)
val act = triangle(2,3,4);
val score = score + check(true,act,0.5);
val act = triangle(3,1,1);
val score = score + check(false,act,0.5);

print "\ntriangleR\n"; (* 1 point *)
val act = triangleR(3.2,4.1,2.5);
val score = score + check(true,act,0.5);
val act = triangleR(1.2,3.5,1.3);
val score = score + check(false,act,0.5);

print "\ncycle\n"; (* 2 points *)
val act = cycle(3,iList);
val score = score + check([7,8,2,6,1],act,0.5);
val act = implode(cycle(10,cList));
val score = score + check("ldcatswi",act,0.5);
val act = cycle(0,iList);
val score = score + check([2,6,1,7,8],act,0.5);
val act = cycle(5,emptyList);
val score = score + check([],act,0.5);

print "\nmirror\n"; (* 2 points *)
val x = mirror emptyList;
val score = score + check([],x,0.5);
val x = mirror iList;
val score = score + check([2,6,1,7,8,8,7,1,6,2],x,0.5);
val x = implode(mirror cList);
val score = score + check("wildcatsstacdliw",x,0.5);
val x = mirror [5];
val score = score + check(x, [5,5], 0.5);

print "\ngtList\n"; (* 2 points *)
val x = gtList([],4);
val score = score + check(x,[], 0.5);
val x = gtList(iList, 3);
val score = score + check(x,[6,7,8],0.5);
val x = gtList(iList, 9);
val score = score + check(x,[],0.5);
val x = gtList(iList,0);
val score = score + check(x,iList,0.5);

print "\nsuffix\n"; (* 2 points *)
val x = suffix([1,7,8],iList);
val score = score + check(x,true,0.5);
val x = suffix([1,7],iList);
val score = score + check(x,false,0.5);
val x = suffix([1,7,8],[1,7,8]);
val score = score + check(x,true,0.5);
val x = suffix(explode("cats"),cList);
val score = score + check(x,true,0.5);

print "\nget\n"; (* 2 points *)
val x = get (iList, 0);
val score = score + check(x, 2, 0.5);
val x = get (sList, 3);
val score = score + check(x, "Hartford", 0.5);
val x = get (cList, 5);
val score = score + check(x, #"a", 0.5);
val x = get (lList, 2);
val score = score + check(x, [4,5,6,7], 0.5);

print "\nsubList\n"; (* 4 points *)
val x = subList(cList, 6, 6);
val score = score + check(x, [#"t"], 1.0);
val x = implode(subList((explode "university of arizona"), 3, 8));
val score = score + check(x, "versit", 1.0);
val x = subList (iList, 1, 2);
val score = score + check(x, [6,1], 1.0);
val x = subList (sList, 0, 4);
val score = score + check(x, sList, 1.0);

print "\nreverse\n"; (* 3 points *)
val x = reverse emptyList;
val score = score + check(x, emptyList, 1.0);
val x = reverse iList;
val score = score + check(x, [8,7,1,6,2], 1.0);
val x = implode(reverse cList);
val score = score + check(x, "stacdliw", 1.0);

print "\napply\n"; (* 3 points *)
val x = apply(pList, (op -));
val score = score + check(x, [~1,~1,~5,4], 1.0);
val x = implode(apply(sList, (fn s => hd(explode s))));
val score = score + check(x, "PLMHD", 1.0);
val x = apply(rList, round);
val score = score + check(x, [2,2,4], 1.0);

print "\ncollapse\n"; (* 3 points *)
val x = collapse(iList,0,(op +));
val score = score + check(x,24,1.0);
val x = collapse(pList,1,(fn ((a,b),c) => (a+b)*c));
val score = score + check(x,324,1.0);
val x = collapse(rList,2.0,(op * ));
val score = score + checkR(x,26.25,1.0);

print "\nquicksort\n"; (* 4 points *)
val x = quicksort (op <=) iList;
val score = score + check(x, [1,2,6,7,8], 1.0);
val x = quicksort (op >=) [1,4,2,5,3,1,2,3];
val score = score + check(x, [5,4,3,3,2,2,1,1], 1.0);
val x = implode(quicksort (op <=) cList);
val score = score + check(x, "acdilstw", 1.0);
val x = quicksort (op >=) rList;
val score = score + checkRList(x,[3.5,2.5,1.5],1.0);

print "\nbubbleSort\n"; (* 4 points *)
val x = bubbleSort (op <=) iList;
val score = score + check(x, [1,2,6,7,8], 1.0);
val x = bubbleSort (op >=) [1,4,2,5,3,1,2,3];
val score = score + check(x, [5,4,3,3,2,2,1,1], 1.0);
val x = implode(bubbleSort (op <=) cList);
val score = score + check(x, "acdilstw", 1.0);
val x = bubbleSort (op >=) rList;
val score = score + checkRList(x,[3.5,2.5,1.5],1.0);

print "\ninsertionSort\n"; (* 4 points *)
val x = insertionSort (op <=) iList;
val score = score + check(x, [1,2,6,7,8], 1.0);
val x = insertionSort (op >=) [1,4,2,5,3,1,2,3];
val score = score + check(x, [5,4,3,3,2,2,1,1], 1.0);
val x = implode(insertionSort (op <=) cList);
val score = score + check(x, "acdilstw", 1.0);
val x = insertionSort (op >=) rList;
val score = score + checkRList(x,[3.5,2.5,1.5],1.0);

print "\nsubstring\n"; (* 3 points *)
val x = substring "zon" "arizona";
val score = score + check(x, true, 1.0);
val x = substring "niva" "University";
val score = score + check(x, false, 1.0);
val x = substring "frog" "frog";
val score = score + check(x, true, 1.0);

print "\nindexOf\n"; (* 2 points *)
val x = indexOf 5 [];
val score = score + check(x, ~1, 0.5);
val x = indexOf 7 iList;
val score = score + check(x, 3, 0.5);
val x = indexOf 5 iList;
val score = score + check(x, ~1, 0.5);
val x = indexOf "Denver" sList;
val score = score + check(x, 4, 0.5);

print "\ndec2BaseN\n"; (* 3 points *);
val act = dec2BaseN 2 82;
val score = score + check("1010010", act, 1.0);
val act = dec2BaseN 8 100;
val score = score + check("144", act, 1.0);
val act = dec2BaseN 3 44;
val score = score + check("1122", act, 1.0);

print "\ndropNth\n"; (* 3 points *);
val x = dropNth 2 [1,2,3,4,5];
val score = score + check(x, [1,3,5], 1.0);
val x = dropNth 4 emptyList;
val score = score + check(x, emptyList, 1.0);
val x = implode(dropNth 3 cList);
val score = score + check(x, "widcts", 1.0);

print "\nflatten\n"; (* 2 points *)
val x = flatten lList;
val score = score + check(x, [1,2,3,4,5,6,7], 1.0);
val x = implode(flatten clList);
val score = score + check(x, "PhoenixLittle RockMontgomeryHartfordDenver", 1.0);

print "\ncondenseLists\n"; (* 2 points *)
val x = condenseLists (op +) 0 lList;
val score = score + check(x, [0,6,22], 1.0);
val x = condenseLists (fn (c,s) => ord c + s) 0 clList;
val score = score + check(x, [731,1053,1073,826,612], 1.0);

print "\nremove\n"; (* 2 points *)
val x = remove (fn n => n mod 3 = 0) iList;
val score = score + check(x, [2,1,7,8], 1.0);
val x = implode(remove (fn c => c = #"w" orelse c = #"s") cList);
val score = score + check(x, "ildcat", 1.0);

print "\ntriplist\n"; (* 2 points *)
val x = triplist iList;
val score = score + check(x, [2,2,2,6,6,6,1,1,1,7,7,7,8,8,8], 1.0);
val x = implode(triplist cList);
val score = score + check(x, "wwwiiillldddcccaaatttsss", 1.0);

print "\nrepeat\n"; (* 3 points *)
val x = repeat iList 2;
val score = score + check(x, [2,6,1,7,8,2,6,1,7,8], 1.0);
val x = implode(repeat cList 5);
val score = score + check(x, "wildcatswildcatswildcatswildcatswildcats", 1.0);
val x = repeat emptyList 5;
val score = score + check(x, emptyList, 1.0);

print "\nfilterApply\n"; (* 2 points *)
val x = filterApply iList (fn n => n mod 3 = 2) (fn x => x + 1);
val score = score + check(x, [3,6,1,7,9], 1.0);
val x = implode(filterApply cList (fn c => c = #"a") (fn c => chr (ord c + 1)));
val score = score + check(x, "wildcbts", 1.0);

print "\narithSeq\n"; (* 3 points *)
val x = arithSeq 0 5 3;
val score = score + check(x, [0,5,10], 1.0);
val x = arithSeq 10 ~3 5;
val score = score + check(x, [10, 7, 4, 1, ~2], 1.0);
val x = arithSeq 5 0 6;
val score = score + check(x, [5,5,5,5,5,5], 1.0);

print ("\nelement\n"); (* 2 points *)
val x = element 3 iList;
val score = score + check(x, false, 0.5);
val x = element 7 iList;
val score = score + check(x, true, 0.5);
val x = element 6 emptyList;
val score = score + check(x, false, 0.5);
val x = element #"i" cList;
val score = score + check(x, true, 0.5);

print("\nisSet\n"); (* 2 points *)
val score = score + check(isSet iList, true, 0.5);
val score = score + check(isSet emptyList, true, 0.5);
val score = score + check(isSet (explode "banana"), false, 0.5);
val score = score + check(isSet sList, true, 0.5);

fun qs _ [] = []
| qs _ [x] = [x]
| qs f l =
let
        fun pivot p = foldr (fn (y,(lt, gte)) => if f(y,p) then (y::lt, gte) else (lt, y::gte)) ([], []);
        val (l1, l2) = pivot (hd l) (tl l);
in
        ((qs f l1) @ [hd l] @ (qs f l2))
end;

fun equal([],[]) = true
| equal([],x::xs) = false
| equal(x::xs,[]) = false
| equal(x::xs,y::ys) = x=y andalso equal(xs,ys);

fun same (l1, l2) =
let
        val l1_sorted = qs (op <=) l1
        val l2_sorted = qs (op <=) l2
in
        equal(l1_sorted, l2_sorted)
end;

fun sameC (l1 : char list, l2) =
let
        val l1_sorted = qs (op <=) l1
        val l2_sorted = qs (op <=) l2
in
        equal(l1_sorted, l2_sorted)
end;

val iSet1 = [1,2,3,4,5];
val iSet2 = [1,3,5,7,9,11,13];
val cSet1 = explode "arizon";
val cSet2 = explode "universty";

fun checkSets (set1, set2, score) = if same(set1, set2) then score else 0.0;
fun checkSetsC (set1, set2, score) = if sameC(set2, set2) then score else 0.0;

print("\nunion\n"); (* 2 points *)
val score = score + checkSets(union(iSet1,iSet2),[1,2,3,4,5,7,9,11,13],0.5);
val score = score + checkSets(union(iSet1,[]), iSet1, 0.5);
val score = score + checkSetsC(union(cSet1,cSet2),(explode "arizonuvesty"),0.5);
val score = score + checkSetsC(union([],cSet1),cSet1,0.5);

print ("\nintersection\n"); (* 2 points *)
val score = score + checkSets(intersection(iSet1,iSet2), [1,3,5], 0.5);
val score = score + checkSets(intersection(iSet1,[]), [], 0.5);
val score = score + checkSetsC(intersection(cSet1,cSet2), explode "rin", 0.5);
val score = score + checkSetsC(intersection([],cSet1), [], 0.5);

print("\ndifference\n"); (* 2 points *)
val score = score + checkSets(difference(iSet1,iSet2),[2,4],0.5);
val score = score + checkSets(difference(iSet1,[]), iSet1, 0.5);
val score = score + checkSetsC(difference(cSet1,cSet2),(explode "azo"),0.5);
val score = score + checkSetsC(difference([],cSet1),[],0.5);

print ("\nxor\n"); (* 2 points *)
xor(iSet1,iSet2);
val score = score + checkSets(xor(iSet1,iSet2), [2,4,7,9,11,13], 0.5);
val score = score + checkSets(xor(iSet1,[]), iSet1, 0.5);
val score = score + checkSetsC(xor(cSet1,cSet2), explode "azouvesty", 0.5);
val score = score + checkSetsC(xor([],cSet1), cSet1, 0.5);

fun mem (_,[]) = false
| mem (e,x::xs) = e = x orelse mem(e,xs);

print ("\npowerset\n"); (* 4 points *)
val x = powerset([1,2,3]);
val lenRight = length x = 8;
val score = score + (if lenRight andalso mem([],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([1],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([2],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([3],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([1,2],x) orelse mem([2,1],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([1,3],x) orelse mem([3,1],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([2,3],x) orelse mem([3,2],x) then 0.5 else 0.0);
val score = score + (if lenRight andalso mem([1,2,3],x) orelse mem([1,3,2],x) orelse mem([2,1,3],x) orelse mem([2,3,1],x) orelse mem([3,2,1],x) orelse mem([3,1,2],x) then 0.5 else 0.0);


















