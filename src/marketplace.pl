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
             (season(spring),
             write('1. Chili seed (100 golds)'),nl,
             write('2. Paddy seed (50 golds)'),nl,
             write('3. Chicken (250 golds)'),nl,
             write('4. Sheep (350 golds)'),nl,
             write('5. Horse (1000 golds)'),nl,
             write('6. Cow (750 golds)'),nl,
             write('7. Chicken feed (150 golds)'),nl,
             write('8. Sheep feed (175 golds)'),nl,
             write('9. Cow feed (200 golds)'),nl,
             write('10. Horse feed (225 golds)'),nl,
             write('11. Level 2 shovel (500 golds)'),nl,
             write('12. Level 3 shovel (750 golds)'),nl,
             write('13. Level 2 watering can (300 golds)'),nl,
             write('14. Level 3 watering can (550 golds)'),nl,
             write('15. Level 2 fishing rod (500 golds)'),nl,
             write('16. Level 3 fishing rod (700 golds)'),nl,
             write('17. Bait (15 golds)');
             season(summer),
             write('1. Tomato seed (100 golds)'),nl,
             write('2. Strawberry seed (150 golds)'),nl,
             write('3. Chicken (250 golds)'),nl,
             write('4. Sheep (350 golds)'),nl,
             write('5. Horse (1000 golds)'),nl,
             write('6. Cow (750 golds)'),nl,
             write('7. Chicken feed (150 golds)'),nl,
             write('8. Sheep feed (175 golds)'),nl,
             write('9. Cow feed (200 golds)'),nl,
             write('10. Horse feed (225 golds)'),nl,
             write('11. Level 2 shovel (500 golds)'),nl,
             write('12. Level 3 shovel (750 golds)'),nl,
             write('13. Level 2 watering can (300 golds)'),nl,
             write('14. Level 3 watering can (550 golds)'),nl,
             write('15. Level 2 fishing rod (500 golds)'),nl,
             write('16. Level 3 fishing rod (700 golds)'),nl,
             write('17. Bait (15 golds)');
             season(autumn),
             write('1. Pineapple seed (200 golds)'),nl,
             write('2. Chicken (250 golds)'),nl,
             write('3. Sheep (350 golds)'),nl,
             write('4. Horse (1000 golds)'),nl,
             write('5. Cow (750 golds)'),nl,
             write('6. Chicken feed (150 golds)'),nl,
             write('7. Sheep feed (175 golds)'),nl,
             write('8. Cow feed (200 golds)'),nl,
             write('9. Horse feed (225 golds)'),nl,
             write('10. Level 2 shovel (500 golds)'),nl,
             write('11. Level 3 shovel (750 golds)'),nl,
             write('12. Level 2 watering can (300 golds)'),nl,
             write('13. Level 3 watering can (550 golds)'),nl,
             write('14. Level 2 fishing rod (500 golds)'),nl,
             write('15. Level 3 fishing rod (700 golds)'),nl,
             write('16. Bait (15 golds)');
             season(winter),
             write('1. Chicken (250 golds)'),nl,
             write('2. Sheep (350 golds)'),nl,
             write('3. Horse (1000 golds)'),nl,
             write('4. Cow (750 golds)'),nl,
             write('5. Chicken feed (150 golds)'),nl,
             write('6. Sheep feed (175 golds)'),nl,
             write('7. Cow feed (200 golds)'),nl,
             write('8. Horse feed (225 golds)'),nl,
             write('9. Level 2 shovel (500 golds)'),nl,
             write('10. Level 3 shovel (750 golds)'),nl,
             write('11. Level 2 watering can (300 golds)'),nl,
             write('12. Level 3 watering can (550 golds)'),nl,
             write('13. Level 2 fishing rod (500 golds)'),nl,
             write('14. Level 3 fishing rod (700 golds)'),nl,
             write('15. Bait (15 golds)')),
             nl,nl,write('>'),read(Choice),
             (
                    ((Choice = chili_seed) -> buy_chili_seed);
                    ((Choice = paddy_seed) -> buy_paddy_seed);
                    ((Choice = tomato_seed) -> buy_tomato_seed);
                    ((Choice = pineapple_seed) -> buy_pineapple_seed);
                    ((Choice = strawberry_seed) -> buy_strawberry_seed);
                    ((Choice = chicken) -> buy_chicken);
                    ((Choice = sheep) -> buy_sheep);
                    ((Choice = cow) -> buy_cow);
                    ((Choice = horse) -> buy_horse);
                    ((Choice = chicken_feed) -> buy_chicken_feed);
                    ((Choice = sheep_feed) -> buy_sheep_feed);
                    ((Choice = cow_feed) -> buy_cow_feed);
                    ((Choice = horse_feed) -> buy_horse_feed);
                    ((Choice = level_2_shovel) -> level_2_shovel);
                    ((Choice = level_3_shovel) -> level_3_shovel);
                    ((Choice = level_2_watering_can) -> level_2_watering_can);
                    ((Choice = level_3_watering_can) -> level_3_watering_can);
                    ((Choice = level_2_fishing_rod) -> level_2_fishing_rod);
                    ((Choice = level_3_fishing_rod) -> level_3_fishing_rod);
                    ((Choice = bait) -> buy_bait)
             ) ,!.

