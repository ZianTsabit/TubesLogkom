/*marketplace.pl*/

:- dynamic(isMarketplace/1).

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
buy :- isStarted(_), isMarketplace(_),
          write('What do you want to buy ?'),nl,
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
          write('19. Level 3 fishing rod (700 golds)').

sell :- \+isStarted(_), write('You have to start your game first!'),!.
sell :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sell :- isStarted(_), isMarketplace(_),
            write('Here are the items in your inventory'),nl,
            /*Masih dummy dulu*/
            listConsumable,
            write('What do you want to sell ?'),!.

exitMarket :- write('Thanks for coming !!!'),nl,
            retract(isMarketplace(_)),!.