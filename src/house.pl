:- dynamic(diary/2).

concat(A,[],[A]).
concat(A,[X|B],[A|[X|B]]).

insertDiary([],A,[A]).
insertDiary([X],X,[X]).
insertDiary([X|Y],A,Z1) :- insertDiary(Y,A,Z), concat(X,Z,Z1). 

readDiaryDay([A]) :- write('- Day '), write(A).
readDiaryDay([A|B]) :- write('- Day '), write(A), nl, readDiaryDay(B).

/* Code utama house */

failHouse                       :-  write('You are not in house menu').

writeActHouse                   :-  write('What do you want to do?'), nl,
                                    write('- sleep'), nl,
                                    write('- writeDiary'), nl,
                                    write('- readDiary'), nl,
                                    write('- exit').

goSleep                         :-  write('You went to sleep'), nl, nl, clockAfterSleep, random(Fairy),
                                    (Fairy > 0.05, Fairy < 0.15 -> nl, nl, write('You saw Sleeping Fairy shadow last night');
                                    Fairy < 0.05 -> nl, nl, write('You are lucky!'), nl, write('You meet Sleeping Fairy'), nl, nl,
                                    write('Sleeping Fairy: Choose coordinate where you want to wake up!'),
                                    nl, write('(Your house coordinate is (4,10))'),
                                    nl, write('X: '), read_integer(X), write('Y: '), read_integer(Y), nl,
                                    (wall(X,Y) -> write('Sleeping Fairy: You must be kidding to wake up on the wall'),
                                    nl, nl, write('You return to house');
                                    (X > 16; Y > 16; X < 0; Y < 0) -> write('Sleeping Fairy: I do not understand what place you mean'),
                                    nl, nl, write('You return to house');
                                    water(X,Y) -> write('Sleeping Fairy: Wake up on water? You are strange'),
                                    nl, nl, write('You return to house');
                                    write('Sleeping Fairy: Your request has been granted. Enjoy your day!'), exit,
                                    retract(player(_,_)), asserta(player(X,Y)));true, !) .

writeInDiary                    :-  day(X), (\+ diary(X,_) -> write('Write your diary for Day '); write('Replace your diary for Day ')), 
                                    write(X), nl, nl, write('yes'), nl, write('| ?- '), read(Y),
                                    retract(diaryList(A)), insertDiary(A,X,Z), asserta(diaryList(Z)),
                                    write('Day '), write(X), write(' entry saved'), (\+ diary(X,_) -> asserta(diary(X,Y));
                                    retract(diary(X,_)), asserta(diary(X,Y))).

readTheDiary                    :-  write('Here are the list of your entries:'), nl,
                                    diaryList(X), readDiaryDay(X), nl, nl,
                                    write('Which entry do you want to read?'), nl, nl,
                                    write('yes'), nl, write('| ?- '), read(Y),
                                    write('Here is your entry for day '), write(Y), write(':'), nl,
                                    diary(Y,Z), write(Z).