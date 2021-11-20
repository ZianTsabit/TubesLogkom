:- dynamic(player/11).

/* Code utama player */

initStatus(X)                   :-  asserta(player(X,1,1,0,1,0,1,0,0,1000)).

playerStatus                    :-  player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,Gold),
                                    write('Your status:'), nl,
                                    write('Job: '), write(Job), nl,
                                    write('Level: '), write(Level), nl,
                                    write('Level farming: '), write(Level_farm), nl,
                                    write('Exp farming: '), write(Exp_farm), nl,
                                    write('Level fishing: '), write(Level_fish), nl,
                                    write('Exp fishing: '), write(Exp_fish), nl,
                                    write('Level ranching: '), write(Level_ranch), nl,
                                    write('Exp ranching: '), write(Exp_ranch), nl,
                                    write('Exp: '), write(Exp), nl,
                                    write('Gold: '), write(Gold).