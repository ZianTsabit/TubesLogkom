


dig :- \+isStarted(_), write('You have to start your game first!'),!.
dig :- player(X,Y), \+canDig(X,Y),
        write('You can not dig right here !'),!.
dig :- player(X,Y),canDig(X,Y),
       w,
       write(X),write(', '),write(Y),nl,
       asserta(digged(X,Y)),!.
