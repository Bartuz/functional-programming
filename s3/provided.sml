(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun all_except_option(_, []) = NONE
  | all_except_option(str, x::xs') =
    if same_string(str,x) 
    then SOME xs'
    else case all_except_option(str, xs') of
        NONE      => NONE
        | SOME y  => SOME(x::y)

fun get_substitutions1([], _) = []
  | get_substitutions1(x::xs', s) =
    case all_except_option(s, x) of
      NONE      => get_substitutions1(xs', s)
      | SOME y  => y @ get_substitutions1(xs', s)

fun get_substitutions2(substitutions, s) =
  let 
    fun aux([], acc) = acc
      | aux(x::xs', acc) = 
        case all_except_option(s, x) of
          NONE      => aux(xs', acc)
          | SOME y  => aux(xs', acc @ y)    
  in
    aux(substitutions, [])
  end

type fullname = {first: string, middle: string, last : string}

fun similar_names(substitutions , {first = f, middle = m, last = l}) =
  let
    fun aux([], acc) = acc
      | aux(x::xs', acc) =
        case get_substitutions2(x, f) of
          []      => aux(xs', acc)
          | y::ys' => 
            let
              val possibles = y::ys'
              fun full_names([], acc) = acc
                | full_names(x::xs', acc) =
                  let val full_name = {first = x, last = l, middle = m}
                  in full_names(xs', full_name :: acc)
                  end
            in 
              full_names(possibles, acc @ full_names(possibles, []))
            end
  in
    aux(substitutions,[{first = f, middle = m, last= l}])
  end

fun similar_names(substitutions : string list list, {first = f, middle = m, last = l} : fullname ) =
  let
    fun full_names([], acc) = acc
      | full_names(x::xs', acc) =
        let val full_name : fullname = {first = x, last = l, middle = m}
        in full_names(xs', full_name :: acc )
        end
  in 
    {first = f, middle = m, last = l} :: full_names(get_substitutions2(substitutions, f), [])
  end


use "provided.sml";