domains
  lastname, city, street, model, color, bank = symbol.
  telephone, house, flat, price, account, deposit = integer.
  adress = adress(city, street, house, flat).
predicates
  abonent(lastname, telephone, adress).
  auto(lastname, city, model, color, price).
  depositor(lastname, city, bank, account, deposit).
  
  autoByNumber(telephone, lastname, model, price).
  modelAutoByNumber(telephone, model).
  adressBankByLastnameCity(lastname, city, street, bank, telephone).
clauses
  abonent(ellen, 111111, adress(moscow, tverskaya, 1, 1)).
  abonent(john, 222222, adress(moscow, arbat, 11, 112)).
  abonent(tom, 333333, adress(moscow, presnya, 10, 11)).
  abonent(eric, 444444, adress(moscow, pokrovka, 21, 55)).
  abonent(mark, 555555, adress(moscow, solyanka, 13, 13)).
  abonent(mark, 888888, adress(kazan, pushkin, 22, 130)).
  abonent(bill, 666666, adress(ekb, lenin, 12, 88)).
  abonent(bill, 777777, adress(spb, sadovaya, 1, 12)).
  auto(ellen, moscow, bmw, red, 10000).
  auto(tom, moscow, mersedes, black, 15000).
  auto(eric, moscow, mersedes, white, 20000).
  auto(eric, moscow, bmw, black, 15000).
  auto(eric, moscow, porshe, red, 30000).
  auto(mark, moscow, hyundai, silver, 7000).
  auto(bill, ekb, hyundai, black, 10000).
  auto(bill, spb, volvo, black, 13000).
  depositor(ellen, moscow, sberbank, 10000, 2000).
  depositor(john, moscow, sberbank, 10000, 3000).
  depositor(john, moscow, vtb, 20000, 5000).
  depositor(eric, moscow, sberbank, 100000, 30000).
  depositor(mark, moscow, sberbank, 10000, 2000).
  depositor(mark, kazan, vtb, 10000, 2000).
  depositor(mark, moscow, gazprom, 10000, 2000).
  depositor(bill, spb, vtb, 30000, 3000).
  
  autoByNumber(Number, Name, Model, Price) :- 
    abonent(Name, Number, adress(City, _, _, _)),
    auto(Name, City, Model, _, Price).
    
  modelAutoByNumber(Number, Model) :-
    autoByNumber(Number, _, Model, _).
    
  adressBankByLastnameCity(Name, City, Street, Bank, Number) :-
    abonent(Name, Number, adress(City, Street, _, _)),
    depositor(Name, City, Bank, _, _).
goal
  Name = mark,
  City = kazan,
  adressBankByLastnameCity(Name,City,Street,Bank,Number).
  