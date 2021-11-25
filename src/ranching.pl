
:- dynamic(isRanch/1).
:- dynamic(chicken/4).
:- dynamic(sheep/4).
:- dynamic(cow/4).
:- dynamic(horse/4).
:- dynamic(hasil/4).

enterRanch          :- \+ (isRanch(_)), player(X,Y), X =:= 2, Y =:= 9, asserta(isRanch(true)).

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

show_chicken :-         count_chicken(X), write('Total ayam: '), write(X),nl,
                        findall(ID,chicken(ID,_,_,_),ListID),
                        findall(Time, chicken(_,_,_,Time), ListTime),
                        findall(Nama, chicken(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime).

show_sheep :-           count_sheep(X), write('Total domba: '), write(X),nl,
                        findall(ID,sheep(ID,_,_,_),ListID),
                        findall(Time, sheep(_,_,_,Time), ListTime),
                        findall(Nama, sheep(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime).

show_cow :-             count_cow(X), write('Total cow: '), write(X),nl,
                        findall(ID,cow(ID,_,_,_),ListID),
                        findall(Time, cow(_,_,_,Time), ListTime),
                        findall(Nama, cow(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime).

show_horse :-           count_horse(X), write('Total horse: '), write(X),nl,
                        findall(ID,horse(ID,_,_,_),ListID),
                        findall(Time, horse(_,_,_,Time), ListTime),
                        findall(Nama,horse(_,Nama,_,_), ListNama),
                        showAnimals(ListID,ListNama,ListTime).

add_chicken :-          chicken(X,_,_,_),
                        write('insert chicken name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(chicken(NewX,Y,0,2)), !.

add_chicken :-       \+ chicken(_,_,_,_),
                        write('insert chicken name (no space or special character allowed): '), read(Y),
                        asserta(chicken(1,Y,0,2)).


add_sheep :-           sheep(X,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(sheep(NewX,Y,0,2)), !.

add_sheep :-         \+ sheep(_,_,_,_),
                        write('insert sheep name (no space or special character allowed): '), read(Y),
                        asserta(sheep(1,Y,0,2)).


add_cow :-              cow(X,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(cow(NewX,Y,0,2)), !.

add_cow :-           \+ cow(_,_,_,_),
                        write('insert cow name (no space or special character allowed): '), read(Y),
                        asserta(cow(1,Y,0,2)).


add_horse :-            horse(X,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        NewX is X + 1,
                        asserta(horse(NewX,Y,0,2)), !.

add_horse :-          \+ horse(_,_,_,_),
                        write('insert horse name (no space or special character allowed): '), read(Y),
                        asserta(horse(1,Y,0,2)).

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