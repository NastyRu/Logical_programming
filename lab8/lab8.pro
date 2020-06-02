predicates
  factorial(integer, integer).
  fibonachi(integer, integer).
clauses
  factorial(0, 1):- !.
  factorial(Next, FactorialNext):- 
    Cur = Next - 1, 
    factorial(Cur, FactorialCur),
    FactorialNext = FactorialCur * Next.
    
  fibonachi(0, 0):- !.
  fibonachi(1, 1):- !.
  fibonachi(Next, FibonachiNext):- 
    Cur = Next - 1,
    Prev = Cur - 1,
    fibonachi(Cur, FibonachiCur),
    fibonachi(Prev, FibonachiPrev),
    FibonachiNext = FibonachiCur + FibonachiPrev.
goal
  fibonachi(4, Rez).