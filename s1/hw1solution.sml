(* FORMAT: Year/Month/Day *)

fun is_date_in_month(date : (int * int * int), month: int) =
    #2 date = month

fun is_older(date1 : (int * int * int), date2: (int * int * int)) =
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

fun number_in_month(dates : (int * int * int) list, expected_month : int) =
    let fun count(dates : (int * int * int) list) =
	    if null dates 
	    then 0
	    else (if is_date_in_month(hd dates, expected_month) then 1 else 0) + count(tl dates)
    in
	count(dates)
    end

fun number_in_months(dates : (int * int * int) list, expected_months : int list) =
    let fun count_for_each(expected_months : int list ) =
	    if null expected_months 
	    then 0
	    else number_in_month(dates,hd expected_months) + count_for_each(tl expected_months)
    in
	count_for_each(expected_months)
    end

fun dates_in_month(dates : (int * int * int) list, expected_month: int) =
    let fun collect_dates(dates : (int * int * int) list) =
	    if null dates
	    then []
	    else
		let val date = hd dates
		in 
		   if is_date_in_month(date, expected_month) 
		   then date :: collect_dates(tl dates)
	           else collect_dates(tl dates)
		end
    in
	collect_dates(dates)
    end
    
fun dates_in_months(dates : (int * int * int) list, expected_months: int list) =
    let fun collect_dates_for_each(expected_months: int list) =
	    if null expected_months
	    then []
	    else dates_in_month(dates, hd expected_months) @ collect_dates_for_each(tl expected_months)
    in
	collect_dates_for_each(expected_months)
    end

fun get_nth(strs : string list, index : int) =
    if index = 1 
    then hd strs
    else get_nth(tl strs, index - 1)
	
