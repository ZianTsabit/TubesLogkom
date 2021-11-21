/*marketplace.pl*/

:- dynamic(isMarketplace/1).
:- dynamic(isBuy/1).
:- dynamic(isSell/1).

market :- \+isStarted(_), write('You have to start your game first!'),!.
market :- isStarted(_),player(X,Y), X =:= 12, Y =:= 12, (\+ isMarketplace(_), 
          write('Wellcome to marketplace !'),nl,
          marketOption,
          asserta(isMarketplace(true));
          write('You are already in the marketplace !')),!. 
market :- isStarted(_), \+isMarketplace(_),write('You are not in the marketplace !'),!.

marketOption :- write('What do you want to do ?'),nl,
                write('1. Buy'),nl,
                write('2. Sell'),!.

buy :- \+isStarted(_), write('You have to start your game first!'),!.
buy :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace'),!.
buy :- isStarted(_), isMarketplace(_),(\+isBuy(_), buyOption, asserta(isBuy(true));
       write('You are already chose buy option !')),!.

buyOption :- write('What do you want to buy ?'),nl,
             write('1. Chili seed (100 golds)'),nl,
             write('2. Paddy seed (50 golds)'),nl,
             write('3. Tomato seed (100 golds)'),nl,
             write('4. Pineapple seed (200 golds)'),nl,
             write('5. Strawberry seed (150 golds)'),nl,
             write('6. Chicken (250 golds)'),nl,
             write('7. Sheep (350 golds)'),nl,
             write('8. Horse (1000 golds)'),nl,
             write('9. Cow (750 golds)'),nl,
             write('10. Chicken feed (150 golds)'),nl,
             write('11. Sheep feed (175 golds)'),nl,
             write('12. Cow feed (200 golds)'),nl,
             write('13. Horse feed (225 golds)'),nl,
             write('14. Level 2 shovel (500 golds)'),nl,
             write('15. Level 3 shovel (750 golds)'),nl,
             write('16. Level 2 watering can (300 golds)'),nl,
             write('17. Level 3 watering can (550 golds)'),nl,
             write('18. Level 2 fishing rod (500 golds)'),nl,
             write('19. Level 3 fishing rod (700 golds)'),nl,
             write('20. Bait (15 golds)').

chili_seed :- \+isStarted(_), write('You have to start your game first !'),!.
chili_seed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chili_seed :- isStarted(_), isMarketplace(_), 
              ((isBuy(_), buy_chili_seed);(isSell(_), sell_chili_seed)
              ),!.

