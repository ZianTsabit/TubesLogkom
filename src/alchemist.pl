:- dynamic(isAlchemist/1).
:- dynamic(isRich/1).
:- dynamic(isSpeed/1).
:- dynamic(richBoost/1).
:- dynamic(speedBoost/1).

writeSleep                  :-  write('      ______________________'), nl,
                                write('     /            ___      /'), nl,
                                write('    /       ___     /     / '), nl,
                                write('   /  ___     /    /__   /  '), nl,
                                write('  /     /    /__        /   '), nl,
                                write(' /     /__             /    '), nl,
                                write('/_____________________/     ').
                                

writePotion                 :-  (\+ isRich(_), \+ isSpeed(_), write('- Rich Potion (5000 gold)'), nl, write('- Speed Potion (7000 gold)'), nl;
                                \+ isRich(_), write('- Rich Potion (5000 gold)'), nl;
                                \+ isSpeed(_), write('- Speed Potion (7000 gold)'), nl; !),
                                write('- Secret Potion (? gold)').

alchemistMenu               :-  player(X,Y), (X \= 1; Y \= 1), write('You are not in alchemist house');
                                player(X,Y), X = 1, Y = 1, alchemist(_,_), \+ isAlchemist(_), asserta(isAlchemist(true)), 
                                write('What potion do you want to buy?'), nl, writePotion, nl, nl, write('Type "quit" to exit');
                                isAlchemist(_), write('You are already in alchemist menu');
                                write('What are you doing here?').

richPotion                  :-  isAlchemist(_), (\+ isRich(_), (player(_,_,_,_,_,_,_,_,_,Gold), Gold < 5000, 
                                write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 5000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isRich(true)), asserta(richBoost(true)),
                                write('Your Rich Potion is active now!'), nl, write('You will get 40 gold everyday'));
                                write('You already bought this potion'));
                                write('You are not in achemist menu').

speedPotion                 :-  isAlchemist(_), (\+ isSpeed(_), (player(_,_,_,_,_,_,_,_,_,Gold), Gold < 7000, 
                                write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 7000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isSpeed(true)), asserta(speedBoost(true)),
                                write('Your Speed Potion is active now!'), nl, write('You move faster than before'));
                                write('You already bought this potion'));
                                write('You are not in achemist menu').
                            
secretPotion                :-  isAlchemist(_), write('What is happening?'), nl, write('Ugh.....'), nl, nl, writeSleep, nl, nl, 
                                write('You slept for one year!'), nl, nl, retract(alchemist(_,_)), retract(isAlchemist(_)), failState; 
                                write('You are not in achemist menu').

quit                        :-  retract(alchemist(_,_)), retract(isAlchemist(_)), write('Alchemist has gone').