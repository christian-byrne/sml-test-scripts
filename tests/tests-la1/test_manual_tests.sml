(* Tests Provided by Professor *)

use "src/la1/la1.sml";
use "tests/utils.sml";

fun raiseIfFalse(b: bool, msg: string) =
  if not b then raise Fail msg else ();

print "triangle\n";
raiseIfFalse(triangle(2,3,4) = true, "triangle(2,3,4) = true");

print "triangleR\n";
raiseIfFalse(triangleR(2.1,3.2,7.8) = false, "triangleR(2.1,3.2,7.8) = false");

print "cycle\n";
raiseIfFalse(cycle(4,[1,2,3,4,5]) = [5,1,2,3,4], "cycle(4,[1,2,3,4,5]) = [5,1,2,3,4]");

print "mirror\n";
raiseIfFalse(mirror([1,2,3,4]) = [1,2,3,4,4,3,2,1], "mirror([1,2,3,4]) = [1,2,3,4,4,3,2,1]");

print "gtList\n";
raiseIfFalse(gtList([1,2,3,4,5],2) = [3,4,5], "gtList([1,2,3,4,5],2) = [3,4,5]");

print "suffix\n";
raiseIfFalse(suffix([3,4,5],[1,2,3,4,5]) = true, "suffix([3,4,5],[1,2,3,4,5]) = true");

print "get\n";
raiseIfFalse(get([1,2,3,4,5],3) = 4, "get([1,2,3,4,5],3) = 4");

print "subList\n";
raiseIfFalse(subList([1,2,3,4,5],1,3) = [2,3,4], "subList([1,2,3,4,5],1,3) = [2,3,4]");

print "reverse\n";
raiseIfFalse(reverse([1,2,3,4]) = [4,3,2,1], "reverse([1,2,3,4]) = [4,3,2,1]");

print "apply\n";
raiseIfFalse(apply([1,2,3,4,5],(fn x => x + 2)) = [3,4,5,6,7], "apply([1,2,3,4,5],(fn x => x + 2)) = [3,4,5,6,7]");

print "collapse\n";
raiseIfFalse(collapse([1,2,3,4],5,(op +)) = 15, "collapse([1,2,3,4],5,(op +)) = 15");

print "quicksort\n";
raiseIfFalse(quicksort (op <=) [3,5,1,2,4] = [1,2,3,4,5], "quicksort (op <=) [3,5,1,2,4] = [1,2,3,4,5]");

print "bubbleSort\n";
raiseIfFalse(bubbleSort (op >=) [1,1,4,2,3] = [4,3,2,1,1], "bubbleSort (op >=) [1,1,4,2,3] = [4,3,2,1,1]");

print "insertionSort\n";
raiseIfFalse(insertionSort (op <=) [~4,1,8,9,0,~2] = [~4,~2,0,1,8,9], "insertionSort (op <=) [~4,1,8,9,0,~2] = [~4,~2,0,1,8,9]");

print "substring\n";
raiseIfFalse(substring "zon" "arizona" = true, "substring \"zon\" \"arizona\" = true");

print "indexOf\n";
raiseIfFalse(indexOf 3 [1,2,3,4,5] = 2, "indexOf 3 [1,2,3,4,5] = 2");

print "dec2BaseN\n";
raiseIfFalse(dec2BaseN 2 10 = "1010", "dec2BaseN 2 10 = \"1010\"");

print "dropNth\n";
raiseIfFalse(dropNth 2 [1,2,3,4,5] = [1,3,5], "dropNth 2 [1,2,3,4,5] = [1,3,5]");

print "flatten\n";
raiseIfFalse(flatten [[],[1,2,3],[4,5,6],[],[8,9]] = [1,2,3,4,5,6,8,9], "flatten [[],[1,2,3],[4,5,6],[],[8,9]] = [1,2,3,4,5,6,8,9]");

print "condenseLists\n";
raiseIfFalse(condenseLists (op +) 0 [[],[1,2,3,4],[5,6]] = [0,10,11], "condenseLists (op +) 0 [[],[1,2,3,4],[5,6]] = [0,10,11]");

print "remove\n";
raiseIfFalse(remove (fn x => x mod 3 = 0) [1,2,3,4,5,6,7,8,9] = [1,2,4,5,7,8], "remove (fn x => x mod 3 = 0) [1,2,3,4,5,6,7,8,9] = [1,2,4,5,7,8]");

