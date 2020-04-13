predicates
  multi abonent(string, string).
clauses
  abonent(ellen, "111111").
  abonent(ellen, "777777").
  abonent(john, "222222").
  abonent(tom, "333333").
  abonent(eric, "444444").
  abonent(eric, "888888").
  abonent(eric, "999999").
  abonent(mark, "555555").
  abonent(bill, "666666").
goal
  Name = james,
  write(Name, " numbers: "), nl,
  abonent(Name, Number).

