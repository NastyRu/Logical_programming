domains
  name, university = string.
predicates
  universe(name, university).
clauses
  universe("Ellen", "BMSTU").
  universe("Ellen", "MSU").
  universe("John", "MSU").
  universe("Tom", "MFTI").
  universe("Tom", University) :- universe ("John", University).
  universe("Eric", "HSE").
  universe("Eric", "BMSTU").
  universe("Mark", "MIFI"). 
  universe("Mark", "HSE"). 
  universe("Mark", University) :- universe ("Tom", University).
  universe("Bill", University) :- universe ("Tom", University). 
goal
  Name = "Bill",
  University = "MSTU",
  write(Name, " is student ", University, "?"), nl,
  universe(Name, University).