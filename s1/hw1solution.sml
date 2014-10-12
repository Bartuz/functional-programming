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

fun number_in_month( dates : (int*int*int) list, expected_month : int) =
    let fun count(dates : (int*int*int) list) =
	    if null dates 
	    then 0
	    else
		let val month = #2 (hd dates)
		in if month = expected_month then 1 else 0 + count(tl dates)
		end
    in
	count(dates)
    end

fun number_in_months( dates : (int * int * int) list, expected_months:  int list) =
    let fun count_for_each( expected_months : int list) =
	    if null expected_months 
	    then 0
	    else number_in_month(dates, hd expected_months) + count_for_each(tl expected_months)
    in
	count_for_each(expected_months)
    end