buy_chili_seed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chili_seed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chili seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(6, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

sell_chili_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       !.

paddy_seed :- \+isStarted(_), write('You have to start your game first !'),!.
paddy_seed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
paddy_seed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
paddy_seed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(paddy_seed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' paddy seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(7, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

tomato_seed :- \+isStarted(_), write('You have to start your game first !'),!.
tomato_seed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
tomato_seed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
tomato_seed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(tomato_seed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' tomato seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(8, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

pineapple_seed :- \+isStarted(_), write('You have to start your game first !'),!.
pineapple_seed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
pineapple_seed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
pineapple_seed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(pineapple_seed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' pineapple seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(9, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

strawberry_seed :- \+isStarted(_), write('You have to start your game first !'),!.
strawberry_seed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
strawberry_seed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
strawberry_seed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(strawberry_seed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' strawberry seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(10, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

chicken :- \+isStarted(_), write('You have to start your game first !'),!.
chicken :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chicken :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
chicken :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chicken,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chicken.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(15, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

sheep :- \+isStarted(_), write('You have to start your game first !'),!.
sheep :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sheep :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
sheep :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(sheep,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' sheep.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(16, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

cow :- \+isStarted(_), write('You have to start your game first !'),!.
cow :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
cow :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
cow :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(cow,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' cow.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(17, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

horse :- \+isStarted(_), write('You have to start your game first !'),!.
horse :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
horse :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
horse :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(horse,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' horse.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(18, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

chicken_feed :- \+isStarted(_), write('You have to start your game first !'),!.
chicken_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chicken_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
chicken_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chicken_feed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chicken feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(11, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

sheep_feed :- \+isStarted(_), write('You have to start your game first !'),!.
sheep_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sheep_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
sheep_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(sheep_feed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' sheep feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(12, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

cow_feed :- \+isStarted(_), write('You have to start your game first !'),!.
cow_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
cow_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
cow_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(cow_feed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' cow feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(13, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

horse_feed :- \+isStarted(_), write('You have to start your game first !'),!.
horse_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
horse_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
horse_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(horse_feed,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' horse feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(14, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

level_2_shovel :- \+isStarted(_), write('You have to start your game first !'),!.
level_2_shovel :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_2_shovel :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_2_shovel :- 
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level2_shovel,X),
       (
       (Role \= farmer,
       write('You are not farmer !, you can not buy this item !'));
       (Role = farmer,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 2 shovel !!!'),
       addItem(6,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )
       ),!.

level_3_shovel :- \+isStarted(_), write('You have to start your game first !'),!.
level_3_shovel :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_3_shovel :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_3_shovel :- 
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level3_shovel,X),
       (
       (Role \= farmer,
       write('You are not farmer !, you can not buy this item !'));
       (Role = farmer,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 3 shovel !!!'),
       addItem(7,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )
       ),!.
       

level_2_watering_can :- \+isStarted(_), write('You have to start your game first !'),!.
level_2_watering_can :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_2_watering_can :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_2_watering_can :- 
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level2_watering_can,X),
       (
       (Role \= farmer,
       write('You are not farmer !, you can not buy this item !'));
       (Role = farmer,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 2 watering can !!!'),
       addItem(8,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )
       ),!.
       

level_3_watering_can :- \+isStarted(_), write('You have to start your game first !'),!.
level_3_watering_can :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_3_watering_can :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_3_watering_can :- 
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level3_watering_can,X),
       (
       (Role \= farmer,
       write('You are not farmer !, you can not buy this item !'));
       (Role = farmer,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 3 watering can !!!'),
       addItem(9,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )),!.
       

level_2_fishing_rod :- \+isStarted(_), write('You have to start your game first !'),!.
level_2_fishing_rod :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_2_fishing_rod :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_2_fishing_rod :-
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level2_fishing_rod,X),
       (
       (Role \= fisherman,
       write('You are not fisherman !, you can not buy this item !'));
       (Role = fisherman,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 2 fishing rod !!!'),
       addItem(10,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )),!.
       
level_3_fishing_rod :- \+isStarted(_), write('You have to start your game first !'),!.
level_3_fishing_rod :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level_3_fishing_rod :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level_3_fishing_rod :- 
       player(Role,_,_,_,_,_,_,_,_,Gold),
       price(level3_fishing_rod,X),
       (
       (Role \= fisherman,
       write('You are not fisherman !, you can not buy this item !'));
       (Role = fisherman,
       ((Gold < X,
       write('You dont have enough money !!!'));
       (Gold >= X,
       write('Congrats !!! You have successfully purchased level 3 fishing rod !!!'),
       addItem(11,Role,1),
       NewGold is Gold-X,
       retract(player(_,_,_,_,_,_,_,_,_,_)),
       asserta(player(_,_,_,_,_,_,_,_,_,NewGold))
       ))
       )),!.

bait :- \+isStarted(_), write('You have to start your game first !'),!.
bait :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
bait :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
bait :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(bait,X),
       NewPrice is Amount*X,
       (
        (NewPrice > Gold -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' bait.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(5, Amount),
        retract(player(_,_,_,_,_,_,_,_,_,_)),
        asserta(player(_,_,_,_,_,_,_,_,_,NewGold)))     
       ),!.

exitBuy :- retract(isBuy(_)),exitMarket,market,!.



sell :- \+isStarted(_), write('You have to start your game first!'),!.
sell :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sell :- isStarted(_), isMarketplace(_), (\+isSell(_), sellOption, asserta(isSell(true));
       write('You are already chose sell option !')),!.

sellOption :- isStarted(_), isMarketplace(_),
            write('Here are the items in your inventory'),nl,
            listConsumable,
            write('What do you want to sell ?'),!.

exitSell :- retract(isSell(_)),exitMarket,market,!.





exitMarket :- write('Thanks for coming !!!'),nl,
            retract(isMarketplace(_)),!.
