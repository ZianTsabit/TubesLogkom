/* map.pl */

/* Definisi Wall */
wall(X, Y) :-           (Y =:= 16, (X >= 0, X =< 16));
                        (X =:= 16, (Y >= 0, Y =< 16));
                        (Y =:= 0, (X >= 0, X =< 16));
                        (X =:= 0, (Y >= 0, Y =< 16)).

/* Fact yang digunakan */
:- dynamic(player/2).
:- dynamic(chili/2).
:- dynamic(paddy/2).
:- dynamic(tomato/2).
:- dynamic(pineapple/2).
:- dynamic(strawberry/2).
:- dynamic(house/2).
:- dynamic(ranch/2).
:- dynamic(quest/2).
:- dynamic(marketplace/2).
:- dynamic(digged/2).

/* Isi map */
createMap :-            asserta(player(4,10)),
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

/* tampilin map */

map :-                  isStarted(_) -> 
                        (map(0, 16), nl, showClock, write(' Day '), day(X), write(X), nl); 
                        (write('You have not start your game!'), nl, write('Use start command to play!'),nl).

map(X, Y) :-            (wall(X, Y) -> write('#');
                        player(X, Y) -> write('P');
                        house(X, Y) -> write('H');
                        ranch(X, Y) -> write('R');
                        quest(X,Y) -> write('Q');
                        marketplace(X, Y) -> write('M');
                        digged(X,Y) -> write('=');
                        water(X,Y) -> write('o');
                        alchemist(X,Y) -> write('A');
                        chili(X,Y) -> write('c');
                        paddy(X,Y) -> write('v');
                        tomato(X,Y) -> write('t');
                        pineapple(X,Y) -> write('n');
                        strawberry(X,Y) -> write('s');
                        write('-')), X2 is X + 1, 
                        (X = 16, Y = 0 -> nl;
                        X = 16 -> nl, X1 = 0, Y1 is Y - 1, map(X1, Y1);
                        map(X2, Y)).

/* Rules move */
move(BeforeX, BeforeY, AfterX, AfterY) :-   wall(AfterX, AfterY) -> write('Oops! The wall is too huge!'),
                                            retract(player(AfterX,AfterY)), asserta(player(BeforeX, BeforeY)), nl, !;
                                            water(AfterX, AfterY) -> write('you can not walk on the water, fellas!'), nl, !,
                                            retract(player(AfterX,AfterY)), asserta(player(BeforeX, BeforeY));
                                            clockAfterMove;
                                            (house(AfterX,AfterY) -> write('You are in your house!');
                                            ranch(AfterX,AfterY) -> write('You are in your ranch!');
                                            marketplace(AfterX,AfterY) -> write('You are in marketplace!');
                                            digged(AfterX,AfterY) -> write('You are standing on digged tile!');
                                            alchemist(AfterX,AfterY) -> write('You are in alchemist house!')).
                                            
w :-                    \+ (isMarketplace(_)), \+ (isHouse(_)), \+ (isAlchemist(_)) ->
                        retract(player(BeforeX, BeforeY)),
                        AfterY is BeforeY + 1, 
                        asserta(player(BeforeX, AfterY)),
                        move(BeforeX,BeforeY,BeforeX, AfterY),!.

a :-                    \+ (isMarketplace(_)), \+ (isHouse(_)), \+ (isAlchemist(_)) ->
                        retract(player(BeforeX, BeforeY)),
                        AfterX is BeforeX - 1, 
                        asserta(player(AfterX, BeforeY)),
                        move(BeforeX,BeforeY,AfterX, BeforeY),!.

s :-                    \+ (isMarketplace(_)), \+ (isHouse(_)), \+ (isAlchemist(_)) ->
                        retract(player(BeforeX, BeforeY)),
                        AfterY is BeforeY - 1, 
                        asserta(player(BeforeX, AfterY)),
                        move(BeforeX,BeforeY,BeforeX, AfterY),!.

d :-                    \+ (isMarketplace(_)), \+ (isHouse(_)), \+ (isAlchemist(_)) ->
                        retract(player(BeforeX, BeforeY)),
                        AfterX is BeforeX + 1, 
                        asserta(player(AfterX, BeforeY)),
                        move(BeforeX,BeforeY,AfterX, BeforeY),!.

/* RULES TEMPAT MANCING DAN FARMING */
canDig(X,Y)             :- \+ wall(X,Y),\+ water(X,Y),\+ house(X,Y),\+ marketplace(X,Y),\+ quest(X,Y),\+ ranch(X,Y),\+ digged(X,Y).

canFish(X,Y)            :- water(A,B),(((Y =:= B),((A =:= X-1);(A =:= X+1)));((X =:= A),((B =:= Y-1);(A =:= Y+1)))).

