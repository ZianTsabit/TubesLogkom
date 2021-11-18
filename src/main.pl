
/* supporting files */

:- include('map.pl').
:- include('quest.pl').


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

:- dynamic(job/1).
:- dynamic(isStarted/1).
:- dynamic(isQuest/1).
start                   :- isStarted(_) -> write('you already start your journey!'), !.

start                   :- \+isStarted(_), asserta(isStarted(true)), createMap, 
                            write('Welcome to Harvest Star. Choose your job'), nl,
                            write('1. Fisherman'), nl,
                            write('2. Farmer'), nl,
                            write('3. Rancher'), nl,
                            write('> '), read_integer(Choice),
                            (Choice = 1 -> write('You choose Fisherman, lets start fishing'), asserta(job(fisherman))),
                            (Choice = 2 -> write('You choose Farmer, lets start farming'), asserta(job(farmer))),
                            (Choice = 3 -> write('You choose Rancher, lets start ranching'), asserta(job(rancher))).

quest                   :- isQuest(_) -> write('You have an on-going quest!');
                            \+ isQuest(_), player(X,Y), X =:= 12, Y =:= 8 -> asserta(isQuest(true)), getQuest.