buy_chili_seed :- 
       season(spring),
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chili_seed,X),
       ( (( Amount >= 0 ) ->
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chili seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(6, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)))     
       ));
        (( Amount < 0 ) -> write('Invalid input'))
       )
       ,!.

sell_chili_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(chili_seed,X),
       inventoryI(6, chili_seed,_,_,_, Jumlah),
       ((\+cekConsumableExist(6, chili_seed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(6, chili_seed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(6, Amount),
       write('You sold '),write(Amount), write(' chili seeds'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_paddy_seed :- 
       season(spring),
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(paddy_seed,X),
       ( (( Amount >= 0 ) ->
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' paddy seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(7, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        (( Amount < 0) -> write('Invalid input'))     
       )
       ,!.

sell_paddy_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(paddy_seed,X),
       inventoryI(7, paddy_seed,_,_,_, Jumlah),
       ((\+cekConsumableExist(7, paddy_seed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(7, paddy_seed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(6, Amount),
       write('You sold '),write(Amount), write(' paddy seeds'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_tomato_seed :- 
       season(summer),
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(tomato_seed,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' tomato seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(8, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        (( Amount < 0) -> write('Invalid input'))     
       ),!.

sell_tomato_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(tomato_seed,X),
       inventoryI(8, tomato_seed,_,_,_, Jumlah),
       ((\+cekConsumableExist(8, tomato_seed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(8, tomato_seed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(6, Amount),
       write('You sold '),write(Amount), write(' tomato seeds'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_pineapple_seed :- 
       season(autumn),
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(pineapple_seed,X),
       ( (( Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' pineapple seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(9, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        (( Amount < 0) -> write('Invalid input'))     
       ),!.

sell_pineapple_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(pineapple_seed,X),
       inventoryI(9, pineapple_seed,_,_,_, Jumlah),
       ((\+cekConsumableExist(9, pineapple_seed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(9, pineapple_seed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(6, Amount),
       write('You sold '),write(Amount), write(' pineapple seeds'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_strawberry_seed :- 
       season(summer),
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(strawberry_seed,X),
       ( ((Amount >= 0) ->
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' strawberry seeds.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(10, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        (( Amount < 0) -> write('Invalid input'))     
       ),!.

sell_strawberry_seed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(strawberry_seed,X),
       inventoryI(10, strawberry_seed,_,_,_, Jumlah),
       ((\+cekConsumableExist(10, strawberry_seed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(10, strawberry_seed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(6, Amount),
       write('You sold '),write(Amount), write(' strawberry seeds'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_chicken :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chicken,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chicken.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(15, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_chicken :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(chicken,X),
       inventoryI(15, chicken,_,_,_, Jumlah),
       ((\+cekConsumableExist(15, chicken),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(15, chicken),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(15, Amount),
       write('You sold '),write(Amount), write(' chicken'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_sheep :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(sheep,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' sheep.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(16, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_sheep :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(sheep,X),
       inventoryI(16, sheep,_,_,_, Jumlah),
       ((\+cekConsumableExist(16, sheep),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(16, sheep),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(16, Amount),
       write('You sold '),write(Amount), write(' sheep'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_cow :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(cow,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' cow.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(17, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_cow :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(cow,X),
       inventoryI(17, cow,_,_,_, Jumlah),
       ((\+cekConsumableExist(17, cow),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(17, cow),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(17, Amount),
       write('You sold '),write(Amount), write(' cow'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_horse :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(horse,X),
       ( ((Amount >= 0) ->
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' horse.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(18, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_horse :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(horse,X),
       inventoryI(18, horse,_,_,_, Jumlah),
       ((\+cekConsumableExist(18, horse),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(18, horse),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(18, horse),
       write('You sold '),write(Amount), write(' horse'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_chicken_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(chicken_feed,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' chicken feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(11, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_chicken_feed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(chicken_feed,X),
       inventoryI(11, chicken_feed,_,_,_, Jumlah),
       ((\+cekConsumableExist(11, chicken_feed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(11, chicken_feed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(11, chicken_feed),
       write('You sold '),write(Amount), write(' chicken feed'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_sheep_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(sheep_feed,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' sheep feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(12, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_sheep_feed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(sheep_feed,X),
       inventoryI(12, sheep_feed,_,_,_, Jumlah),
       ((\+cekConsumableExist(12, sheep_feed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(12, sheep_feed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(12, sheep_feed),
       write('You sold '),write(Amount), write(' sheep feed'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_cow_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(cow_feed,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' cow feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(13, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_cow_feed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(cow_feed,X),
       inventoryI(13, cow_feed,_,_,_, Jumlah),
       ((\+cekConsumableExist(13, cow_feed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(13, cow_feed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(13, cow_feed),
       write('You sold '),write(Amount), write(' cow feed'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

buy_horse_feed :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(horse_feed,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' horse feed.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(14, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_horse_feed :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(horse_feed,X),
       inventoryI(14, horse_feed,_,_,_, Jumlah),
       ((\+cekConsumableExist(14, horse_feed),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(14, horse_feed),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(14, horse_feed),
       write('You sold '),write(Amount), write(' horse feed'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )
       ),!.

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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )
       ),!.
       
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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )
       ),!.
       
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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )),!.
       
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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )),!.
       
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
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
       ))
       )),!.

buy_bait :- 
       write('How many do you want to buy? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       price(bait,X),
       ( ((Amount >= 0) -> 
       NewPrice is Amount*X,
       (
        ((NewPrice > Gold) -> 
        write('You dont have enough money !'),nl);
        (NewPrice =< Gold, 
        write('You have bought '), write(Amount), write(' bait.'),nl,
        write('You are charged '), write(NewPrice), write(' golds'),nl,
        NewGold is Gold-NewPrice,
        addConsumable(5, Amount),
        retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
        asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold))
        )));
        ((Amount < 0) -> write('Invalid input'))     
       ),!.

sell_bait :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(bait,X),
       inventoryI(5, bait,_,_,_, Jumlah),
       ((\+cekConsumableExist(5, bait),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(5, bait),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(5, bait),
       write('You sold '),write(Amount), write(' bait'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.


exitBuy :- retract(isBuy(_)),exitMarket,market,!.


sell :- \+isStarted(_), write('You have to start your game first!'),!.
sell :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sell :- isStarted(_), isMarketplace(_), (\+isSell(_), sellOption, asserta(isSell(true));
       write('You are already chose sell option !')),!.

sellOption :- isStarted(_), isMarketplace(_),
            write('Here are the items in your inventory'),nl,
            listConsumable,
            write('What do you want to sell ?'),nl,nl,
            write('>'),read(Choice),
            (
                   ((Choice = chili_seed) -> sell_chili_seed);
                   ((Choice = paddy_seed) -> sell_paddy_seed);
                   ((Choice = tomato_seed) -> sell_tomato_seed);
                   ((Choice = pineapple_seed) -> sell_pineapple_seed);
                   ((Choice = strawberry_seed) -> sell_strawberry_seed);
                   ((Choice = chicken) -> sell_chicken);
                   ((Choice = sheep) -> sell_sheep);
                   ((Choice = cow) -> sell_cow);
                   ((Choice = horse) -> sell_horse);
                   ((Choice = chicken_feed) -> sell_chicken_feed);
                   ((Choice = sheep_feed) -> sell_sheep_feed);
                   ((Choice = cow_feed) -> sell_cow_feed);
                   ((Choice = horse_feed) -> sell_horse_feed);
                   ((Choice = bait) -> sell_bait);
                   ((Choice = chili) -> sell_chili);
                   ((Choice = paddy) -> sell_paddy);
                   ((Choice = tomato) -> sell_tomato);
                   ((Choice = pineapple) -> sell_pineapple);
                   ((Choice = strawberry) -> sell_strawberry);
                   ((Choice = eggs) -> sell_eggs);
                   ((Choice = milk) -> sell_milk);
                   ((Choice = horse_milk) -> sell_horse_milk);
                   ((Choice = wool) -> sell_wool);
                   ((Choice = tuna) -> sell_tuna_fish);
                   ((Choice = mackerel) -> sell_mackerel_fish);
                   ((Choice = sardines) -> sell_sardines_fish);
                   ((Choice = puffer) -> sell_puffer_fish)

            ),!.

exitSell :- retract(isSell(_)),exitMarket,market,!.

sell_chili :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(chili,X),
       inventoryI(23, chili,_,_,_, Jumlah),
       ((\+cekConsumableExist(23, chili),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(23, chili),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(23, Amount),
       write('You sold '),write(Amount), write(' chili'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.


sell_paddy :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(paddy,X),
       inventoryI(24, paddy,_,_,_, Jumlah),
       ((\+cekConsumableExist(24, paddy),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(24, paddy),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(24, paddy),
       write('You sold '),write(Amount), write(' paddy'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_tomato :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(tomato,X),
       inventoryI(25, tomato,_,_,_, Jumlah),
       ((\+cekConsumableExist(25, tomato),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(25, tomato),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(25, tomato),
       write('You sold '),write(Amount), write(' tomato'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_pineapple :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(pineapple,X),
       inventoryI(26, pineapple,_,_,_, Jumlah),
       ((\+cekConsumableExist(26, pineapple),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(26, pineapple),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(26, pineapple),
       write('You sold '),write(Amount), write(' pineapple'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_strawberry :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(strawberry,X),
       inventoryI(27, strawberry,_,_,_, Jumlah),
       ((\+cekConsumableExist(27, strawberry),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(27, strawberry),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(27, strawberry),
       write('You sold '),write(Amount), write(' strawberry'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_eggs :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(eggs,X),
       inventoryI(19, eggs,_,_,_, Jumlah),
       ((\+cekConsumableExist(19, eggs),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(19, eggs),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(19, eggs),
       write('You sold '),write(Amount), write(' eggs'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_milk :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(milk,X),
       inventoryI(20, milk,_,_,_, Jumlah),
       ((\+cekConsumableExist(20, milk),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(20, milk),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(20, milk),
       write('You sold '),write(Amount), write(' milk'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_horse_milk :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(horse_milk,X),
       inventoryI(21, horse_milk,_,_,_, Jumlah),
       ((\+cekConsumableExist(21, horse_milk),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(21, horse_milk),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(21, horse_milk),
       write('You sold '),write(Amount), write(' horse milk'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_wool :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(wool,X),
       inventoryI(22, wool,_,_,_, Jumlah),
       ((\+cekConsumableExist(22, wool),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(22, wool),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(22, wool),
       write('You sold '),write(Amount), write(' wool'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_tuna_fish :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(tuna_fish,X),
       inventoryI(1, tuna_fish,_,_,_, Jumlah),
       ((\+cekConsumableExist(1, tuna_fish),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(1, tuna_fish),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(1, tuna_fish),
       write('You sold '),write(Amount), write(' tuna'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_mackerel_fish :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(mackerel_fish,X),
       inventoryI(2, mackerel_fish,_,_,_, Jumlah),
       ((\+cekConsumableExist(2, mackerel_fish),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(2, mackerel_fish),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(2, mackerel_fish),
       write('You sold '),write(Amount), write(' mackerel'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_sardines_fish :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(sardines_fish,X),
       inventoryI(3, sardines_fish,_,_,_, Jumlah),
       ((\+cekConsumableExist(3, sardines_fish),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(3, sardines_fish),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(3, sardines_fish),
       write('You sold '),write(Amount), write(' sardine'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

sell_puffer_fish :- 
       write('How many do you want to sell? \n'),
       write('> '),read_integer(Amount),
       player(_,_,_,_,_,_,_,_,_,Gold),
       sellprice(puffer_fish,X),
       inventoryI(4, puffer_fish,_,_,_, Jumlah),
       ((\+cekConsumableExist(4, puffer_fish),
       write('There is no such item in your inventory!\nPlease check again!\n'));
       (cekConsumableExist(4, puffer_fish),
       (Jumlah >= Amount,
       NewPrice is Amount*X,
       NewGold is Gold+NewPrice,
       retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
       asserta(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,NewGold)),
       deleteConsumable(4, puffer_fish),
       write('You sold '),write(Amount), write(' puffer fish'),nl,
       write('You received '), write(NewPrice), write(' golds')
       );
       Jumlah < Amount,
       write('Invalid amount!\nPlease check again!\n')
       )),!.

exitMarket :- write('Thanks for coming !!!'),nl,
            retract(isMarketplace(_)),!.
