:- dynamic(player/10).

/* Code utama player */

initStatus(X)               :-  asserta(player(X,1,1,0,1,0,1,0,0,100000000000)).

playerStatus                :-  player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,Gold),
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

expAfter(O,Add_Exp)         :-  retract(player(Job,Level,Level_farm,Exp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,Exp,Gold)),
                                ((Exp + Add_Exp) >= 100, NewExp is Exp + Add_Exp - 100, NewLevel is Level + 1,
                                write('Congratulations... You leveled up!'), nl, write('You get 1000 golds'), NewGold is Gold + 1000;
                                NewExp is Exp + Add_Exp, NewLevel is Level, NewGold is Gold),
                                (O = farm -> ((Exp_farm + Add_Exp) >= 100, NewExp_farm is Exp_farm + Add_Exp - 100, NewLevel_farm is Level_farm + 1;
                                NewExp_farm is Exp_farm + Add_Exp, NewLevel_farm is Level_farm),
                                asserta(player(Job,NewLevel,NewLevel_farm,NewExp_farm,Level_fish,Exp_fish,Level_ranch,Exp_ranch,NewExp,NewGold));
                                O = fish -> ((Exp_fish + Add_Exp) >= 100, NewExp_fish is Exp_fish + Add_Exp - 100, NewLevel_fish is Level_fish + 1;
                                NewExp_fish is Exp_fish + Add_Exp, NewLevel_fish is Level_fish),
                                asserta(player(Job,NewLevel,Level_farm,Exp_farm,NewLevel_fish,NewExp_fish,Level_ranch,Exp_ranch,NewExp,NewGold));
                                O = ranch -> ((Exp_ranch + Add_Exp) >= 100, NewExp_ranch is Exp_ranch + Add_Exp - 100, NewLevel_ranch is Level_ranch + 1;
                                NewExp_ranch is Exp_ranch + Add_Exp, NewLevel_ranch is Level_ranch),
                                asserta(player(Job,NewLevel,Level_farm,Exp_farm,Level_fish,Exp_fish,NewLevel_ranch,NewExp_ranch,NewExp,NewGold))), !.















































































































































