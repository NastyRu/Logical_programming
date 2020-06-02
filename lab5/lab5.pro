domains
  lastname, city, street, model, color, bank, name = symbol
  telephone, house, flat, price, account, deposit, price = integer
  latitude, longitude = real
  adress = adress(city, street, house, flat)
  ownership = house(adress, price);
              ground(latitude, longitude, price);
	      auto(model, color, price);
	      boat(name, price)
        
predicates
  abonent(lastname, telephone, adress).
  depositor(lastname, city, bank, account, deposit).
  own(lastname, city, ownership).
  owns(lastname, city, name).
  ownsPrice(lastname, city, name, price).
  ownsSumPrice(lastname, city, price).
  boatPrice(lastname, city, price).
  housePrice(lastname, city, price).
  groundPrice(lastname, city, price).
  autoPrice(lastname, city, price).

clauses
  abonent(ellen, 111111, adress(moscow, tverskaya, 1, 1)).
  abonent(john, 222222, adress(moscow, arbat, 11, 112)).
  abonent(tom, 333333, adress(moscow, presnya, 10, 11)).
  abonent(eric, 444444, adress(moscow, pokrovka, 21, 55)).
  abonent(mark, 555555, adress(moscow, solyanka, 13, 13)).
  abonent(mark, 888888, adress(kazan, pushkin, 22, 130)).
  abonent(bill, 666666, adress(ekb, lenin, 12, 88)).
  abonent(bill, 777777, adress(spb, sadovaya, 1, 12)).
  depositor(ellen, moscow, sberbank, 10000, 2000).
  depositor(john, moscow, sberbank, 10000, 3000).
  depositor(john, moscow, vtb, 20000, 5000).
  depositor(tom, moscow, gazprom, 5000, 3000).
  depositor(eric, moscow, sberbank, 100000, 30000).
  depositor(mark, moscow, sberbank, 10000, 2000).
  depositor(mark, kazan, vtb, 10000, 2000).
  depositor(mark, moscow, gazprom, 10000, 2000).
  own(ellen, moscow, auto(bmw, red, 10000)).
  own(ellen, moscow, house(adress(moscow, tverskaya, 1, 1), 100000)).
  own(tom, moscow, auto(mersedes, white, 15000)).
  own(tom, moscow, ground(48.40338, 52.17403, 50000)).
  own(eric, moscow, auto(mersedes, white, 20000)).
  own(eric, moscow, house(adress(moscow, pokrovka, 21, 55), 200000)).
  own(eric, moscow, ground(28.40338, 32.17403, 500000)).
  own(eric, moscow, boat(ericary, 500000)).
  own(mark, moscow, auto(hyundai, silver, 7000)).
  own(mark, moscow, ground(41.40338, 2.17403, 100000)).
  own(mark, moscow, boat(mercury, 5000)).
  own(bill, ekb, auto(hyundai, black, 10000)).
  own(bill, ekb, house(adress(ekb, lenin, 12, 88), 50000)).
  own(bill, spb, auto(volvo, black, 13000)).
  own(bill, spb, house(adress(spb, sadovaya, 1, 12), 100000)).
  
  % Task1
  owns(Name, City, Types) :-
    own(Name, City, house(_, _)), Types = house.
  owns(Name, City, Types) :-
    own(Name, City, auto(_, _, _)), Types = auto.
  owns(Name, City, Types) :-
    own(Name, City, ground(_, _ ,_)), Types = ground.
  owns(Name, City, Types) :-
    own(Name, City, boat(_, _)), Types = boat.
  
  % Task2
  ownsPrice(Name, City, Types, Prices) :-
    own(Name, City, house(_, Prices)), Types = house.
  ownsPrice(Name, City, Types, Prices) :-
    own(Name, City, auto(_ ,_, Prices)), Types = auto.
  ownsPrice(Name, City, Types, Prices) :-
    own(Name, City, ground(_, _, Prices)), Types = ground.
  ownsPrice(Name, City, Types, Prices) :-
    own(Name, City, boat(_, Prices)), Types = boat.
  
  % Task3  
  housePrice(Name, City, Prices) :- 
    own(Name, City, house(_, Prices)),!.
  housePrice(_, _, Prices) :- 
    Prices = 0.
    
  groundPrice(Name, City, Prices) :- 
    own(Name, City, ground(_, _, Prices)),!.
  groundPrice(_, _, Prices) :- 
    Prices = 0.
    
  autoPrice(Name, City, Prices) :- 
    own(Name, City, auto(_ ,_, Prices)),!.
  autoPrice(_, _, Prices) :- 
    Prices = 0.
  
  boatPrice(Name, City, Prices) :- 
    own(Name, City, boat(_, Prices)),!.
  boatPrice(_, _, Prices) :- 
    Prices = 0.
      
  ownsSumPrice(Name, City, Prices) :-
    housePrice(Name, City, A),
    groundPrice(Name, City, B),
    autoPrice(Name, City, C),
    boatPrice(Name, City, D),
    Prices = A + B + C + D,
    Prices > 0.

goal
  Name = bill,
  City = spb,
  ownsPrice(Name, City, Types, Prices).