:- dynamic(runQuest/2).
:- dynamic(finalQuest/2).

getQuest                :-  asserta(finalQuest(harvest,3)), asserta(finalQuest(fish,5)), asserta(finalQuest(ranch,4)),
                            asserta(runQuest(harvest,0)), asserta(runQuest(fish,0)), asserta(runQuest(ranch,0)),
                            write('You got a new quest!'), nl, nl, 
                            write('You need to collect:'), nl,
                            write('- 3 harvest item'), nl, 
                            write('- 5 fish'), nl, 
                            write('- 4 ranch item').