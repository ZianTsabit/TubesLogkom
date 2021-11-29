
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
    write('% 1. start     : untuk memulai petualanganmu                                   %'),nl,
    write('% 2. map       : menampilkan peta                                              %'),nl,
    write('% 3. status    : menampilkan kondisimu terkini                                 %'),nl,
    write('% 4. inventory : menampilkan inventory                                         %'),nl,
    write('% 5. w         : gerak ke utara 1 langkah                                      %'),nl,   
    write('% 6. s         : gerak ke selatan 1 langkah                                    %'),nl,
    write('% 7. d         : gerak ke ke timur 1 langkah                                   %'),nl,
    write('% 8. a         : gerak ke barat 1 langkah                                      %'),nl,
    write('% 9. help      : menampilkan segala bantuan                                    %'),nl,
    write('% 10. help_fishing : menampilkan bantuan mengenai kegiatan fishing             %'),nl,
    write('% 11. help_farming: menampilkan bantuan mengenai kegiatan farming              %'),nl,
    write('% 12. help_ranching : menampilkan bantuan mengenai kegiatan ranching           %'),nl,
    write('% 13. help_quest : menampilkan bantuan mengenai quest                          %'),nl,
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
                            write('You are already in house menu'), !); write('You are not in house').
sleep                   :-  day(X), (X \= 360, isHouse(_) -> goSleep, !; X = 360, isHouse(_) -> exit, failState, !); failHouse.
writeDiary              :-  isHouse(_), writeInDiary, !; failHouse.
readDiary               :-  isHouse(_), readTheDiary, !; failHouse.
exit                    :-  retract(isHouse(_)).

/*** Alchemist ***/

alchemist               :-  alchemistMenu, !.
rich                    :-  richPotion, !.
speed                   :-  speedPotion, !.
secret                  :-  secretPotion, !.

/*** Ranch ***/

ranch                   :- enterRanch, !.
chicken_info            :- show_chicken, !.
sheep_info              :- show_sheep, !.
cow_info                :- show_cow, !.
horse_info              :- show_horse, !.
fill                    :- fill_silo, !.
storage                 :- storageRanch, !.
collect                 :- collectRanch, !.
exitRanch               :- retract(isRanch(_)), clockAfterRanching, !.

/*** Fail State ***/

failState               :-  write('You failed to collect 20000 Golds!'), nl, nl,
                            write('You have worked hard, but in the end result is all that matters.'), nl,
                            write('May God bless you in the future with kind people!'),
                            retract(day(_)) ,retract(isStarted(_)), retract(diaryList(_)), retract(player(_,_)),
                            retract(clock(_)), retract(capacity(_)), retract(season(_)), retract(weather(_)),
                            (isRich(_) -> retract(isRich(_)); !),
                            (isSpeed(_) -> retract(isSpeed(_)); !),
                            (richBoost(_) -> retract(richBoost(_)); !),
                            (speedBoost(_) -> retract(speedBoost(_)); !).

/*** Goal State ***/    

goalState               :-  write('Congratulations! You have finally collected 20000 Golds!'), nl,
                            write('You are no longer in debt anymore!'),
                            retract(day(_)) ,retract(isStarted(_)), retract(diaryList(_)), retract(player(_,_)),
                            retract(clock(_)), retract(capacity(_)), retract(season(_)), retract(weather(_)),
                            (isRich(_) -> retract(isRich(_)); !),
                            (isSpeed(_) -> retract(isSpeed(_)); !),
                            (richBoost(_) -> retract(richBoost(_)); !),
                            (speedBoost(_) -> retract(speedBoost(_)); !).

checkGoalState          :-  player(_,_,_,_,_,_,_,_,_,Gold),
                            Gold >= 20000 -> goalState; true.