print "triplist\n";
raiseIfFalse(triplist [1,2,3] = [1,1,1,2,2,2,3,3,3], "triplist [1,2,3] = [1,1,1,2,2,2,3,3,3]");

print "repeat\n";
raiseIfFalse(repeat [1,2] 4 = [1,2,1,2,1,2,1,2], "repeat [1,2] 4 = [1,2,1,2,1,2,1,2]");

print "filterApply\n";
raiseIfFalse(filterApply [1,2,3,4,5] (fn x => x mod 2 = 0) (fn x => x + 1) = [1,3,3,5,5], "filterApply [1,2,3,4,5] ... = [1,3,3,5,5]");

print "arithSeq\n";
raiseIfFalse(arithSeq 0 5 4 = [0,5,10,15], "arithSeq 0 5 4 = [0,5,10,15]");

print "element\n";
raiseIfFalse(element 5 [1,2,3,4,5,6,7,8] = true, "element 5 [1,2,3,4,5,6,7,8] = true");

print "isSet\n";
raiseIfFalse(isSet [1,2,3,4,5] = true, "isSet [1,2,3,4,5] = true");

print "union\n";
raiseIfFalse(union ([1,2,3],[2,3,4,5]) = [1,2,3,4,5], "union ([1,2,3],[2,3,4,5]) = [1,2,3,4,5]");

print "intersection\n";
raiseIfFalse(intersection ([1,2,3],[2,3,4,5]) = [2,3], "intersection ([1,2,3],[2,3,4,5]) = [2,3]");

print "difference\n";
raiseIfFalse(difference ([1,2,3],[2,3,4,5]) = [1], "difference ([1,2,3],[2,3,4,5]) = [1]");

print "xor\n";
(* Tests Provided by Professor *)

use "src/la1/la1.sml";
use "tests/utils.sml";

fun raiseIfFalse(b: bool, msg: string) =
  if not b then raise Fail msg else ();

print "triangle\n";
raiseIfFalse(triangle(2,3,4) = true, "triangle(2,3,4) = true");

print "triangleR\n";
raiseIfFalse(triangleR(2.1,3.2,7.8) = false, "triangleR(2.1,3.2,7.8) = false");

print "cycle\n";
raiseIfFalse(cycle(4,[1,2,3,4,5]) = [5,1,2,3,4], "cycle(4,[1,2,3,4,5]) = [5,1,2,3,4]");

print "mirror\n";
raiseIfFalse(mirror([1,2,3,4]) = [1,2,3,4,4,3,2,1], "mirror([1,2,3,4]) = [1,2,3,4,4,3,2,1]");

print "gtList\n";
raiseIfFalse(gtList([1,2,3,4,5],2) = [3,4,5], "gtList([1,2,3,4,5],2) = [3,4,5]");

print "suffix\n";
raiseIfFalse(suffix([3,4,5],[1,2,3,4,5]) = true, "suffix([3,4,5],[1,2,3,4,5]) = true");

print "get\n";
raiseIfFalse(get([1,2,3,4,5],3) = 4, "get([1,2,3,4,5],3) = 4");

print "subList\n";
raiseIfFalse(subList([1,2,3,4,5],1,3) = [2,3,4], "subList([1,2,3,4,5],1,3) = [2,3,4]");

print "reverse\n";
raiseIfFalse(reverse([1,2,3,4]) = [4,3,2,1], "reverse([1,2,3,4]) = [4,3,2,1]");

print "apply\n";
raiseIfFalse(apply([1,2,3,4,5],(fn x => x + 2)) = [3,4,5,6,7], "apply([1,2,3,4,5],(fn x => x + 2)) = [3,4,5,6,7]");

print "collapse\n";
raiseIfFalse(collapse([1,2,3,4],5,(op +)) = 15, "collapse([1,2,3,4],5,(op +)) = 15");

print "quicksort\n";
raiseIfFalse(quicksort (op <=) [3,5,1,2,4] = [1,2,3,4,5], "quicksort (op <=) [3,5,1,2,4] = [1,2,3,4,5]");

print "bubbleSort\n";
raiseIfFalse(bubbleSort (op >=) [1,1,4,2,3] = [4,3,2,1,1], "bubbleSort (op >=) [1,1,4,2,3] = [4,3,2,1,1]");

print "insertionSort\n";
raiseIfFalse(insertionSort (op <=) [~4,1,8,9,0,~2] = [~4,~2,0,1,8,9], "insertionSort (op <=) [~4,1,8,9,0,~2] = [~4,~2,0,1,8,9]");

