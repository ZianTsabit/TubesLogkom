% ID Consumables yang berhubungan
%  1  -> Tuna
%  2  -> Mackarel
%  3  -> Sardine
%  4  -> Puffer
% ID Item yang berhubungan
%  10 -> Lvl 2 Fishing Rod
%  11 -> Lvl 3 Fishing Rod

% Average Gold Gain per Fishing
%
%           With Bait   Without Bait
% Rod Lvl 1     137.5          96.25
% Rod Lvl 2     151.5         106.50
% Rod Lvl 3     167.5         117.25

% Perlu dicek supaya gakbisa fish kalau inventory full
fish    :-  canFishNearby   ->  (
                                    cekConsumableExist(5, bait) -> fishWithBait;
                                    fishWithoutBait
                                ), (clockAfterFishing; true);
            write('No lake nearby!'), nl.

% X dan Y merupakan koordinat pemain.
% Menandakan bahwa disekitarnya ada tile
% yang bisa dipakai memancing
canFishNearby   :-  player(XP, YP),
                    XR is XP + 1,
                    XL is XP - 1,
                    YU is YP + 1,
                    YD is YP - 1,
                    (
                        canFish(XL, YU);
                        canFish(XL, YP);
                        canFish(XL, YD);
                        canFish(XP, YU);
                        canFish(XP, YD);
                        canFish(XR, YU);
                        canFish(XR, YP);
                        canFish(XR, YD)
                    ).
            

fishWithoutBait :-  random(TrashGacha),
                    (
                        TrashGacha < 0.3 -> (
                            write('You didn\'t get anything...'), nl,
                            % Nambah Fishing Exp
                            expAfter(fish, 1),
                            write('You got 1 exp!'), nl
                        );
                        getFish
                   ), !.

fishWithBait    :-  getFish,
                    deleteConsumable(5, 1).

getFish         :-  (
                        cekItemExist(11, level3_fishing_rod) -> fishWithL3Rod;
                        cekItemExist(10, level2_fishing_rod) -> fishWithL2Rod;
                        fishWithL1Rod
                    ), questAddFish, expAfter(fish, 10), write('You got 10 exp!'), nl.

% Rod Lvl 1
%
% Sardine   = 50%
% Mackarel  = 30%
% Tuna      = 15%
% Puffer    = 5%
% Rata-rata dapat 137.5 Gold
fishWithL1Rod   :-  random(FishRNG),
                    (
                        FishRNG < 0.50 ->   (addConsumable(3, 1), write('You Got a Sardine!'),      nl, ExpGain is 10);
                        FishRNG < 0.80 ->   (addConsumable(2, 1), write('You Got a Mackarel!'),     nl, ExpGain is 20);
                        FishRNG < 0.95 ->   (addConsumable(1, 1), write('You Got a Tuna!'),         nl, ExpGain is 30);
                                            (addConsumable(4, 1), write('You Got a Puffer Fish!'),  nl, ExpGain is 40)
                    ), !.

% Rod Lvl 2
%
% Sardine   = 43%
% Mackarel  = 23%
% Tuna      = 22%
% Puffer    = 12%
% Rata-rata dapat 151.5 Gold
fishWithL2Rod   :-  random(FishRNG),
                    (
                        FishRNG < 0.43 ->   (addConsumable(3, 1), write('You Got a Sardine!'),      nl, ExpGain is 10);
                        FishRNG < 0.66 ->   (addConsumable(2, 1), write('You Got a Mackarel!'),     nl, ExpGain is 20);
                        FishRNG < 0.88 ->   (addConsumable(1, 1), write('You Got a Tuna!'),         nl, ExpGain is 30);
                                            (addConsumable(4, 1), write('You Got a Puffer Fish!'),  nl, ExpGain is 40)
                    ), !.

% Rod Lvl 3
%
% Sardine   = 35%
% Mackarel  = 15%
% Tuna      = 30%
% Puffer    = 20%
% Rata-rata dapat 167.5 Gold
fishWithL3Rod   :-  random(FishRNG),
                    (
                        FishRNG < 0.35 ->   (addConsumable(3, 1), write('You Got a Sardine!'),      nl, ExpGain is 10);
                        FishRNG < 0.50 ->   (addConsumable(2, 1), write('You Got a Mackarel!'),     nl, ExpGain is 20);
                        FishRNG < 0.80 ->   (addConsumable(1, 1), write('You Got a Tuna!'),         nl, ExpGain is 30);
                                            (addConsumable(4, 1), write('You Got a Puffer Fish!'),  nl, ExpGain is 40)
                    ), !.

help_fishing        :-  write('======================== Fishing Guide ====================='), nl,
                        write('Steps:'), nl,
                        write('1. Go near a lake'), nl,
                        write('2. When fishing without a bait, there is 30% chance to not get anything'), nl,
                        write('3. Fishing with a bait guarantees catching a fish'), nl,
                        write('4. Bait is automatically consumed when fishing'), nl,
                        write('Command:'), nl,
                        write('1. fish'), nl.

