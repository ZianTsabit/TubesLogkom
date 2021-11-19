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
          write('1. Chili seed'),nl,
          write('2. Paddy seed'),nl,
          write('3. Tomato seed'),nl,
          write('4. Pineapple seed'),nl,
          write('5. Strawberry seed'),nl,
          write('6. Chicken'),nl,
          write('7. Sheep'),nl,
          write('8. Horse'),nl,
          write('9. Cow'),nl,
          write('10. Chicken feed'),nl,
          write('11. Sheep feed'),nl,
          write('12. Cow feed'),nl,
          write('13. Horse feed'),nl,
          write('14. Level 2 shovel'),nl,
          write('15. Level 3 shovel'),nl,
          write('16. Level 2 watering can'),nl,
          write('17. Level 3 watering can'),nl,
          write('18. Level 2 fishing rod'),nl,
          write('19. Level 3 fishing rod'),nl,
          write('20. Milking Equipment'),nl,
          write('21. Scissors'),!.

sell :- \+isStarted(_), write('You have to start your game first!'),!.
sell :- isStarted(_), \+isMarketplace(_), write('You are not in the marketplace !'),!.
sell :- isStarted(_), isMarketplace(_),
            write('Here are the items in your inventory'),nl,
            /*Masih dummy dulu*/
            write('1. ......'),nl, 
            write('2. ......'),nl,
            write('3. ......'),nl,
            write('What do you want to sell ?'),!.

exitMarket :- write('Thanks for coming !!!'),nl,
            retract(isMarketplace(_)),!.