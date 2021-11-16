/* map.pl */

/* creating coordinate */

:- dynamic(coordinate/2).
:- dynamic(horizontal/1).
:- dynamic(vertical/1).

generate(X,Y) :-        (X = 0, Y = 0 -> asserta(coordinate(0, 0));
                        X = 0 -> asserta(coordinate(0,Y)), NewY is Y - 1, generate(X, NewY);
                        Y = 0 -> asserta(coordinate(X,Y)), NewY = 16, NewX is X - 1, generate(NewX, NewY);
		                asserta(coordinate(X, Y)), NewY is Y - 1, generate(X, NewY)).


isWall(X, Y) :-         Y =:= 16, coordinate(X, Y).
isWall(X, Y) :-         X =:= 0, coordinate(X, Y).
isWall(X, Y) :-         X =:= 16, coordinate(X, Y).
isWall(X, Y) :-         Y =:= 0, coordinate(X, Y).



createMap :-            generate(16,16),
                        asserta(player(4,10)),
                        asserta(house(4,10)),
                        asserta(ranch(2,9)),
                        asserta(quest(12,8)),
                        asserta(marketplace(12,12)),
                        createPond, createRiver.

createPond :-           asserta(water(4,4)),asserta(water(5,4)),
                        asserta(water(3,5)),asserta(water(4,5)),asserta(water(5,5)),asserta(water(6,5)),
                        asserta(water(4,6)),asserta(water(5,6)).

createRiver :-          asserta(water(15,5)),
                        asserta(water(15,4)),asserta(water(14,4)),asserta(water(13,4)),
                        asserta(water(15,3)),asserta(water(14,3)),asserta(water(13,3)),asserta(water(12,3)),
                        asserta(water(15,2)),asserta(water(14,2)),asserta(water(13,2)),asserta(water(12,2)),asserta(water(11,2)),
                        asserta(water(15,1)),asserta(water(14,1)),asserta(water(13,1)),asserta(water(12,1)),asserta(water(11,1)),asserta(water(10,1)).

map(X, Y) :-          (isWall(X, Y) -> write('#');
                        player(X, Y) -> write('P');
                        house(X, Y) -> write('H');
                        ranch(X, Y) -> write('R');
                        quest(X,Y) -> write('Q');
                        marketplace(X, Y) -> write('M');
                        water(X,Y) -> write('o');
                        write('-')), X2 is X + 1, 
                        (X = 16, Y = 0 -> nl;
                        X = 16 -> nl, X1 = 0, Y1 is Y - 1, map(X1, Y1);
                        map(X2, Y)).