
gold(X) :-       retract(player(A,B,C,D,E,F,G,H,I,J)),
                 Gold is J+X,
                 asserta(player(A,B,C,D,E,F,G,H,I,Gold)).

teleport(X1,Y1) :- retract(player(_,_)), asserta(player(X1,Y1)).