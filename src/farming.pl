


dig :- \+isStarted(_), write('You have to start your game first!'),!.
dig :- player(X,Y), \+canDig(X,Y),
       write('You can not dig right here !'),!.

dig :- player(X,Y),canDig(X,Y),
       ((cekItemExist(7, level3_shovel),
                X1 is X + 1,
                X2 is X - 1, 
                asserta(digged(X,Y)),
                asserta(digged(X1,Y)),
                asserta(digged(X2,Y)));
       (\+cekItemExist(7, level3_shovel),
                ((cekItemExist(6, level2_shovel),
                X1 is X + 1, 
                asserta(digged(X,Y)),
                asserta(digged(X1,Y)));
                (\+cekItemExist(6, level2_shovel), 
                asserta(digged(X,Y)))
                ))
        ),
       write('You digged the tile.'),
       w,!.        


/*
c = chili
v = paddy
t = tomato
n = pineapple
s = strawberry
*/

plant :- \+isStarted(_), write('You have to start your game first!'),!.
plant :- player(X,Y), 
         Y1 is Y-1,
         \+digged(X,Y1),
         write('You can not plant here!'),!.
plant :- player(X,Y), 
         Y1 is Y-1,
         digged(X,Y1),
         write('You have : '),nl,
         listConsumable,
         write('What do you want to plant?'),!.

plant_chili :- \+isStarted(_), write('You have to start your game first!'),!.
plant_chili :- \+cekConsumableExist(6, chili_seed),
                write('You do not have chili seeds'),!.
plant_chili :-  player(X,Y),
                Y1 is Y - 1,
                cekConsumableExist(6, chili_seed),
                retract(digged(X,Y1)),
                asserta(chili(X,Y1)),!.
                



harvest :- \+isStarted(_), write('You have to start your game first!'),!.




















