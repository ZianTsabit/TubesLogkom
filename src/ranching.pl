
:- dynamic(isRanch/1).
:- dynamic(chicken/4).
:- dynamic(sheep/4).
:- dynamic(cow/4).
:- dynamic(horse/4).
:- dynamic(hasil/4).
:- dynamic(silo/2).

silo(1,0).
silo(2,0).
silo(3,0).
silo(4,0).
hasil(0,0,0,0).

enterRanch          :- \+ (isRanch(_)), player(X,Y), X =:= 2, Y =:= 9, asserta(isRanch(true)), write('You entered your ranch.').

help_ranching          :- write('======================== Ranching Guide ====================='),nl,
                       write('Steps:'),nl,
                       write('1. Buy any animals and animals food at marketplace'),nl,
                       write('2. Fill the silo with animals food'),nl,
                       write('3. Wait until the next day, your animals will eat the food and start producing'),nl,
                       write('4. Do not forget to fill the silo, your animals cannot produce anything if they hungry!'),nl,
                       write('5. For chicken, eggs will be stored in the morning'),nl,
                       write('6. For other animals, you need to collect it first with a specified equipment.'),nl,
                       write('6. to withdraw the product, check the ranch storage.'),nl,
                       write('7. you gain exp whenever you collect product from your animals'),nl,
                       write('8. last but not least, Happy Ranching!!!'),nl,nl,
                       write('======================== List of Command ===================='),nl,
                       write('ranch : enter your ranch, you need to stand on your ranch.'),nl,
                       write('chicken_info : to show your chicken and chicken food.'),nl,
                       write('sheep_info : to show your sheep and sheep food.'),nl,
                       write('cow_info : to show your cow and cow food.'),nl,
                       write('horse_info : to show your horse and horse food.'),nl,
                       write('collect : to collect product from cow, sheep, and horse.'),nl,
                       write('storage : to show and withdraw animals product.'),!.


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
                        write('(ID :'), write(ID), write(')'),nl,
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
                        chicken(ID,_,_,_) -> retract(chicken(ID,_,_,_)), decreaseId_chicken(ID),!;
                        write('invalid ID!'), fail, !.

decreaseId_sheep(ID) :- NewID is ID+1,sheep(NewID,_,_,_),retract(sheep(NewID,Nama,IsFed,Time)),   
                        asserta(sheep(ID,Nama,IsFed,Time)), decreaseId_sheep(NewID).

decreaseId_sheep(ID) :- NewID is ID+1, \+ sheep(NewID,_,_,_), !.

delete_sheep :-       show_sheep,write('insert ID: '), read_integer(ID),
                        sheep(ID,_,_,_) -> retract(sheep(ID,_,_,_)), decreaseId_sheep(ID),!;
                        write('invalid ID!'), fail, !.

decreaseId_cow(ID) :- NewID is ID+1,cow(NewID,_,_,_),retract(cow(NewID,Nama,IsFed,Time)),   
                        asserta(cow(ID,Nama,IsFed,Time)), decreaseId_cow(NewID).

decreaseId_cow(ID) :- NewID is ID+1, \+ cow(NewID,_,_,_), !.

delete_cow :-          show_cow,write('insert ID: '), read_integer(ID),
                        cow(ID,_,_,_) -> retract(cow(ID,_,_,_)), decreaseId_cow(ID),!;
                        write('invalid ID!'), fail, !.

decreaseId_horse(ID) :- NewID is ID+1,horse(NewID,_,_,_),retract(horse(NewID,Nama,IsFed,Time)),   
                        asserta(horse(ID,Nama,IsFed,Time)), decreaseId_horse(NewID).

decreaseId_horse(ID) :- NewID is ID+1, \+ horse(NewID,_,_,_), !.

delete_horse :-       show_horse,write('insert ID: '), read_integer(ID),
                        horse(ID,_,_,_) -> retract(horse(ID,_,_,_)), decreaseId_horse(ID),!;
                        write('invalid ID!'), fail, !.

