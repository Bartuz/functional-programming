Standard ML of New Jersey v110.77 [built: Sat Oct 11 21:10:02 2014]
- use "hw1solution.sml";
[opening hw1solution.sml]
val is_older = fn : (int * int * int) * (int * int * int) -> bool
val it = () : unit
- use "hw1solution.sml";
[opening hw1solution.sml]
val is_older = fn : (int * int * int) * (int * int * int) -> bool
val it = () : unit
- use "hw1test.sml";
[opening hw1test.sml]
hw1test.sml:11.14-11.29 Error: unbound variable or constructor: number_in_month
hw1test.sml:13.14-13.30 Error: unbound variable or constructor: number_in_months
hw1test.sml:15.14-15.28 Error: unbound variable or constructor: dates_in_month
hw1test.sml:17.14-17.29 Error: unbound variable or constructor: dates_in_months
hw1test.sml:19.14-19.21 Error: unbound variable or constructor: get_nth
hw1test.sml:21.14-21.28 Error: unbound variable or constructor: date_to_string
hw1test.sml:23.14-23.40 Error: unbound variable or constructor: number_before_reaching_sum
hw1test.sml:25.14-25.24 Error: unbound variable or constructor: what_month
hw1test.sml:27.15-27.26 Error: unbound variable or constructor: month_range
hw1test.sml:29.15-29.21 Error: unbound variable or constructor: oldest

uncaught exception Error
  raised at: ../compiler/TopLevel/interact/evalloop.sml:66.19-66.27
             ../compiler/TopLevel/interact/evalloop.sml:44.55
             ../compiler/TopLevel/interact/evalloop.sml:296.17-296.20
- use "hw1test.sml";
[opening hw1test.sml]
hw1test.sml:11.14-11.29 Error: unbound variable or constructor: number_in_month
hw1test.sml:13.14-13.30 Error: unbound variable or constructor: number_in_months
hw1test.sml:15.14-15.28 Error: unbound variable or constructor: dates_in_month
hw1test.sml:17.14-17.29 Error: unbound variable or constructor: dates_in_months
hw1test.sml:19.14-19.21 Error: unbound variable or constructor: get_nth
hw1test.sml:21.14-21.28 Error: unbound variable or constructor: date_to_string
hw1test.sml:23.14-23.40 Error: unbound variable or constructor: number_before_reaching_sum
hw1test.sml:25.14-25.24 Error: unbound variable or constructor: what_month
hw1test.sml:27.15-27.26 Error: unbound variable or constructor: month_range
hw1test.sml:29.15-29.21 Error: unbound variable or constructor: oldest

uncaught exception Error
  raised at: ../compiler/TopLevel/interact/evalloop.sml:66.19-66.27
             ../compiler/TopLevel/interact/evalloop.sml:44.55
             ../compiler/TopLevel/interact/evalloop.sml:296.17-296.20
- 

Process sml finished
Standard ML of New Jersey v110.77 [built: Sat Oct 11 21:10:02 2014]
-use "hw1solution.sml";
[opening hw1solution.sml]
val is_older = fn : (int * int * int) * (int * int * int) -> bool
val it = () : unit
- use "hw1test.sml";
[opening hw1test.sml]
hw1test.sml:11.14-11.29 Error: unbound variable or constructor: number_in_month
hw1test.sml:13.14-13.30 Error: unbound variable or constructor: number_in_months
hw1test.sml:15.14-15.28 Error: unbound variable or constructor: dates_in_month
hw1test.sml:17.14-17.29 Error: unbound variable or constructor: dates_in_months
hw1test.sml:19.14-19.21 Error: unbound variable or constructor: get_nth
hw1test.sml:21.14-21.28 Error: unbound variable or constructor: date_to_string
hw1test.sml:23.14-23.40 Error: unbound variable or constructor: number_before_reaching_sum
hw1test.sml:25.14-25.24 Error: unbound variable or constructor: what_month
hw1test.sml:27.15-27.26 Error: unbound variable or constructor: month_range
hw1test.sml:29.15-29.21 Error: unbound variable or constructor: oldest

uncaught exception Error
  raised at: ../compiler/TopLevel/interact/evalloop.sml:66.19-66.27
             ../compiler/TopLevel/interact/evalloop.sml:44.55
             ../compiler/TopLevel/interact/evalloop.sml:296.17-296.20
- val test1 = is_older((1,2,3),(2,3,4)) = true

val test12 = is_older((1,2,3),(1,2,3)) = false
= = = ;
val test1 = true : bool
val test12 = false : bool
- val test1 = is_older((1,2,3),(2,3,4)) = true

val test12 = is_older((1,2,3),(1,2,3)) = false
= = = sml
= stdIn:9.1-9.4 Error: unbound variable or constructor: sml
stdIn:8.5-9.4 Error: operator is not a function [tycon mismatch]
  operator: bool
  in expression:
    false <errorvar>
- 

Process sml finished
Standard ML of New Jersey v110.77 [built: Sat Oct 11 21:10:02 2014]
- use "hw1solution.sml";
[opening hw1solution.sml]
val is_older = fn : (int * int * int) * (int * int * int) -> bool
val it = () : unit
- val test1 = is_older((1,2,3),(2,3,4)) = true
= val test1_2 = is_older((1,2,3),(1,2,3)) = false
= ;
val test1 = true : bool
val test1_2 = true : bool
- 
val test1 = is_older((1,2,3),(2,3,4)) = true

val test1_2 = is_older((1,2,3),(1,2,3)) = false

val test1_3 = is_older((1,2,3),(1,2,2)) = false

val test1_4 = is_older((1,1,2),(1,1,3)) = true

val test1_5 = is_older((1,1,2),(1,2,1)) = true
- = = = = = = = = = ;;;;;
val test1 = true : bool
val test1_2 = true : bool
val test1_3 = true : bool
val test1_4 = true : bool
val test1_5 = true : bool
- 