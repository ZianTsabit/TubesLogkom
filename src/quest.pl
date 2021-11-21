:- dynamic(runQuest/2).
:- dynamic(finalQuest/2).

canCreateQuest(X, Y)    :-  X > 0, X < 16,
                            Y > 0, Y < 16,
                            \+ wall(X, Y),
                            \+ player(X, Y),
                            \+ house(X, Y),
                            \+ ranch(X, Y),
                            \+ quest(X, Y),
                            \+ marketplace(X, Y),
                            \+ digged(X, Y),
                            \+ water(X, Y).

% Niatnya mau bikin RNG untuk nentuin lokasi                     
genQuest(X, Y)  :-  random(1, 16, Rx),
                    random(1, 16, Ry),
                    canCreateQuest(Rx, Ry),
                    X is Rx, Y is Ry.

refreshQuest    :-  \+ quest(_, _),
                    genQuest(Rx, Ry),
                    quest(Rx, Ry).

getQuest                :-  random(3, 10, RHarvest), random(3, 10, RFish), random(3, 10, RRanch),
                            asserta(finalQuest(harvest,RHarvest)), asserta(finalQuest(fish,RFish)), asserta(finalQuest(ranch,RRanch)),
                            asserta(runQuest(harvest,0)), asserta(runQuest(fish,0)), asserta(runQuest(ranch,0)),
                            write('You got a new quest!'), nl, nl, 
                            write('You need to collect:'), nl,
                            format('- ~w harvest item', [RHarvest]), nl, 
                            format('- ~w fish', [RFish]), nl, 
                            format('- ~w ranch item', [RRanch]), nl.


questAddFish    :-  isQuest(_)  ->  retract(runQuest(fish, FishNum)),
                                    NFishNum is FishNum + 1,
                                    asserta(runQuest(fish, NFishNum)),
                                    % Cek apakah quest complete
                                    completeQuest.

questAddHarvest :-  isQuest(_)  ->  retract(runQuest(harvest, HarvestNum)),
                                    NHarvestNum is HarvestNum + 1,
                                    asserta(runQuest(harvest, NHarvestNum)),
                                    % Cek apakah quest complete
                                    completeQuest.

questAddRanch   :-  isQuest(_)  ->  retract(runQuest(ranch, RanchNum)),
                                    NRanchNum is RanchNum + 1,
                                    asserta(runQuest(ranch, NRanchNum)),
                                    % Cek apakah quest complete
                                    completeQuest.

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
                    BonusH  is HTarget * 250 * HarvestBonus,
                    BonusF  is FTarget * 250 * FishBonus,
                    BonusR  is RTarget * 250 * RanchBonus,
                    TotalBonus is BonusH + BonusR + BonusF,
                    NewGold is OldGold + TotalBonus,
                    % Penambahan EXP belum ditambahkan
                    ExpBonus is 10,
                    asserta(player(A, B, C, D, E, F, G, H, I, NewGold)),
                    retract(isQuest(_)), nl,
                    write('Quest Completed!'), nl, nl,
                    write('You Got:'), nl,
                    format('> ~w Gold', [TotalBonus]), nl,
                    format('> ~w Exp', [ExpBonus]), nl).
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
