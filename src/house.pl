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

goSleep                         :-  write('You went to sleep'), nl, nl,
                                    retract(day(Before)), After is Before + 1, asserta(day(After)),
                                    write('Day '), write(After).

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