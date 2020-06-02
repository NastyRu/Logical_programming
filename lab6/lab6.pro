domains
  name = symbol
        
predicates
  mother(name, name).
  father(name, name).
  grandfatherF(name, name).
  grandfatherM(name, name).
  grandmotherF(name, name).
  grandmotherM(name, name).
  allGrandmothers(name, name).
  allGrandfathers(name, name).
  allGrandparents(name, name).
  grandparentsM(name, name)

clauses
  mother(maria, ann).
  mother(maria, yulia).
  mother(irina, dima).
  mother(ann, petr).
  father(ivan, ann).
  father(ivan, yulia).
  father(maksim, dima).
  father(dima, petr).
  
  % Grandfather on the mother line
  grandfatherM(X, Y):- father(X, Z), mother(Z, Y).
  % Grandfather on the father line
  grandfatherF(X, Y):- father(X, Z), father(Z, Y).
  % Grandmother on the mother line
  grandmotherM(X, Y):- mother(X, Z), mother(Z, Y).
  % Grandmother on the father line
  grandmotherF(X, Y):- mother(X, Z), father(Z, Y).
  
  % All grandmothers
  allGrandmothers(X, Y):- grandmotherM(X, Y).
  allGrandmothers(X, Y):- grandmotherF(X, Y).
  
  % All grandfathers
  allGrandfathers(X, Y):- grandfatherM(X, Y).
  allGrandfathers(X, Y):- grandfatherF(X, Y).
  
  % All grandpsrents
  allGrandparents(X, Y):- allGrandfathers(X, Y).
  allGrandparents(X, Y):- allGrandmothers(X, Y).
  
  % Grandparents on the mother line
  grandparentsM(X, Y):- grandfatherM(X, Y).
  grandparentsM(X, Y):- grandmotherM(X, Y).

goal
  grandmotherM(X, petr).