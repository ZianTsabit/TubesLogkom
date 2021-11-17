
/* supporting files */

:- include('map.pl').


map :- map(0, 16), nl.


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