print "substring\n";
raiseIfFalse(substring "zon" "arizona" = true, "substring \"zon\" \"arizona\" = true");

print "indexOf\n";
raiseIfFalse(indexOf 3 [1,2,3,4,5] = 2, "indexOf 3 [1,2,3,4,5] = 2");

print "dec2BaseN\n";
raiseIfFalse(dec2BaseN 2 10 = "1010", "dec2BaseN 2 10 = \"1010\"");

print "dropNth\n";
raiseIfFalse(dropNth 2 [1,2,3,4,5] = [1,3,5], "dropNth 2 [1,2,3,4,5] = [1,3,5]");

print "flatten\n";
raiseIfFalse(flatten [[],[1,2,3],[4,5,6],[],[8,9]] = [1,2,3,4,5,6,8,9], "flatten [[],[1,2,3],[4,5,6],[],[8,9]] = [1,2,3,4,5,6,8,9]");

print "condenseLists\n";
raiseIfFalse(condenseLists (op +) 0 [[],[1,2,3,4],[5,6]] = [0,10,11], "condenseLists (op +) 0 [[],[1,2,3,4],[5,6]] = [0,10,11]");

print "remove\n";
raiseIfFalse(remove (fn x => x mod 3 = 0) [1,2,3,4,5,6,7,8,9] = [1,2,4,5,7,8], "remove (fn x => x mod 3 = 0) [1,2,3,4,5,6,7,8,9] = [1,2,4,5,7,8]");

print "triplist\n";
raiseIfFalse(triplist [1,2,3] = [1,1,1,2,2,2,3,3,3], "triplist [1,2,3] = [1,1,1,2,2,2,3,3,3]");

print "repeat\n";
raiseIfFalse(repeat [1,2] 4 = [1,2,1,2,1,2,1,2], "repeat [1,2] 4 = [1,2,1,2,1,2,1,2]");

print "filterApply\n";
raiseIfFalse(filterApply [1,2,3,4,5] (fn x => x mod 2 = 0) (fn x => x + 1) = [1,3,3,5,5], "filterApply [1,2,3,4,5] ... = [1,3,3,5,5]");

print "arithSeq\n";
raiseIfFalse(arithSeq 0 5 4 = [0,5,10,15], "arithSeq 0 5 4 = [0,5,10,15]");

print "element\n";
raiseIfFalse(element 5 [1,2,3,4,5,6,7,8] = true, "element 5 [1,2,3,4,5,6,7,8] = true");

print "isSet\n";
raiseIfFalse(isSet [1,2,3,4,5] = true, "isSet [1,2,3,4,5] = true");

print "union\n";
raiseIfFalse(union ([1,2,3],[2,3,4,5]) = [1,2,3,4,5], "union ([1,2,3],[2,3,4,5]) = [1,2,3,4,5]");

print "intersection\n";
raiseIfFalse(intersection ([1,2,3],[2,3,4,5]) = [2,3], "intersection ([1,2,3],[2,3,4,5]) = [2,3]");

print "difference\n";
raiseIfFalse(difference ([1,2,3],[2,3,4,5]) = [1], "difference ([1,2,3],[2,3,4,5]) = [1]");

print "xor\n";
raiseIfFalse(xor ([1,2,3],[2,3,4,5]) = [1,4,5], "xor ([1,2,3],[2,3,4,5]) = [1,4,5]");

val ps = powerset [0,1];
fun member (e,l) = foldl (fn (el,b) => e = el orelse b) false l;
raiseIfFalse(xor ([1,2,3],[2,3,4,5]) = [1,4,5], "xor ([1,2,3],[2,3,4,5]) = [1,4,5]");

val ps = powerset [0,1];
fun member (e,l) = foldl (fn (el,b) => e = el orelse b) false l;


(* member([],ps);
member([0],ps);
member([1],ps);
member([0,1],ps);
print "end\n"; *)

raiseIfFalse(member([],ps) = true, "member([],ps) = true");
raiseIfFalse(member([0],ps) = true, "member([0],ps) = true");
raiseIfFalse(member([1],ps) = true, "member([1],ps) = true");
raiseIfFalse(member([0,1],ps) = true, "member([0,1],ps) = true");

print "end\n";raiseIfFalse(cycle(4,[1,2,3,4,5]) = [5,1,2,3,4], "cycle(4,[1,2,3,4,5]) = [5,1,2,3,4]");


