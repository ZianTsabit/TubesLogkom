/*** FAKTA DAN RULES WAKTU ***/

/* clock(Jam,Menit) */
:- dynamic(clock/1).


/* show clock */
showClock :-        clock(X), Jam is X // 60, Menit is X mod 60,
                    ((Jam > 9) -> write(Jam) ; write('0'),write(Jam)),
                    write(':'), 
                    ((Menit > 9) -> write(Menit) ; write('0'),write(Menit)), !.

clockRules :-       clock(X), X > 1439, 
                    retract(day(Y)),NewY is Y+1,asserta(day(NewY)),
                    retract(clock(X)),NewX is X-1440,asserta(clock(NewX)), !.

clockAfterSleep :-  retractall(clock),
                    asserta(clock(360)).

clockAfterMove :-   retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules.

/* belum ditentuin waktunya mau berapa lama */
clockAfterFishing :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules.

clockAfterFarming :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules.

clockAfterRanching :-retract(clock(X)), NewX is X+5,
                    asserta(clock(NewX)), clockRules.