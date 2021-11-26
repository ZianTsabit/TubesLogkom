
:- dynamic(isRanch/1).
:- dynamic(chicken/4).
:- dynamic(sheep/4).
:- dynamic(cow/4).
:- dynamic(horse/4).
:- dynamic(hasil/4).
/* silo(ID,Jumlah) */
:- dynamic(silo/2).

silo(1,0).
silo(2,0).
silo(3,0).
silo(4,0).
hasil(0,0,0,0).

inventoryI(11,chicken_feed,consumable,non,-1,10).

ranch          :- \+ (isRanch(_)), player(X,Y), X =:= 2, Y =:= 9, asserta(isRanch(true)), write('You entered your ranch.').

sumAnimal([], J) :-      J is 0, !.
sumAnimal([_ | T], L) :- sumAnimal(T, L1), L is 1 + L1.

count_chicken(X) :-     findall(Nomor,chicken(Nomor,_,_,_),ListNomor),           
                        sumAnimal(ListNomor,Jumlah),
                        X is Jumlah.

count_sheep(X) :-     findall(Nomor,sheep(Nomor,_,_,_),ListNomor),           
                        sumAnimal(ListNomor,Jumlah),
                        X is Jumlah.

count_cow(X) :-     findall(Nomor,cow(Nomor,_,_,_),ListNomor),           
                        sumAnimal(ListNomor,Jumlah),
                        X is Jumlah.

count_horse(X) :-     findall(Nomor,horse(Nomor,_,_,_),ListNomor),           
                        sumAnimal(ListNomor,Jumlah),
                        X is Jumlah.
showAnimals([],[],[]).

showAnimals([ID|TX],[Nama|TY],[Time|TZ]) :-
                        (Time > 0 -> write(Nama), write(' produce in '), write(Time), write(' days');
                        write(Nama), write(' Ready to collect!')),
                        write('(ID :'), write(ID), write(')'),
                        showAnimals(TX,TY,TZ).


