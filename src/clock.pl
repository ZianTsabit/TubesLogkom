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
                    (NewY =:= 90 -> retract(season(_)), asserta(season(summer));
                    NewY =:= 180 -> retract(season(_)), asserta(season(autumn));
                    NewY =:= 270 -> retract(season(_)), asserta(season(winter));
                    NewY =:= 360 -> fail; !), write('Season: '), season(S),
                    (S = spring -> write('Spring');
                    S = summer -> write('Summer');
                    S = autumn -> write('Autumn');
                    write('Winter')),
                    ((NewY mod 17 =:= 0 -> nl, nl, asserta(alchemist(1,1)), write('Good news!'), nl, write('Alchemist is here'));
                    (alchemist(A,B), NewY mod 17 =\= 0 -> nl, nl, retract(alchemist(A,B)), write('Alchemist has gone')); !),
                    (richBoost(_) -> retract(player(C,D,E,F,G,H,I,J,K,Gold)), NewGold is Gold + 40, 
                    asserta(player(C,D,E,F,G,H,I,J,K,NewGold)); !).


punishTired :-     clock(Y), Y < 360,
                    write('player : "... What is happening to me?"'),nl,nl,
                    write('you are fainted, try not to push yourself to hard!'),
                    retract(player(_,_)),retract(clock(_)), asserta(player(4,10)), asserta(clock(600)), !. 


clockAfterSleep :-  retract(clock(X)),
                    X =< 1320 -> asserta(clock(1800)), clockRules;
                    asserta(clock(1920)), clockRules.

clockAfterMove :-   retract(clock(X)), (\+ speedBoost(_) -> NewX is X+5; NewX is X+2),
                    asserta(clock(NewX)), clockRules, punishTired.

/* belum ditentuin waktunya mau berapa lama */
clockAfterFishing :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules, punishTired.

clockAfterFarming :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules, punishTired.

clockAfterRanching :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules, punishTired.

clockAfterMarket :- retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules, punishTired.