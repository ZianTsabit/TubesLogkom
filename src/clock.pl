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
                    retract(clock(X)),NewX is X-1440,asserta(clock(NewX)), 
                    ((NewY mod 15 =:= 0 -> asserta(alchemist(1,1)), write('Good news!'), nl, write('Alchemist is here'), nl, nl, !);
                    (alchemist(A,B), NewY mod 15 =\= 0 -> retract(alchemist(A,B)), write('Alchemist has gone'), nl, nl, !); !).

punishTired :-     clock(Y), Y < 360,
                    write('player : "... What is happening to me?"'),nl,nl,
                    write('you are fainted, try not to push yourself to hard!'),
                    retract(player(_,_)),retract(clock(_)), asserta(player(4,10)), asserta(clock(600)), !. 


clockAfterSleep :-  retract(clock(X)),
                    X =< 1320 -> asserta(clock(1800)), clockRules;
                    asserta(clock(1920)), clockRules.

clockAfterMove :-   retract(clock(X)), NewX is X+5,
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