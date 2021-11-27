
/* supporting files */

:- include('map.pl').
:- include('quest.pl').
:- include('player.pl').
:- include('house.pl').
:- include('inventory.pl').
:- include('role.pl').
:- include('marketplace.pl').
:- include('clock.pl').
:- include('alchemist.pl').
:- include('farming.pl').
:- include('ranching.pl').
:- include('fishing.pl').
:- include('cheat.pl').


:- dynamic(isStarted/1).
:- dynamic(isQuest/1).
:- dynamic(day/1).
:- dynamic(season/1).
:- dynamic(weather/1).
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
                            (\+ isStarted(_), asserta(isStarted(true)), createMap, asserta(day(1)), asserta(diaryList([])), 
                            asserta(clock(360)), asserta(capacity(0)), asserta(season(spring)), asserta(weather(sunny)),
                            write('Welcome to Harvest Star. Choose your job'), nl,
                            write('1. Fisherman'), nl,
                            write('2. Farmer'), nl,
                            write('3. Rancher'), nl,
                            write('> '), read_integer(Choice),
                            ((Choice = 1 -> initStatus(fisherman), write('You choose Fisherman, lets start fishing'));
                            (Choice = 2 -> initStatus(farmer), write('You choose Farmer, lets start farming'));
                            (Choice = 3 -> initStatus(rancher), write('You choose Rancher, lets start ranching'));
                            ((Choice > 3; Choice < 1) -> retract(day(_)) ,retract(isStarted(_)), retract(diaryList(_)), 
                            retract(clock(_)), retract(capacity(_)), retract(season(_)), retract(weather(_)),
                            write('Game is not started'), nl, write('Input invalid')))).


/*** Player ***/

status                  :-  playerStatus.


/*** Quest ***/

quest                   :-  isStarted(_), isQuest(_) -> write('You have an on-going quest!'), !.
quest                   :-  isStarted(_), \+ isQuest(_),
                            player(Px, Py), quest(Qx, Qy),
                            Px =:= Qx, Py =:= Qy ->
                                asserta(isQuest(true)),
                                getQuest,
                                retract(quest(Qx, Qy)), !.
quest                   :-  isStarted(_), \+ isQuest(_),
                            player(Px, Py), quest(Qx, Qy),
                            \+ (Px =:= Qx, Py =:= Qy) -> 
                                write('Not in Quest Tile!'), nl, !.
/*** House ***/

house                   :-  player(X,Y), X =:= 4, Y =:= 10, (\+ isHouse(_), writeActHouse, asserta(isHouse(true)), !;
                            write('You are already in house menu')); write('You are not in house').
sleep                   :-  isHouse(_), goSleep, !; failHouse.
writeDiary              :-  isHouse(_), writeInDiary, !; failHouse.
readDiary               :-  isHouse(_), readTheDiary, !; failHouse.
exit                    :-  retract(isHouse(_)).

/*** Alchemist ***/

alchemist               :-  alchemistMenu, !.
rich                    :-  richPotion, !.
speed                   :-  speedPotion, !.
secret                  :-  secretPotion, !.

/*** Fail State ***/

failState               :-  write('You have worked hard, but in the end result is all that matters.'), nl,
                            write('May God bless you in the future with kind people!'),
                            retract(day(_)) ,retract(isStarted(_)), retract(diaryList(_)), 
                            retract(clock(_)), retract(capacity(_)), retract(season(_)), retract(weather(_)).
