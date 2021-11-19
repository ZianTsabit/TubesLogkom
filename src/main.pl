
/* supporting files */

:- include('map.pl').
:- include('quest.pl').
:- include('player.pl').
:- include('house.pl').
:- include('inventory.pl').
:- include('role.pl').
:- include('marketplace.pl').
:- include('clock.pl').

:- dynamic(isStarted/1).
:- dynamic(isQuest/1).
:- dynamic(day/1).
:- dynamic(isHouse/1).
:- dynamic(diaryList/1).

/*** Start Game ***/

startGame:- 
    write('  _   _                          _                '),nl,   
    write(' | | | | __ _ __ __    ___   ___| |_              '),nl, 
    write(' | |_| |/ _` | __\\ \\ / / _ \\/ __| __|          '),nl,
    write(' |  _  | (_| | |  \\ V /  __/\\__ \\ |_           '),nl,
    write(' |_| |_|\\__,_|_|   \\_/ \\___||___/\\__|         '),nl,
    write('                                                 '),nl,
    write('                                                 '),nl,
    write(' Harvest Star!!!                                  '),nl,
    write('                                                 '),nl,
    write(' Lets play and pay our debts together!            '),nl,
    write('                                                 '),nl,
    write(' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write(' %                              ~Harvest Star~                                  %'),nl,
    write(' % 1. start  : untuk memulai petualanganmu                                      %'),nl,
    write(' % 2. map    : menampilkan peta                                                 %'),nl,
    write(' % 3. status : menampilkan kondisimu terkini                                    %'),nl,
    write(' % 4. w      : gerak ke utara 1 langkah                                         %'),nl,   
    write(' % 5. s      : gerak ke selatan 1 langkah                                       %'),nl,
    write(' % 6. d      : gerak ke ke timur 1 langkah                                      %'),nl,
    write(' % 7. a      : gerak ke barat 1 langkah                                         %'),nl,
    write(' % 8. help   : menampilkan segala bantuan                                       %'),nl,
    write(' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%').


/*** Help ***/

help:-
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              ~Harvest Star~                                  %'),nl,
    write('% 1. start  : untuk memulai petualanganmu                                      %'),nl,
    write('% 2. map    : menampilkan peta                                                 %'),nl,
    write('% 3. status : menampilkan kondisimu terkini                                    %'),nl,
    write('% 4. w      : gerak ke utara 1 langkah                                         %'),nl,   
    write('% 5. s      : gerak ke selatan 1 langkah                                       %'),nl,
    write('% 6. d      : gerak ke ke timur 1 langkah                                      %'),nl,
    write('% 7. a      : gerak ke barat 1 langkah                                         %'),nl,
    write('% 8. help   : menampilkan segala bantuan                                       %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%').


/*** Start ***/

start                   :-  isStarted(_) -> write('You already start your journey!');
                            (\+ isStarted(_), asserta(isStarted(true)), createMap, asserta(day(1)), asserta(diaryList([])), asserta(clock(360)), asserta(capacity(0)),
                            write('Welcome to Harvest Star. Choose your job'), nl,
                            write('1. Fisherman'), nl,
                            write('2. Farmer'), nl,
                            write('3. Rancher'), nl,
                            write('> '), read_integer(Choice),
                            ((Choice = 1 -> initStatus(fisherman), write('You choose Fisherman, lets start fishing'));
                            (Choice = 2 -> initStatus(farmer), write('You choose Farmer, lets start farming'));
                            (Choice = 3 -> initStatus(rancher), write('You choose Rancher, lets start ranching'));
                            ((Choice > 3; Choice < 1) -> retract(day(_)) ,retract(isStarted(_)), write('Game is not started'), nl, write('Input invalid')))).


/*** Player ***/

status                  :-  playerStatus.


/*** Quest ***/

quest                   :-  isQuest(_) -> write('You have an on-going quest!');
                            \+ isQuest(_), player(X,Y), X =:= 12, Y =:= 8 -> asserta(isQuest(true)), getQuest.


/*** House ***/

house                   :-  player(X,Y), X =:= 4, Y =:= 10, (\+ isHouse(_), writeActHouse, asserta(isHouse(true));
                            write('You are already in house menu')); write('You are not in house').
sleep                   :-  isHouse(_), goSleep; failHouse.
writeDiary              :-  isHouse(_), writeInDiary; failHouse.
readDiary               :-  isHouse(_), readTheDiary; failHouse.
exit                    :-  retract(isHouse(_)).