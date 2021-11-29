/* Fakta dan Rules Inventory */

/* inventoryItem(ID, nama, jenis, job, level, jumlah) */
:- dynamic(inventoryI/6).
:- dynamic(capacity/1).

/* Hitung jumlah barang */

/* Basis */
sum([Barang],Barang).

/* Rekurens */
sum([H | T], L) :- sum(T, L1), L is H + L1.

/* Tampilkan inventory */
listItem :-             findall(Jumlah,inventoryI(_,_,item,_,_,Jumlah), ListJumlahItem),
                        findall(Nama,inventoryI(_,Nama,item,_,_,_),ListNamaItem),
                        showItem(ListJumlahItem,ListNamaItem).

listConsumable :-       findall(Jumlah,inventoryI(_,_,consumable,_,_,Jumlah), ListJumlahConsumable),
                        findall(Nama,inventoryI(_,Nama,consumable,_,_,_),ListNamaConsumable),
                        findall(ID,inventoryI(ID,_,consumable,_,_,_), ListIDConsumable),
                        showConsumable(ListIDConsumable, ListJumlahConsumable, ListNamaConsumable).

showItem([],[]).

showItem([Jumlah|TX],[Nama|TZ]) :-
                        (Jumlah > 0 -> write(Jumlah),write(' '),write(Nama),nl),
                        showItem(TX,TZ).

showConsumable([],[],[]).

showConsumable([ID|TA],[Jumlah|TX],[Nama|TZ]) :-
                        write(Jumlah),write(' '),write(Nama), write(' (ID: '), write(ID), write(')'),nl,
                        showConsumable(TA,TX,TZ).

kapasitas :-            findall(Jumlah, inventoryI(_,_,_,_,_,Jumlah), ListJumlah),
                        sum(ListJumlah, Kapasitas),
                        retract(capacity(_)),
                        asserta(capacity(Kapasitas)).

kapasitas :-            \+(inventoryI(_,_,_,_,_,_)),
                        retract(capacity(_)),
                        asserta(capacity(0)).


inventory :-            write('Your inventory: '),
                        capacity(Kapasitas),
                        write(Kapasitas), write(' / 100'),nl,
                        listItem, listConsumable, nl, nl, write('Use throw command to throw item').

/* Logic add item to inventory */
checkAfter                 :-   capacity(X), X > 100.

addItem(ID,JobItem,Jumlah) :-   item(ID,Nama,JobItem),capacity(X),
                                NewX is X + Jumlah, NewX =< 100,
                                \+inventoryI(ID,_,item,JobItem,_,_), 
                                asserta(inventoryI(ID,Nama,item,JobItem,1,Jumlah)), kapasitas, !.

addItem(ID,JobItem,Jumlah) :-   item(ID,Nama,JobItem),capacity(X),
                                NewX is X + Jumlah, NewX =< 100,
                                inventoryI(ID,_,item,JobItem,_,JumlahC),
                                retract(inventoryI(ID,_,item,JobItem,_,_)),
                                NewJumlah is JumlahC + Jumlah, 
                                asserta(inventoryI(ID,Nama,item,JobItem,1,NewJumlah)), kapasitas,!.

addItem(ID,JobItem,Jumlah) :-   item(ID,_,JobItem),capacity(X),
                                NewX is X + Jumlah, NewX > 100,
                                write('Not enough capacity!'), fail, !.
                               


addConsumable(ID, Jumlah) :-    consumable(ID,Nama),capacity(X),
                                NewX is X + Jumlah, NewX =< 100,
                                \+inventoryI(ID,_,consumable,_,_,_),
                                asserta(inventoryI(ID,Nama,consumable,non,-1,Jumlah)), kapasitas,!.

addConsumable(ID, Jumlah) :-    consumable(ID,Nama),capacity(X),
                                NewX is X + Jumlah, NewX =< 100,
                                inventoryI(ID,_,consumable,_,_,JumlahC),
                                retract(inventoryI(ID,_,consumable,_,_,_)),
                                NewJumlah is JumlahC + Jumlah,
                                asserta(inventoryI(ID,Nama,consumable,non,-1,NewJumlah)), kapasitas,!.

addConsumable(ID,Jumlah) :-     consumable(ID,_),capacity(X),
                                NewX is X + Jumlah, NewX > 100,
                                write('Not enough capacity!'), fail, !.

/* Logic delete item to inventory */

deleteItem(ID,JobItem,Jumlah) :- item(ID,Nama,JobItem),
                                 inventoryI(ID,Nama,item,JobItem,Level,JumlahI),
                                 JumlahI > Jumlah, NewJumlah is JumlahI - Jumlah, 
                                 retract(inventoryI(ID,Nama,item,JobItem,Level,JumlahI)),
                                 asserta(inventoryI(ID,Nama,item,JobItem,Level,NewJumlah)), kapasitas, !.

deleteItem(ID,JobItem,Jumlah) :- item(ID,Nama,JobItem),
                                 inventoryI(ID,Nama,item,JobItem,Level,JumlahI),
                                 JumlahI =:= Jumlah, 
                                 retract(inventoryI(ID,Nama,item,JobItem,Level,JumlahI)), kapasitas, !.


deleteItem(ID,JobItem,Jumlah) :- item(ID,Nama,JobItem),
                                 inventoryI(ID,Nama,item,JobItem,_,JumlahI),
                                 JumlahI < Jumlah,
                                 write('invalid amount!'), !.

deleteConsumable(ID, Jumlah) :-  consumable(ID,Nama),
                                 inventoryI(ID,Nama,consumable,_,_,JumlahC),
                                 JumlahC > Jumlah, NewJumlah is JumlahC - Jumlah, 
                                 retract(inventoryI(ID,Nama,consumable,_,_,JumlahC)),
                                 asserta(inventoryI(ID,Nama,consumable,non,-1,NewJumlah)), kapasitas, !.

deleteConsumable(ID, Jumlah) :-  consumable(ID,Nama),
                                 inventoryI(ID,Nama,consumable,_,_,JumlahC),
                                 JumlahC =:= Jumlah,
                                 retract(inventoryI(ID,Nama,consumable,_,_,JumlahC)), kapasitas, !.

deleteConsumable(ID, Jumlah) :-  consumable(ID,Nama),
                                 inventoryI(ID,Nama,consumable,_,_,JumlahC),
                                 JumlahC < Jumlah,
                                 write('invalid amount!'), !.
                                 
cekConsumableExist(ID, Name) :-  \+inventoryI(ID,Name,consumable,_,_,_),!,fail.
cekConsumableExist(ID, Name) :- inventoryI(ID,Name,consumable,_,_,_).

cekItemExist(ID, Name) :-  \+inventoryI(ID,Name,item,_,_,_),!,fail.
cekItemExist(ID, Name) :- inventoryI(ID,Name,item,_,_,_).

throw                         :- inventoryI(_,_,consumable,_,_,_),
                                write('which one you want to throw?'),nl,
                                listConsumable,nl,
                                write('input ID: '), read_integer(X),
                                inventoryI(X,_,consumable,_,_,_) -> write('How many do you want to throw?'),nl,write('input amount: '), read_integer(Y), deleteConsumable(X,Y), !;
                                write('There is nothing to throw!').
