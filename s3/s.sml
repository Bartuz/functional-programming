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

val longest_capitalized = longest_string1 o only_capitals

val rev_string = (String.implode o List.rev o String.explode)

fun first_answer f l =
	case l of 
		[] 			 => raise NoAnswer
		|	x::xs' => 
			case f x of
				NONE 		 => first_answer f xs'
				| SOME v => v

fun all_answers f l = 
  let 
		fun all_answers_helper (l', acc) = 
	    case l' of 
				[] 			=> SOME acc
	      | x::xs => 
	      	case f x of
			     NONE 		=> NONE
			   | SOME lst => all_answers_helper (xs, acc @ lst)
  in
		all_answers_helper (l, [])
  end

val count_wildcards = g (fn () => 1) (fn _ => 0)
val count_wild_and_variable_lengths = g (fn () => 1) (fn s => String.size s)
fun count_some_var (str, p) = 
    g (fn v => 0) (fn s => if s = str then 1 else 0) p

val check_pat =
	let
		fun var_names p = 
	    case p of 
				Variable v => [v]
	      | ConstructorP (_, p') => var_names p'
	      | TupleP ps => List.foldl (fn (p, acc) => (var_names p) @ acc) [] ps
	      | _ => []
		fun has_duplicate ss = 
	    case ss of
				[] 			 => false
	      | s::ss' => 
					(List.exists (fn s' => s = s') ss') orelse has_duplicate ss'
	in
		not o has_duplicate o var_names
	end

fun match (v, p) = 
    case (v, p) of
		(_, Wildcard) => SOME []
    | (Unit, UnitP) => SOME []
    | (Const c, ConstP c') => if c = c' then SOME [] else NONE
    | (v, Variable n) => SOME [(n, v)]
    | (Constructor (s1, v), ConstructorP (s2, p)) => 	
				if s1 = s2 then match (v, p) else NONE

    | (Tuple vs, TupleP ps) => if List.length vs = List.length ps
			 then all_answers match (ListPair.zip (vs, ps))
			 else NONE
    | _ => NONE

fun first_match va plst =
  SOME (first_answer (fn x => match(va, x)) plst) handle NoAnswer => NONE