show_chicken :-         isRanch(_),
                        silo(1,Y), write('Chicken Food: '), write(Y),nl,
                        count_chicken(X), write('Total chicken: '), write(X),nl,
                        findall(ID,chicken(ID,_,_,_),ListID),
                        findall(Time, chicken(_,_,_,Time), ListTime),
                        findall(Nama, chicken(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_chicken :-         \+ isRanch(_),
                        write('You are not in ranch').

show_sheep :-           isRanch(_),
                        silo(2,Y), write('Sheep Food: '), write(Y),nl,
                        count_sheep(X), write('Total sheep: '), write(X),nl,
                        findall(ID,sheep(ID,_,_,_),ListID),
                        findall(Time, sheep(_,_,_,Time), ListTime),
                        findall(Nama, sheep(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_sheep :-           \+ isRanch(_),
                        write('You are not in ranch').

show_cow :-             isRanch(_),
                        silo(3,Y), write('Cow Food: '), write(Y),nl,
                        count_cow(X), write('Total cow: '), write(X),nl,
                        findall(ID,cow(ID,_,_,_),ListID),
                        findall(Time, cow(_,_,_,Time), ListTime),
                        findall(Nama, cow(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_cow :-             \+ isRanch(_),
                        write('You are not in ranch').

show_horse :-           isRanch(_),
                        silo(4,Y), write('Horse Food: '), write(Y),nl,
                        count_horse(X), write('Total horse: '), write(X),nl,
                        findall(ID,horse(ID,_,_,_),ListID),
                        findall(Time, horse(_,_,_,Time), ListTime),
                        findall(Nama,horse(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime),!.

show_horse :-           \+ isRanch(_),
                        write('You are not in ranch').

add_chicken :-          chicken(X,_,_,_),
                        write('insert chicken name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(chicken(NewX,Y,true,3)), !.

add_chicken :-       \+ chicken(_,_,_,_),
                        write('insert chicken name (no space or special character allowed): '), read(Y),
                        asserta(chicken(1,Y,true,3)).


add_sheep :-           sheep(X,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(sheep(NewX,Y,true,4)), !.

add_sheep :-         \+ sheep(_,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        asserta(sheep(1,Y,true,4)).


add_cow :-              cow(X,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(cow(NewX,Y,true,5)), !.

add_cow :-           \+ cow(_,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        asserta(cow(1,Y,true,5)).


add_horse :-            horse(X,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(horse(NewX,Y,true,4)), !.

add_horse :-          \+ horse(_,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        asserta(horse(1,Y,true,4)).

decreaseId_chicken(ID) :- NewID is ID+1,chicken(NewID,_,_,_),retract(chicken(NewID,Nama,IsFed,Time)),   
                        asserta(chicken(ID,Nama,IsFed,Time)), decreaseId_chicken(NewID).

decreaseId_chicken(ID) :- NewID is ID+1, \+ chicken(NewID,_,_,_), !.

delete_chicken :-       show_chicken,write('insert ID: '), read_integer(ID),
                        chicken(ID,_,_,_) -> retract(chicken(ID,_,_,_)), decreaseId_chicken(ID),!.

decreaseId_sheep(ID) :- NewID is ID+1,sheep(NewID,_,_,_),retract(sheep(NewID,Nama,IsFed,Time)),   
                        asserta(sheep(ID,Nama,IsFed,Time)), decreaseId_sheep(NewID).

decreaseId_sheep(ID) :- NewID is ID+1, \+ sheep(NewID,_,_,_), !.

delete_sheep :-       show_sheep,write('insert ID: '), read_integer(ID),
                        sheep(ID,_,_,_) -> retract(sheep(ID,_,_,_)), decreaseId_sheep(ID),!.

decreaseId_cow(ID) :- NewID is ID+1,cow(NewID,_,_,_),retract(cow(NewID,Nama,IsFed,Time)),   
                        asserta(cow(ID,Nama,IsFed,Time)), decreaseId_cow(NewID).

decreaseId_cow(ID) :- NewID is ID+1, \+ cow(NewID,_,_,_), !.

delete_cow :-       show_cow,write('insert ID: '), read_integer(ID),
                        cow(ID,_,_,_) -> retract(cow(ID,_,_,_)), decreaseId_cow(ID),!.

decreaseId_horse(ID) :- NewID is ID+1,horse(NewID,_,_,_),retract(horse(NewID,Nama,IsFed,Time)),   
                        asserta(horse(ID,Nama,IsFed,Time)), decreaseId_horse(NewID).

decreaseId_horse(ID) :- NewID is ID+1, \+ horse(NewID,_,_,_), !.

delete_horse :-       show_horse,write('insert ID: '), read_integer(ID),
                        horse(ID,_,_,_) -> retract(horse(ID,_,_,_)), decreaseId_horse(ID),!.

/* aturan ganti hari */

chickenRules :-                 silo(1,X),X > 0,chicken(ID1,_,_,_) -> checkProductionChicken(ID1), !;
                                true, !.

sheepRules :-                   silo(2,X),X > 0,sheep(ID1,_,_,_) -> checkProductionSheep(ID1), !;
                                true, !.

cowRules :-                     silo(3,X),X > 0,cow(ID1,_,_,_) -> checkProductionCow(ID1), !;
                                true, !.

horseRules :-                   silo(4,X),X > 0,horse(ID1,_,_,_) -> checkProductionHorse(ID1), !;
                                true, !.

checkProductionChicken(ID) :-   (chicken(ID,Nama,_,Time), Time > 1) -> retract(chicken(ID,Nama,_,Time)), NewTime is Time-1, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   (chicken(ID,Nama,_,Time), Time =:= 1) -> retract(chicken(ID,Nama,_,Time)), NewTime is 2, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   \+ chicken(ID,_,_,_), !, true.

checkProductionSheep(ID) :-     (sheep(ID,Nama,_,Time), Time > 0) -> retract(sheep(ID,Nama,_,Time)), NewTime is Time-1, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     (sheep(ID,Nama,_,Time), Time =:= 0) -> retract(sheep(ID,Nama,_,Time)), NewTime is Time, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     \+ sheep(ID,_,_,_), !,true.

checkProductionCow(ID) :-       (cow(ID,Nama,_,Time), Time > 0) -> retract(cow(ID,Nama,_,Time)), NewTime is Time-1, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       (cow(ID,Nama,_,Time), Time =:= 0) -> retract(cow(ID,Nama,_,Time)), NewTime is Time, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       \+ cow(ID,_,_,_), true.

checkProductionHorse(ID) :-     (horse(ID,Nama,_,Time), Time > 0) -> retract(horse(ID,Nama,_,Time)), NewTime is Time-1, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     (horse(ID,Nama,_,Time), Time =:= 0) -> retract(horse(ID,Nama,_,Time)), NewTime is Time, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     \+ horse(ID,_,_,_), true.

/* isi silo */

fill_silo :-                    isRanch(_),
                                write('Choose one of the option: '),nl,
                                write('1. Fill chicken food'),nl,
                                write('2. Fill sheep food'),nl,
                                write('3, Fill cow food'),nl,
                                write('4. Fill horse food'),nl,
                                write('Input choice : '), read_integer(X),nl,
                                (X =:= 1 -> ItemID is 11, fill_food(X, ItemID);
                                 X =:= 2 -> ItemID is 12, fill_food(X, ItemID);
                                 X =:= 3 -> ItemID is 13, fill_food(X, ItemID);
                                 X =:= 4 -> ItemID is 14, fill_food(X, ItemID);
                                 write('Invalid choice!'), !, fail), !.

fill_silo :-                    \+ isRanch(_),
                                write('you are not in ranch.'), !.
                                
fill_food(X, ItemID) :-         write('How many food do you want to fill?'),nl,
                                write('Input amount : '), read_integer(Y),nl,
                                inventoryI(ItemID,_,_,_,_,Jumlah) ->
                                (Jumlah >= Y -> deleteConsumable(ItemID,Y), retract(silo(X,JumlahAwal)), NewJumlah is JumlahAwal+Y, asserta(silo(X,NewJumlah)), write('Congrats! You have filled the silo!');
                                write('invalid amount!')), !;
                                write('you dont have that kind of food!'), !.


collect :-                      isRanch(_),
                                write('Which one you want to collect?'),
                                write('1. Cow milk'),
                                write('2. Sheep wool'),
                                write('3. horse milk'),
                                write('Input choice: '), read_integer(X),
                                (X =:= 1 -> collect_milk,
                                 X =:= 2 -> collect_wool,
                                 X =:= 3 -> collect_horsemilk
                                ).

collect :-                      \+ (isRanch(_)),
                                write('you are not in ranch.'), !.

                                
collect_milk :-                 inventoryI(4,_,item,_,_,_) ->
                                (cow(X,_,_,Time) -> 
                                ( Time =:= 0 ->retract(hasil(A,B,C,D)), NewC is C+1,asserta(hasil(A,B,NewC,D)), retract(cow(X,_,_,Time)), NewTime is 5,assertz(cow(X,_,_,NewTime));
                                  retract(cow(X,_,_,Time)), NewTime is Time,assertz(cow(X,_,_,NewTime)));
                                write('You do not have a cow.'));
                                write('You do not have a milking equipment!').

collect_wool :-                 inventoryI(5,_,item,_,_,_) ->
                                (sheep(X,_,_,Time) -> 
                                ( Time =:= 0 -> retract(hasil(A,B,C,D)), NewB is B+1,asserta(hasil(A,NewB,C,D)),addConsumable(19,1) ,retract(sheep(X,_,_,Time)), NewTime is 4,assertz(sheep(X,_,_,NewTime));
                                  retract(sheep(X,_,_,Time)), NewTime is Time,assertz(sheep(X,_,_,NewTime)));
                                write('You do not have a sheep.'));
                                write('You do not have a scissor!').

collect_horsemilk :-            inventoryI(4,_,item,_,_,_) ->
                                (horse(X,_,_,Time) -> 
                                ( Time =:= 0 -> retract(hasil(A,B,C,D)), NewD is D+1,asserta(hasil(A,B,C,NewD)),retract(horse(X,_,_,Time)), NewTime is 4,assertz(horse(X,_,_,NewTime));
                                  retract(horse(X,_,_,Time)), NewTime is Time,assertz(horse(X,_,_,NewTime)));
                                write('You do not have a horse.'));
                                write('You do not have milking equipment.').