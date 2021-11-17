
/* supporting files */

:- include('map.pl').

menu                    :- write('Welcome to <nama game>!'),nl ,nl ,
                           write('Ketik 1 untuk mulai (belom dibikin opsi lain).'), nl,
                           read_integer(Choice),
                           (Choice = 1 -> write('Hello, Player, welcome to <nama game>')), nl, start, !.

:- dynamic(isStarted/1).
start                   :- isStarted(_), write("you already start your journey!").

start                   :- \+isStarted(_), asserta(started(true)), createMap.
