
fun floorLog2N(n: int): int =
    if n < 2 then 0
    then 1 + floorLog2N(n div 2);

floorLog2N(16);

fun fibProduct(n) =
    if n < 2 then ~1
    if n < 3 then 2
    then fibProduct(n-2) * fibProduct(n-1);


fun countZeros(li) =
    if n = [] then 0
    if hd(li) = 0 then 1 + countZeros(tl(li))
    then countZeros(tl(li));

fun addListElementWise(li1, li2) =
    if li1 = [] then []
    then hd(li1) + hd(li2) :: addListElementWise(tl(li1), tl(li2));

fun addListElementWise2([], []) = [];
    | addListElementWise2([], x::li) = 
        x::li :: addListElementWise2([], li);
    | addListElementWise2(x::li, []) = 
        x::li :: addListElementWise2(li, []);
    | addListElementWise2(x::li1, y::li2) = 
        x + y :: addListElementWise2(li1, li2);

addListElementWise([1,2,3], [4,5,6]);
addListElementWise2([1,2,3], [4,5,6]);