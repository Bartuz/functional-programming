(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals strs = 
	List.filter (fn s => Char.isUpper(String.sub(s,0))) strs

fun longest_string1 strs =
	List.foldl (fn (acc,s) => 
	  if String.size acc > String.size s then acc else s
	) "" strs

fun longest_string2	strs = 
	List.foldl (fn (acc,s) => 
	  if String.size acc >= String.size s then acc else s
	) "" strs

fun longest_string_helper f strs = 
	List.foldl (fn (acc, s) => 
		if f(String.size acc, String.size s)
		then acc
		else s
	) "" strs

val longest_string3 = longest_string_helper (fn (x,y) => x > y)

val longest_string4 = longest_string_helper (fn (x,y) => x >= y)

fun longest_capitalized strs =
	longest_string3 o only_capitals o strs

val rev_string = (String.implode o List.rev o String.explode)
