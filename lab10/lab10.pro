domains
  list = integer*
  num = integer
predicates
  over_number(list, num, list).
  odd_list(list, list).
  delete_number(list, num, list).
  member(num, list).
  multi_list(list, list).
clauses    
  over_number([], _, []):-!.
  over_number([X|Tail], Num, [X|List]):-
    X > Num,
    over_number(Tail, Num, List),!.
  over_number([_|Tail], Num, List):-
    over_number(Tail, Num, List).
    
  odd_list([], []):-!.
  odd_list([_], []):-!.
  odd_list([_, Second|Tail], [Second|OddTail]):-
    odd_list(Tail, OddTail).
    
  delete_number([], _, []):-!.
  delete_number([Num|Tail], Num, List):-
    delete_number(Tail, Num, List),!.
  delete_number([X|Tail], Num, [X|List]):-
    delete_number(Tail, Num, List).
    
  member(Num, [Num|_]):-!.
  member(Num, [_|Tail]):-
    member(Num, Tail).

  multi_list([], []):-!.
  multi_list([Num|Tail], List):-
    member(Num, Tail),
    multi_list(Tail, List),!.
  multi_list([Num|Tail], [Num|List]):-
    multi_list(Tail, List).

goal
  over_number([5,1,2,3], 2, List).