
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
                        write(Nama), write(' produce in '), write(Time), write(' days (ID: '),write(ID),write(')'),nl,
                        showAnimals(TX,TY,TZ).

show_chicken :-         isRanch(_),
                        count_chicken(X), write('Total ayam: '), write(X),nl,
                        findall(ID,chicken(ID,_,_,_),ListID),
                        findall(Time, chicken(_,_,_,Time), ListTime),
                        findall(Nama, chicken(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_chicken :-         \+ isRanch(_),
                        write('You are not in ranch').

show_sheep :-           isRanch(_),
                        count_sheep(X), write('Total domba: '), write(X),nl,
                        findall(ID,sheep(ID,_,_,_),ListID),
                        findall(Time, sheep(_,_,_,Time), ListTime),
                        findall(Nama, sheep(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_sheep :-           \+ isRanch(_),
                        write('You are not in ranch').

show_cow :-             isRanch(_),
                        count_cow(X), write('Total cow: '), write(X),nl,
                        findall(ID,cow(ID,_,_,_),ListID),
                        findall(Time, cow(_,_,_,Time), ListTime),
                        findall(Nama, cow(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime), !.

show_cow :-             \+ isRanch(_),
                        write('You are not in ranch').

show_horse :-           isRanch(_),
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
                        asserta(chicken(NewX,Y,true,2)), !.

add_chicken :-       \+ chicken(_,_,_,_),
                        write('insert chicken name (no space or special character allowed): '), read(Y),
                        asserta(chicken(1,Y,true,2)).


add_sheep :-           sheep(X,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(sheep(NewX,Y,true,2)), !.

add_sheep :-         \+ sheep(_,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        asserta(sheep(1,Y,true,2)).


add_cow :-              cow(X,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(cow(NewX,Y,true,2)), !.

add_cow :-           \+ cow(_,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        asserta(cow(1,Y,true,2)).


add_horse :-            horse(X,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(horse(NewX,Y,true,2)), !.

add_horse :-          \+ horse(_,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        asserta(horse(1,Y,true,2)).

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

animalsRules :-         chicken(ID1,_,_,_) -> checkProductionChicken(ID1), !;
                        sheep(ID2,_,_,_) -> checkProductionSheep(ID2), !; 
                        cow(ID3,_,_,_) -> checkProductionCow(ID3), !; 
                        horse(ID4,_,_,_) -> checkProductionHorse(ID4), !.       

checkProductionChicken(ID) :-   chicken(ID,Nama,IsFed,Time), IsFed == false -> retract(chicken(ID,Nama,IsFed,Time)), NewTime is Time, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   chicken(ID,Nama,IsFed,Time), IsFed == true -> retract(chicken(ID,Nama,IsFed,Time)), NewTime is Time-1, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   \+ chicken(ID,_,_,_), true.

checkProductionSheep(ID) :-     sheep(ID,Nama,IsFed,Time), IsFed == false -> retract(sheep(ID,Nama,IsFed,Time)), NewTime is Time, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     sheep(ID,Nama,IsFed,Time), IsFed == true -> retract(sheep(ID,Nama,IsFed,Time)), NewTime is Time-1, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     \+ sheep(ID,_,_,_), true.

checkProductionCow(ID) :-       cow(ID,Nama,IsFed,Time), IsFed == false -> retract(cow(ID,Nama,IsFed,Time)), NewTime is Time, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       cow(ID,Nama,IsFed,Time), IsFed == true -> retract(cow(ID,Nama,IsFed,Time)), NewTime is Time-1, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       \+ cow(ID,_,_,_), true.

checkProductionHorse(ID) :-     horse(ID,Nama,IsFed,Time), IsFed == false -> retract(horse(ID,Nama,IsFed,Time)), NewTime is Time, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     horse(ID,Nama,IsFed,Time), IsFed == true -> retract(horse(ID,Nama,IsFed,Time)), NewTime is Time-1, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

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
          

