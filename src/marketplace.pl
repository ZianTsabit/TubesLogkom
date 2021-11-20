/*marketplace.pl*/

:- dynamic(isMarketplace/1).
:- dynamic(isBuy/1).
:- dynamic(isSell/1).

market :- \+isStarted(_), write('You have to start your game first!'),!.
market :- isStarted(_),player(X,Y), X =:= 12, Y =:= 12, (\+ isMarketplace(_), marketOption, asserta(isMarketplace(true));
          write('You are already in the marketplace !')),!. 
market :- isStarted(_), \+isMarketplace(_),write('You are not in the marketplace !'),!.

marketOption :- write('Wellcome to marketplace !!!'),nl,
                write('What do you want to do ?'),nl,
                write('1. Buy'),nl,
                write('2. Sell'),!.

buy :- \+isStarted(_), write('You have to start your game first!'),!.
buy :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace'),!.
buy :- isStarted(_), isMarketplace(_), (\+isBuy(_), buyOption, asserta(isBuy(true));
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

chili :- \+isStarted(_), write('You have to start your game first !'),!.
chili :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chili :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
chili :- write('How many do you want to buy ? \n'),
         read(Jumlah),
         player(_,_,_,_,_,_,_,_,_,Gold),
         price(chili,X),
         newPrice is Jumlah * X,
         newGold is Gold - newPrice,
         retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,_)),
         asserta(player(_,_,_,_,_,_,_,_,_,newGold)),
         write(newPrice),!.


paddy :- \+isStarted(_), write('You have to start your game first !'),!.
paddy :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
paddy :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
paddy :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(paddy,X), Gold < X,
         write('You dont have enough money !'),!.

tomato :- \+isStarted(_), write('You have to start your game first !'),!.
tomato :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
tomato :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
tomato :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(tomato,X), Gold < X,
          write('You dont have enough money !'),!.

pineapple :- \+isStarted(_), write('You have to start your game first !'),!.
pineapple :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
pineapple :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
pineapple :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(pineapple,X), Gold < X,
             write('You dont have enough money !'),!.

strawberry :- \+isStarted(_), write('You have to start your game first !'),!.
strawberry :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
strawberry :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
strawberry :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(strawberry,X), Gold < X,
              write('You dont have enough money !'),!.

chicken :- \+isStarted(_), write('You have to start your game first !'),!.
chicken :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chicken :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
chicken :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(chicken,X), Gold < X,
           write('You dont have enough money !'),!.

sheep :- \+isStarted(_), write('You have to start your game first !'),!.
sheep :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sheep :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
sheep :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(sheep,X), Gold < X,
         write('You dont have enough money !'),!.

cow :- \+isStarted(_), write('You have to start your game first !'),!.
cow :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
cow :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
cow :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(cow,X), Gold < X,
       write('You dont have enough money !'),!.

horse :- \+isStarted(_), write('You have to start your game first !'),!.
horse :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
horse :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
horse :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(horse,X), Gold < X,
         write('You dont have enough money !'),!.

chicken_feed :- \+isStarted(_), write('You have to start your game first !'),!.
chicken_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
chicken_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
chicken_feed :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(chicken_feed,X), Gold < X,
                write('You dont have enough money !'),!.

sheep_feed :- \+isStarted(_), write('You have to start your game first !'),!.
sheep_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sheep_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
sheep_feed :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(sheep_feed,X), Gold < X,
              write('You dont have enough money !'),!.

cow_feed :- \+isStarted(_), write('You have to start your game first !'),!.
cow_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
cow_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
cow_feed :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(cow_feed,X), Gold < X,
            write('You dont have enough money !'),!.

horse_feed :- \+isStarted(_), write('You have to start your game first !'),!.
horse_feed :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
horse_feed :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
horse_feed :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(horse_feed,X), Gold < X,
              write('You dont have enough money !'),!.

level2_shovel :- \+isStarted(_), write('You have to start your game first !'),!.
level2_shovel :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level2_shovel :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level2_shovel :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(level2_shovel,X), Gold < X,
                 write('You dont have enough money !'),!.

level3_shovel :- \+isStarted(_), write('You have to start your game first !'),!.
level3_shovel :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level3_shovel :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level3_shovel :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(level3_shovel,X), Gold < X,
                 write('You dont have enough money !'),!.

level2_watering_can :- \+isStarted(_), write('You have to start your game first !'),!.
level2_watering_can :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level2_watering_can :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level2_watering_can :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(level2_watering_can,X), Gold < X,
                       write('You dont have enough money !'),!.

level3_watering_can :- \+isStarted(_), write('You have to start your game first !'),!.
level3_watering_can :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level3_watering_can :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level3_watering_can :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(level3_watering_can,X), Gold < X,
                       write('You dont have enough money !'),!.

level2_fishing_rod :- \+isStarted(_), write('You have to start your game first !'),!.
level2_fishing_rod :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level2_fishing_rod :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level2_fishing_rod :- isStarted(_), isMarketplace(_), player(_,_,_,_,_,_,_,_,_,_,Gold),
                      newGold is Gold-500, newGold < 0,
                      write('You dont have enough money !'),!.

level3_fishing_rod :- \+isStarted(_), write('You have to start your game first !'),!.
level3_fishing_rod :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
level3_fishing_rod :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
level3_fishing_rod :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(level3_fishing_rod,X), Gold < X,
                      write('You dont have enough money !'),!.

bait :- \+isStarted(_), write('You have to start your game first !'),!.
bait :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
bait :- isStarted(_), isMarketplace(_), \+isBuy(_), write('You have not selected the buy option !'),!.
bait :- player(_,_,_,_,_,_,_,_,_,_,Gold), price(bait,X), Gold < X,
        write('You dont have enough money !'),!.





sell :- \+isStarted(_), write('You have to start your game first!'),!.
sell :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sell :- isStarted(_), isMarketplace(_),
            write('Here are the items in your inventory'),nl,
            /*Masih dummy dulu*/
            listConsumable,
            write('What do you want to sell ?'),!.

exitMarket :- write('Thanks for coming !!!'),nl,
            retract(isMarketplace(_)),!.