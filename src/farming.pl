


dig :- \+isStarted(_), write('You have to start your game first!'),!.
dig :- player(X,Y), \+canDig(X,Y),
        write('You can not dig right here !'),!.

dig :- player(X,Y),canDig(X,Y),
       asserta(digged(X,Y)),
       write('You digged the tile.'),
       w,!.        


/*
c = chili
p = paddy
t = tomato
n = pineapple
s = strawberry
*/

plant :- \+isStarted(_), write('You have to start your game first!'),!.
plant :- player(X,Y), Y1 is Y-1,
         digged(X,Y1),

harvest :- \+isStarted(_), write('You have to start your game first!'),!.
harvest :- 



















