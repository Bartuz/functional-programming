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

fun similar_names(substitutions : string list list, {first = f, middle = m, last = l} : fullname ) =
  let
    fun full_names([], acc) = acc
      | full_names(x::xs', acc) = full_names(xs', acc @ ({first = x, last = l, middle = m} :: []))
  in 
    {first = f, last = l, middle = m} :: full_names(get_substitutions2(substitutions, f), [])
  end


fun card_color card = 
  case card of 
    (Clubs, _)   => Black 
  | (Spades, _)  => Black 
  | _            => Red

fun card_value card = 
  case card of
    (_, Ace)    => 11
  | (_, Num n)  => n
  | (_, _)      => 10

fun remove_card(cs : card list, c : card, e : exn) =
  let 
    fun aux([], true) = []
      | aux([], false) = raise e
      | aux(x::xs', isRemoved) =
        if isRemoved
        then x::xs'
        else if x = c then aux(xs', true) else x::aux(xs', false)
  in 
    aux(cs, false)
  end

fun all_same_color([])= false
  | all_same_color(_::[]) = true
  | all_same_color(head::(neck::tail)) =
    card_color head = card_color neck andalso all_same_color(neck::tail)

fun sum_cards(cs : card list) =
  let fun aux([], acc) = acc
    | aux(x::xs', acc) = aux(xs', acc + card_value(x))
  in
    aux(cs, 0)
  end

fun score(cs : card list, goal : int) =
  let val cards_score = sum_cards cs
  in 
    let val preliminary_score = if cards_score > goal
      then 3 * (cards_score - goal)
      else (goal - cards_score)
    in
      if all_same_color(cs) 
      then preliminary_score div 2
      else preliminary_score
    end
  end

fun officiate(cs : card list, moves : move list, goal : int) = 
  let
    fun play(_, held : card list, [])= score(held, goal)
      | play([], held : card list, Draw::_)= score(held, goal)
      | play([], held : card list, (Discard card)::ms')=
        let val held = remove_card(held, card, IllegalMove)
        in play([], held, ms')
        end
      | play(c::cs', held : card list, m::ms')=
        case m of 
          Discard card =>
            let 
              val cards = c::cs'
              val held = remove_card(held, card, IllegalMove)
            in 
              play(cards, held, ms')
            end
          | Draw => 
            let 
              val held = c::held
              val sum_cards = sum_cards(held)
            in 
              if sum_cards > goal then score(held, goal) else play(cs', held, ms') 
            end
  in
    play(cs, [], moves)
  end

