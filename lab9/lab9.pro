domains
  list = integer*
  length, summa = integer
predicates
  length(list, length).
  sum(list, summa).
  odd_sum(list, summa).
clauses
  length([], 0):-!.
  length([_|Tail], Length):-
    length(Tail, TailLength),
    Length = TailLength + 1.
    
  sum([], 0):-!.
  sum([Head|Tail], Sum):-
    sum(Tail, TailSum),
    Sum = TailSum + Head.
    
  odd_sum([], 0):-!.
  odd_sum([_], 0):-!.
  odd_sum([_, Second|Tail], Sum):-
    odd_sum(Tail, TailSum),
    Sum = TailSum + Second.

goal
  length([1,2,4], Length).