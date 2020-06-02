predicates
  max2(integer, integer, integer).
  max2v(integer, integer, integer).
  max3(integer, integer, integer, integer).
  max3v(integer, integer, integer, integer).
clauses
  max2(A, B, A) :- A >= B.
  max2(A, B, B) :- B > A.
  
  max2v(A, B, A) :- A > B,!.
  max2v(_, B, B).
  
  max3(A, B, C, A) :- A >= B, A >= C.
  max3(A, B, C, B) :- B > A, B >= C.
  max3(A, B, C, C) :- C > A, C > B.
  
  max3v(A, B, C, A) :- A > B, A > C,!.
  max3v(_, B, C, B) :- B > C,!.
  max3v(_, _, C, C).
goal
  max3v(1, 5, 2, Rez).