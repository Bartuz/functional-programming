(* This is a comment. THis is our first program! yay ;) *)

val x = 34; (* int *)
(* static evironment: x : int *)
(* dynamic evironment: x --> 34 *)

val y = 17;
(* static evironment x: int, y : int *)
(* dynamic environment: x --> 34, y --> 17 *)

val z = (x + y) + (y + 2);
(* static evniornment x: int, y : int, z : int *)
(* dynamic environment: x --> 34, y --> 17, z--> 70 *)

val q = z + 1;
(* static environment : x : int, y: int, z : int, q : int *)
(* dynamic enviornment: w -> 71 *)

val abs_of_z = if z < 0 then 0 - z else z;

val abs_of_z_simpler = abs z;
