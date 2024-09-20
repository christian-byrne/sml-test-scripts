(* quicksort.sml *)
fun quicksort [] = []
  | quicksort (x::xs) =
      let
        val smaller = filter (fn y => y <= x) xs
        val larger = filter (fn y => y > x) xs
      in
        quicksort smaller @ [x] @ quicksort larger
      end;

(* Example usage: Sort a list of integers *)
val sorted_list = quicksort [5, 2, 9, 1, 6, 3];

(* Print the sorted result *)
sorted_list;

