:- dynamic(isAlchemist/1).
:- dynamic(isRich/1).
:- dynamic(isSpeed/1).

writePotion                 :-  \+ isRich(_), \+ isSpeed(_), write('- Rich Potion (3000 gold)'), nl, write('- Speed Potion (3000 gold)');
                                \+ isRich(_), write('- Rich Potion (3000 gold)');
                                \+ isSpeed(_), write('- Speed Potion (3000 gold)');
                                write('You already bought all potion').

alchemistMenu               :-  player(X,Y), (X \= 1; Y \= 1), write('You are not in alchemist house');
                                player(X,Y), X = 1, Y = 1, alchemist(_,_), \+ isAlchemist(_), asserta(isAlchemist(true)), 
                                write('What potion do you want to buy?'), nl, writePotion, nl, nl, write('Type "quit" to exit');
                                isAlchemist(_), write('You are already in alchemist menu');
                                write('What are you doing here?').

richPotion                  :-  player(_,_,_,_,_,_,_,_,_,Gold), Gold < 3000, write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 3000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isRich(true)),
                                write('Your Rich Potion is active now!').

speedPotion                 :-  player(_,_,_,_,_,_,_,_,_,Gold), Gold < 3000, write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 3000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isSpeed(true)),
                                write('Your Speed Potion is active now!').

quit                        :-  retract(alchemist(_,_)), retract(isAlchemist(_)), write('Alchemist has gone').