/* aturan ganti hari */

chickenRules :-                 silo(1,X),X > 0,chicken(ID1,_,_,_) ->hasil(Telur,_,_,_), checkProductionChicken(ID1),hasil(Telur2,_,_,_), (Telur2 > Telur -> questAddRanch;true), !;
                                true, !.

sheepRules :-                   silo(2,X),X > 0,sheep(ID1,_,_,_) -> checkProductionSheep(ID1), !;
                                true, !.

cowRules :-                     silo(3,X),X > 0,cow(ID1,_,_,_) -> checkProductionCow(ID1), !;
                                true, !.

horseRules :-                   silo(4,X),X > 0,horse(ID1,_,_,_) -> checkProductionHorse(ID1), !;
                                true, !.

decreaseSilo(X) :-              retract(silo(X,J)), NewJ is J-1, asserta(silo(X,NewJ)).

checkProductionChicken(ID) :-   chicken(ID,Nama,_,Time), Time > 1, silo(1,Isi), Isi > 0 -> decreaseSilo(1),retract(chicken(ID,Nama,_,Time)), NewTime is Time-1, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   chicken(ID,Nama,_,Time), Time =:= 1, silo(1,Isi), Isi > 0 -> (player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,10); expAfter(ranch,5)),decreaseSilo(1),retract(chicken(ID,Nama,_,Time)), NewTime is 3, assertz(chicken(ID,Nama,false,NewTime)), retract(hasil(A,B,C,D)), NewA is A+1, asserta(hasil(NewA,B,C,D)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   chicken(ID,Nama,_,Time), silo(1,Isi), Isi =< 0 -> retract(chicken(ID,Nama,_,Time)), NewTime is Time, assertz(chicken(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionChicken(NewID).

checkProductionChicken(ID) :-   \+ chicken(ID,_,_,_), !.


checkProductionSheep(ID) :-     (sheep(ID,Nama,_,Time), Time > 0, silo(2,Isi), Isi > 0) -> decreaseSilo(2),retract(sheep(ID,Nama,_,Time)), NewTime is Time-1, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     (sheep(ID,Nama,_,Time), Time =:= 0, silo(2,Isi), Isi > 0) -> retract(sheep(ID,Nama,_,Time)), NewTime is Time, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     (sheep(ID,Nama,_,Time), silo(2,Isi), Isi =< 0) -> retract(sheep(ID,Nama,_,Time)), NewTime is Time, assertz(sheep(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionSheep(NewID).

checkProductionSheep(ID) :-     \+ sheep(ID,_,_,_), !,true.

checkProductionCow(ID) :-       (cow(ID,Nama,_,Time), Time > 0, silo(3,Isi), Isi > 0) -> decreaseSilo(3),retract(cow(ID,Nama,_,Time)), NewTime is Time-1, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       (cow(ID,Nama,_,Time), Time =:= 0, silo(3,Isi), Isi > 0) -> retract(cow(ID,Nama,_,Time)), NewTime is Time, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       (cow(ID,Nama,_,Time), silo(3,Isi), Isi =< 0) -> retract(cow(ID,Nama,_,Time)), NewTime is Time, assertz(cow(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionCow(NewID).

checkProductionCow(ID) :-       \+ cow(ID,_,_,_), !,true.

checkProductionHorse(ID) :-     (horse(ID,Nama,_,Time), Time > 0, silo(4,Isi), Isi > 0) -> decreaseSilo(4),retract(horse(ID,Nama,_,Time)), NewTime is Time-1, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     (horse(ID,Nama,_,Time), Time =:= 0, silo(4,Isi), Isi > 0) -> retract(horse(ID,Nama,_,Time)), NewTime is Time, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     (horse(ID,Nama,_,Time), silo(4,Isi), Isi =< 0) -> retract(horse(ID,Nama,_,Time)), NewTime is Time, assertz(horse(ID,Nama,false,NewTime)), NewID is ID-1, checkProductionHorse(NewID).

checkProductionHorse(ID) :-     \+ horse(ID,_,_,_),!, true.

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

/* collect to storage */
collectRanch :-                 isRanch(_),
                                write('Which one you want to collect?'),nl,
                                write('1. Cow milk'),nl,
                                write('2. Sheep wool'),nl,
                                write('3. horse milk'),nl,
                                write('Input choice: '), read_integer(X),
                                (X =:= 1 -> hasil(_,_,Milk,_),collect_milk, hasil(_,_,Milk2,_),Milk2 > Milk -> questAddRanch, !;
                                 X =:= 2 -> hasil(_,Wool,_,_),collect_wool, hasil(_,Wool2,_,_),Wool2 > Wool -> questAddRanch,!;
                                 X =:= 3 -> hasil(_,_,HMilk),collect_horsemilk, hasil(_,_,_,HMilk2),HMilk2 > HMilk -> questAddRanch,!;
                                 write('invalid input!')
                                ).
                                

collectRanch :-                 \+ (isRanch(_)),
                                write('you are not in ranch.'), !.

                                
collect_milk :-                 inventoryI(4,_,item,_,_,_) ->
                                (cow(ID,_,_,Time) -> 
                                ( Time =:= 0 ->(player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,20); expAfter(ranch,10)),retract(hasil(A,B,C,D)), NewC is C+1,asserta(hasil(A,B,NewC,D)), retract(cow(ID,Nama,Makan,Time)), NewTime is 5,assertz(cow(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_milk(NewID);
                                  retract(cow(ID,Nama,Makan,Time)), NewTime is Time,assertz(cow(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_milk(NewID));
                                write('You do not have a cow.'));
                                write('You do not have a milking equipment!').

collect_milk(ID) :-             cow(ID,Nama,Makan,Time), Time =:= 0 ->  (player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,20); expAfter(ranch,10)),retract(hasil(A,B,C,D)), NewC is C+1,asserta(hasil(A,B,NewC,D)), retract(cow(ID,Nama,Makan,Time)), NewTime is 5,assertz(cow(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_milk(NewID);
                                check_cow(ID).

check_cow(ID) :-                \+ (cow(ID,_,_,_)) -> !;
                                retract(cow(ID,Nama,Makan,Time)),assertz(cow(ID,Nama,Makan,Time)),NewID is ID-1, collect_milk(NewID).

collect_wool :-                 inventoryI(5,_,item,_,_,_) ->
                                (sheep(ID,_,_,Time) -> 
                                ( Time =:= 0 ->(player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,15); expAfter(ranch,8)),retract(hasil(A,B,C,D)), NewB is B+1,asserta(hasil(A,NewB,C,D)), retract(sheep(ID,Nama,Makan,Time)), NewTime is 4,assertz(sheep(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_wool(NewID);
                                  retract(sheep(ID,Nama,Makan,Time)), NewTime is Time,assertz(sheep(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_wool(NewID));
                                write('You do not have a sheep.'));
                                write('You do not have a scissor!').

collect_wool(ID) :-             sheep(ID,Nama,Makan,Time), Time =:= 0 -> (player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,15); expAfter(ranch,8)), retract(hasil(A,B,C,D)), NewC is C+1,asserta(hasil(A,B,NewC,D)), retract(sheep(ID,Nama,Makan,Time)), NewTime is 5,assertz(sheep(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_wool(NewID);
                                check_sheep(ID).

check_sheep(ID) :-              \+ (sheep(ID,_,_,_)) -> !;
                                retract(sheep(ID,Nama,Makan,Time)),assertz(sheep(ID,Nama,Makan,Time)),NewID is ID-1, collect_wool(NewID).

collect_horsemilk :-            inventoryI(4,_,item,_,_,_) ->
                                (horse(ID,_,_,Time) -> 
                                ( Time =:= 0 ->(player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,25); expAfter(ranch,12)),retract(hasil(A,B,C,D)), NewD is D+1,asserta(hasil(A,B,C,NewD)), retract(horse(ID,Nama,Makan,Time)), NewTime is 4,assertz(horse(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_horsemilk(NewID);
                                  retract(horse(ID,Nama,Makan,Time)), NewTime is Time,assertz(horse(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_horsemilk(NewID));
                                write('You do not have a horse.'));
                                write('You do not have a milking equipment!').

collect_horsemilk(ID) :-        horse(ID,Nama,Makan,Time), Time =:= 0 -> (player(X,_,_,_,_,_,_,_,_,_), X == rancher -> expAfter(ranch,25); expAfter(ranch,12)), retract(hasil(A,B,C,D)), NewC is C+1,asserta(hasil(A,B,NewC,D)), retract(horse(ID,Nama,Makan,Time)), NewTime is 5,assertz(horse(ID,Nama,Makan,NewTime)), NewID is ID-1, collect_horsemilk(NewID);
                                check_horse(ID).

check_horse(ID) :-              \+ (horse(ID,_,_,_)) -> !;
                                retract(horse(ID,Nama,Makan,Time)),assertz(horse(ID,Nama,Makan,Time)),NewID is ID-1, collect_horsemilk(NewID).

/* storage to inventory */

storageRanch :-                 isRanch(_),
                                hasil(W,X,Y,Z),
                                write('storage: '),nl,
                                write('egg: '), write(W),nl,
                                write('wool: '), write(X),nl,
                                write('milk: '), write(Y),nl,
                                write('horse milk: '), write(Z),nl,
                                write('do you want to withdraw any? (yes/no)'),nl,
                                write('> '),read(Input), 
                                (Input == yes -> withdrawStorage, !;
                                 Input == no -> !;
                                 write('invalid input!'), !).

storageRanch :-                 \+ (isRanch(_)),
                                write('you are no in ranch!').

withdrawStorage :-              write('which one do you want to withdraw?'),nl,
                                write('1. egg'),nl,
                                write('2. wool'),nl,
                                write('3. milk'),nl,
                                write('4. horse milk'),nl,
                                write('input choice: '),read_integer(X),
                                (X =:= 1 ->
                                (
                                  write('Input amount of Eggs: '), read_integer(Telur),
                                  (
                                    hasil(Y,_,_,_), Telur =< Y -> addConsumable(19, Telur) -> retract(hasil(A,B,C,D)), NewA is A-Telur, asserta(hasil(NewA,B,C,D)),(write('Withdraw success!'));
                                    write('invalid amount!')
                                  )
                                )   
                                ;
                                X =:= 2 -> 
                                (
                                  write('Input amount of Wools: '), read_integer(Telur),
                                  (
                                    hasil(_,Y,_,_), Telur =< Y -> addConsumable(22, Telur) -> retract(hasil(A,B,C,D)), NewB is B-Telur, asserta(hasil(A,NewB,C,D)),(write('Withdraw success!'));
                                    write('invalid amount!')
                                  )
                                )
                                ;
                                X =:= 3 -> 
                                (
                                  write('Input amount of Milks: '), read_integer(Telur),
                                  (
                                    hasil(_,_,Y,_), Telur =< Y -> addConsumable(20, Telur) -> retract(hasil(A,B,C,D)), NewC is C-Telur, asserta(hasil(A,B,NewC,D)),(write('Withdraw success!'));
                                    write('invalid amount!')
                                  )
                                )   
                                ;
                                X =:= 4 ->
                                (
                                  write('Input amount of Horse Milks: '), read_integer(Telur),
                                  (
                                    hasil(_,_,_,Y), Telur =< Y -> addConsumable(21, Telur) -> retract(hasil(A,B,C,D)), NewD is D-Telur, asserta(hasil(A,B,C,NewD)),(write('Withdraw success!'));
                                    write('invalid amount!')
                                  )
                                )   
                                ;
                                write('invalid input!.')), !.
