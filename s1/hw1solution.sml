(* FORMAT: Year/Month/Day *)
fun is_older( date1 : int*int*int, date2: int*int*int) =
    let
	val y1 = #1 date1
	val y2 = #1 date2
	val m1 = #2 date1
	val m2 = #2 date2
	val d1 = #3 date1
	val d2 = #3 date2
    in
	if y1 <> y2 
	then y1 < y2
	else if m1 <> m2
	then m1 < m2
	else d1 < d2
    end

