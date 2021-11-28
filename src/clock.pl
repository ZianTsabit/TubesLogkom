/*** FAKTA DAN RULES WAKTU ***/

/* clock(Jam,Menit) */
:- dynamic(clock/1).
:- dynamic(alchemist/2).

/* show clock */
showClock :-        clock(X), Jam is X // 60, Menit is X mod 60,
                    ((Jam > 9) -> write(Jam) ; write('0'),write(Jam)),
                    write(':'), 
                    ((Menit > 9) -> write(Menit) ; write('0'),write(Menit)), !.

clockRules :-       clock(X), X > 1439, 
                    retract(day(Y)),NewY is Y+1,asserta(day(NewY)),
                    write('Day '), write(NewY), nl,
                    retract(clock(X)),NewX is X-1440,asserta(clock(NewX)), 
                    (NewY =:= 91 -> retract(season(_)), asserta(season(summer));
                    NewY =:= 181 -> retract(season(_)), asserta(season(autumn));
                    NewY =:= 271 -> retract(season(_)), asserta(season(winter));
                    !), write('Season: '), season(S),
                    (S = spring -> write('Spring');
                    S = summer -> write('Summer');
                    S = autumn -> write('Autumn');
                    write('Winter')), nl, retract(weather(_)),
                    (season(spring), ((NewY mod 6 =:= 0; NewY mod 11 =:= 0) -> asserta(weather(rainy)); asserta(weather(sunny)));
                    season(summer), ((NewY mod 11 =:= 0; NewY mod 23 =:= 0) -> asserta(weather(rainy)); asserta(weather(sunny)));
                    season(autumn), ((NewY mod 7 =:= 0; NewY mod 13 =:= 0) -> asserta(weather(rainy)); asserta(weather(sunny)));
                    (NewY mod 4 =:= 0; NewY mod 7 =:= 0; NewY mod 11 =:= 0) -> asserta(weather(snowy)); asserta(weather(sunny))),
                    write('Weather: '), weather(W),
                    (W = sunny -> write('Sunny');
                    W = rainy -> write('Rainy');
                    write('Snowy')),
                    ((NewY mod 17 =:= 0 -> nl, nl, asserta(alchemist(1,1)), write('Good news!'), nl, write('Alchemist is here'));
                    (alchemist(A,B), NewY mod 17 =\= 0 -> nl, nl, retract(alchemist(A,B)), write('Alchemist has gone')); !),
                    (richBoost(_) -> retract(player(C,D,E,F,G,H,I,J,K,Gold)), NewGold is Gold + 40, 
                    asserta(player(C,D,E,F,G,H,I,J,K,NewGold)); !),
                    chickenRules, sheepRules, cowRules, horseRules.


punishTired :-     clock(Y), Y < 360,
                    write('player : "... What is happening to me?"'),nl,nl,
                    write('you are fainted, try not to push yourself to hard!'),
                    retract(player(_,_)),retract(clock(_)), asserta(player(4,10)), asserta(clock(600)), !. 


clockAfterSleep :-  retract(clock(X)),
                    X =< 1320 -> asserta(clock(1800)), clockRules;
                    asserta(clock(1920)), checkGoalState, clockRules.

clockAfterMove :-   retract(clock(X)), (\+ speedBoost(_) -> NewX is X+5; NewX is X+2),
                    asserta(clock(NewX)), checkGoalState, clockRules, punishTired.


/* belum ditentuin waktunya mau berapa lama */

clockAfterFishing :-retract(clock(X)), NewX is X+30,
                    asserta(clock(NewX)), checkGoalState, clockRules, punishTired.

clockAfterFarming :-retract(clock(X)), NewX is X+25,
                    asserta(clock(NewX)), checkGoalState, clockRules, punishTired.

clockAfterRanching :-retract(clock(X)), NewX is X+60,
                    asserta(clock(NewX)), checkGoalState, clockRules, punishTired.

clockAfterMarket :- retract(clock(X)), NewX is X+15,
                    asserta(clock(NewX)), checkGoalState, clockRules, punishTired.
