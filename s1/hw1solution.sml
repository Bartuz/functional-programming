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
	
fun date_to_string(date : int * int * int) =
    let 
	val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val month = get_nth(months, #2 date)
	val day = Int.toString(#3 date)
	val year = Int.toString(#1 date)
    in
	month ^ " " ^ day ^ ", " ^ year
    end


fun number_before_reaching_sum(sum : int, numbers : int list) = 
    let
	fun search_index(sum : int, numbers : int list, index : int) =
	    let val number = hd numbers
	    in
		if sum - number > 0
		then search_index(sum - number, tl numbers, index + 1)
		else index
	    end
    in
	search_index(sum, numbers, 0)
    end

fun what_month(day : int) = 
    let val days_in_months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in number_before_reaching_sum(day, days_in_months) + 1
    end


fun month_range(day1 : int, day2 : int) = 
    if day1 > day2
    then [0]
    else if day1 = day2
    then what_month(day1) :: []
    else what_month(day1) :: month_range(day1 + 1, day2)


fun oldest(dates : (int * int * int) list) =
    if null dates
    then NONE
    else
	let fun oldest_nonempty(dates : (int * int * int) list)=
		if null (tl dates)
		then hd dates
		else let val tl_oldest = oldest_nonempty(tl dates)
		     in
			 if is_older(hd dates, tl_oldest)
			 then hd dates
			 else tl_oldest
		     end
	in
	    SOME (oldest_nonempty dates)
	end
