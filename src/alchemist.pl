:- dynamic(isAlchemist/1).
:- dynamic(isRich/1).
:- dynamic(isSpeed/1).

writeSleep                  :-  write('      ______________________'), nl,
                                write('     /            ___      /'), nl,
                                write('    /       ___     /     / '), nl,
                                write('   /  ___     /    /__   /  '), nl,
                                write('  /     /    /__        /   '), nl,
                                write(' /     /__             /    '), nl,
                                write('/_____________________/     ').
                                

writePotion                 :-  (\+ isRich(_), \+ isSpeed(_), write('- Rich Potion (3000 gold)'), nl, write('- Speed Potion (3000 gold)');
                                \+ isRich(_), write('- Rich Potion (3000 gold)');
                                \+ isSpeed(_), write('- Speed Potion (3000 gold)')),
                                nl, write('- Secret Potion (0 gold)').

alchemistMenu               :-  player(X,Y), (X \= 1; Y \= 1), write('You are not in alchemist house');
                                player(X,Y), X = 1, Y = 1, alchemist(_,_), \+ isAlchemist(_), asserta(isAlchemist(true)), 
                                write('What potion do you want to buy?'), nl, writePotion, nl, nl, write('Type "quit" to exit');
                                isAlchemist(_), write('You are already in alchemist menu');
                                write('What are you doing here?').

richPotion                  :-  isAlchemist(_), (\+ isRich(_), (player(_,_,_,_,_,_,_,_,_,Gold), Gold < 3000, 
                                write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 3000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isRich(true)),
                                write('Your Rich Potion is active now!'));
                                write('You already bought this potion'));
                                write('You are not in achemist menu').

speedPotion                 :-  isAlchemist(_), (\+ isSpeed(_), (player(_,_,_,_,_,_,_,_,_,Gold), Gold < 3000, 
                                write('You must work harder to get money');
                                retract(player(A,B,C,D,E,F,G,H,I,Gold)), NewGold is Gold - 3000,
                                asserta(player(A,B,C,D,E,F,G,H,I,NewGold)), asserta(isSpeed(true)),
                                write('Your Speed Potion is active now!'));
                                write('You already bought this potion'));
                                write('You are not in achemist menu').
                            
secretPotion                :-  isAlchemist(_), write('What is happening?'), nl, write('Ugh.....'), nl, nl, writeSleep, nl, nl, 
                                write('You slept for one year!'), nl, nl, retract(alchemist(_,_)), retract(isAlchemist(_)), failState; 
                                write('You are not in achemist menu').

quit                        :-  retract(alchemist(_,_)), retract(isAlchemist(_)), write('Alchemist has gone').