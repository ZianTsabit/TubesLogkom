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
                        findall(Level,inventoryI(_,_,item,_,Level,_),ListLevelItem),
                        findall(Nama,inventoryI(_,Nama,item,_,_,_),ListNamaItem),
                        showItem(ListJumlahItem,ListLevelItem,ListNamaItem).

listConsumable :-       findall(Jumlah,inventoryI(_,_,consumable,_,_,Jumlah), ListJumlahConsumable),
                        findall(Nama,inventoryI(_,Nama,consumable,_,_,_),ListNamaConsumable),
                        showConsumable(ListJumlahConsumable, ListNamaConsumable).

showItem([],[],[]).

showItem([Jumlah|TX],[Level|TY],[Nama|TZ]) :-
                        write(Jumlah),write(' Level '),write(Level),write(' '),write(Nama),((Jumlah > 1) -> write('s')),nl,
                        showItem(TX,TY,TZ).

showConsumable([],[]).

showConsumable([Jumlah|TX],[Nama|TZ]) :-
                        write(Jumlah),write(' '),write(Nama),((Jumlah > 1) -> write('s')),nl,
                        showConsumable(TX,TZ).

kapasitas :-            findall(Jumlah, inventoryI(_,_,_,_,_,Jumlah), ListJumlah),
                        sum(ListJumlah, Kapasitas),
                        retract(capacity(_)),
                        asserta(capacity(Kapasitas)).

inventory :-            write('Your inventory: '),
                        capacity(Kapasitas),
                        write(Kapasitas), write(' / 100'),nl,
                        listItem, listConsumable, !.



addItem(ID,JobItem,Jumlah) :-   item(ID,Nama,JobItem),capacity(X),
                                X =< 100,
                                \+inventoryI(ID,_,item,JobItem,_,_), 
                                asserta(inventoryI(ID,Nama,item,JobItem,1,Jumlah)), kapasitas,!.

addItem(ID,JobItem,Jumlah) :-   item(ID,Nama,JobItem),capacity(X),
                                X =< 100,
                                inventoryI(ID,_,item,JobItem,_,JumlahC),
                                retract(inventoryI(ID,_,item,JobItem,_,_)),
                                NewJumlah is JumlahC + Jumlah, 
                                asserta(inventoryI(ID,Nama,item,JobItem,1,NewJumlah)), kapasitas,!.

addConsumable(ID, Jumlah) :-    consumable(ID,Nama),capacity(X),
                                X =< 100,
                                \+inventoryI(ID,_,consumable,_,_,_),
                                asserta(inventoryI(ID,Nama,consumable,non,-1,Jumlah)), kapasitas,!.

addConsumable(ID, Jumlah) :-    consumable(ID,Nama),capacity(X),
                                X =< 100,
                                inventoryI(ID,_,consumable,_,_,JumlahC),
                                retract(inventoryI(ID,_,consumable,_,_,_)),
                                NewJumlah is JumlahC + Jumlah,
                                asserta(inventoryI(ID,Nama,consumable,non,-1,NewJumlah)), kapasitas,!.

cekConsumableExist(ID, Name) :-  \+inventoryI(ID,Name,consumable,_,_,_),!,fail.
cekConsumableExist(ID, Name) :- inventoryI(ID,Name,consumable,_,_,_).