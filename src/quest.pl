:- dynamic(runQuest/2).
:- dynamic(finalQuest/2).

% canCreateQuest(X, Y)    :-  X > 0, X < 16,
%                             Y > 0, Y < 16,
%                             \+ wall(X, Y),
%                             \+ player(X, Y),
%                             \+ house(X, Y),
%                             \+ ranch(X, Y),
%                             \+ quest(X, Y),
%                             \+ marketplace(X, Y),
%                             \+ digged(X, Y),
%                             \+ water(X, Y).

% Generate Quest di sekitar pojok kiri atas
genQuest1(X, Y) :-  random(0, 11, Dx),
                    random(0, 6, Dy),
                    X is 1 + Dx, Y is 15 - Dy.

% Generate Quest di sekitar tengah kanan
genQuest2(X, Y) :-  random(0, 10, Dx),
                    random(0, 6, Dy),
                    X is 15 - Dx, Y is 11 - Dy.

% Generate Quest di sekitar kiri bawah
genQuest3(X, Y) :-  random(0, 9, Dx),
                    random(0, 3, Dy),
                    X is 1 + Dx, Y is 1 + Dy.

refreshQuest    :-  \+ quest(_, _),
                    \+ isQuest(_),
                    % Tidak ada quest di map dan tidak ada quest dilakukan
                    random(1, 4, X),
                    (
                        X =:= 1 ->  genQuest1(Qx, Qy);
                        X =:= 2 ->  genQuest2(Qx, Qy);
                                    genQuest3(Qx, Qy)
                    ),
                    asserta(quest(Qx, Qy)).

getQuest                :-  random(3, 11, RHarvest), random(3, 11, RFish), random(3, 11, RRanch),
                            asserta(finalQuest(harvest,RHarvest)), asserta(finalQuest(fish,RFish)), asserta(finalQuest(ranch,RRanch)),
                            asserta(runQuest(harvest,0)), asserta(runQuest(fish,0)), asserta(runQuest(ranch,0)),
                            write('You got a new quest!'), nl, nl, 
                            write('You need to collect:'), nl,
                            format('- ~w harvest item', [RHarvest]), nl, 
                            format('- ~w fish', [RFish]), nl, 
                            format('- ~w ranch item', [RRanch]), nl.

questAddFish    :-  isQuest(_)  ->  runQuest(fish, FishNum),
                                    NFishNum is FishNum + 1,
                                    finalQuest(fish, TFish),
                                    (NFishNum =< TFish  -> retract(runQuest(fish, FishNum)), asserta(runQuest(fish, NFishNum)); true),
                                    completeQuest; true.

questAddHarvest :-  isQuest(_)  ->  runQuest(harvest, HarvestNum),
                                    NHarvestNum is HarvestNum + 1,
                                    finalQuest(harvest, THarvest),
                                    (NHarvestNum =< THarvest  -> retract(runQuest(harvest, HarvestNum)), asserta(runQuest(harvest, NHarvestNum)); true),
                                    completeQuest; true.

questAddRanch   :-  isQuest(_)  ->  runQuest(ranch, RanchNum),
                                    NRanchNum is RanchNum + 1,
                                    finalQuest(ranch, TRanch),
                                    (NRanchNum =< TRanch  -> retract(runQuest(ranch, RanchNum)), asserta(runQuest(ranch, NRanchNum)); true),
                                    completeQuest; true.

completeQuest   :-  finalQuest(harvest, HTarget), finalQuest(fish, FTarget), finalQuest(ranch, RTarget),
                    runQuest(harvest, HCurr), runQuest(fish, FCurr), runQuest(ranch, RCurr),
                    (HTarget =< HCurr, FTarget =< FCurr, RTarget =< RCurr) -> (
                    /* Kalau semua sama, nambahin Gold dan EXP */
                    retract(player(A, B, C, D, E, F, G, H, I, OldGold)),
                    /* Niatnya mau bikin bonus exp itu bergantung dengan
                     * berapa susah questnya */
                    /* Bonus Exp dan Gold dari Job */
                     (A = fisherman -> FishBonus    is 2 ; FishBonus is 1),
                     (A = rancher   -> RanchBonus   is 2 ; RanchBonus is 1),
                     (A = farmer    -> HarvestBonus is 2 ; HarvestBonus is 1),
                    /* Ngehitung bonus Gold */
                    BonusGH  is HTarget * 50 * HarvestBonus,
                    BonusGF  is FTarget * 50 * FishBonus,
                    BonusGR  is RTarget * 50 * RanchBonus,
                    TotalBonusG is BonusGH + BonusGR + BonusGF,
                    NewGold is OldGold + TotalBonusG,
                    /* Ngehitung bonus Exp */
                    BonusEH  is HTarget * HarvestBonus,
                    BonusEF  is FTarget * FishBonus,
                    BonusER  is RTarget * RanchBonus,
                    ExpBonus is BonusEH + BonusER + BonusEF,
                    /* Nambahin Exp */
                    expAfter(harvest, BonusEH),
                    expAfter(fish, BonusEF),
                    expAfter(ranch, BonusER),
                    asserta(player(A, B, C, D, E, F, G, H, I, NewGold)),
                    retract(isQuest(_)), nl,
                    write('Quest Completed!'), nl, nl,
                    write('You Got:'), nl,
                    format('> ~w Gold', [TotalBonusG]), nl,
                    format('> ~w Exp', [ExpBonus]), nl,
                    refreshQuest); true.
                    % format('~nQuest Completed!~n~nYou Got:~n> ~w Gold~n> ~w Exp~n', [NewGold, ExpBonus])).
                    % write('Quest Completed!, You got'), nl).

questInfo       :-  (isQuest(_) -> questProgress ; write('No Quest Running'), nl).

questProgress   :-  write('Current Quest Progress:'), nl, nl,
                    finalQuest(fish, TFish), runQuest(fish, CFish),
                    finalQuest(ranch, TRanch), runQuest(ranch, CRanch),
                    finalQuest(harvest, THarvest), runQuest(harvest, CHarvest),
                    format('Fish    : ~w Fish    / ~w Fish',    [CFish, TFish]), nl,
                    format('Ranch   : ~w Ranch   / ~w Ranch',   [CRanch, TRanch]), nl,
                    format('Harvest : ~w Harvest / ~w Harvest', [CHarvest, THarvest]), nl.
