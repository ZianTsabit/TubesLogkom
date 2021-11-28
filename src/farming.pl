

:- dynamic(isPlant/2).
:- dynamic(dayPlant/3).
:- dynamic(waterLevel/3).

dig :- \+isStarted(_), write('You have to start your game first!'),!.
dig :- player(X,Y), \+canDig(X,Y),
       write('You can not dig right here !'),!.

dig :- player(X,Y),canDig(X,Y),
       ((cekItemExist(7, level3_shovel),
                X1 is X + 1,
                X2 is X - 1, 
                asserta(digged(X,Y)),
                asserta(digged(X1,Y)),
                asserta(digged(X2,Y)));
       (\+cekItemExist(7, level3_shovel),
                ((cekItemExist(6, level2_shovel),
                X1 is X + 1, 
                asserta(digged(X,Y)),
                asserta(digged(X1,Y)));
                (\+cekItemExist(6, level2_shovel), 
                asserta(digged(X,Y)))
                ))
        ),
       write('You digged the tile.'),
       expAfter(farm,5),
       (clockAfterFarming;w),!.        


/*
c = chili
v = paddy
t = tomato
n = pineapple
s = strawberry
*/

plant :- \+isStarted(_), write('You have to start your game first!'),!.

plant :- player(X,Y), 
         Y1 is Y-1,
         \+digged(X,Y1),
         write('You can not plant here!'),!.

plant :- player(X,Y), 
         Y1 is Y-1,
         digged(X,Y1),
         write('You have : '),nl,
         listConsumable,
         write('What do you want to plant?'),nl,
         asserta(isPlant(true)),
         write('> '),read(Choice),
         ((Choice = chili -> plant_chili);
         (Choice = paddy -> plant_paddy);
         (Choice =  tomato -> plant_tomato);
         (Choice = pineapple -> plant_pineapple);
         (Choice = strawberry -> plant_strawberry);
         ((\+chili(X,Y1),\+paddy(X,Y1),\+tomato(X,Y1),\+pineapple(X,Y1),\+strawberry(X,Y1)) -> write('Invalid input'))
         ),
         clockAfterFarming,!.

plant_chili :- isStarted(_),day(Z),
         ((\+cekConsumableExist(6, chili_seed),
         write('You do not have chili seeds'));
         (cekConsumableExist(6, chili_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(chili(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(X,Y1,Z)),
         asserta(waterLevel(X,Y1,1)),
         deleteConsumable(6, 1),
         write('You planted a chili seeds.')
         )),expAfter(farm,5),!.

plant_paddy :- isStarted(_),day(Z),
         ((\+cekConsumableExist(7, paddy_seed),
         write('You do not have paddy seeds'));
         (cekConsumableExist(7, paddy_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(paddy(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(X,Y1,Z)),
         asserta(waterLevel(X,Y1,1)),
         deleteConsumable(7, 1),
         write('You planted a paddy seeds.')
         )),expAfter(farm,5),!.

plant_tomato :- isStarted(_),day(Z),
         ((\+cekConsumableExist(8, tomato_seed),
         write('You do not have tomato seeds'));
         (cekConsumableExist(8, tomato_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(tomato(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(X,Y1,Z)),
         asserta(waterLevel(X,Y1,1)),
         deleteConsumable(8, 1),
         write('You planted a tomato seeds.')
         )),expAfter(farm,5),!.

plant_pineapple :- isStarted(_),day(Z),
         ((\+cekConsumableExist(9, pineapple_seed),
         write('You do not have pineapple seeds'));
         (cekConsumableExist(9, pineapple_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(pineapple(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(X,Y1,Z)),
         asserta(waterLevel(X,Y1,1)),
         deleteConsumable(9, 1),
         write('You planted a pineapple seeds.')
         )),expAfter(farm,5),!.

plant_strawberry :- isStarted(_),day(Z),
         ((\+cekConsumableExist(10, strawberry_seed),
         write('You do not have strawberry seeds'));
         (cekConsumableExist(10, strawberry_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(strawberry(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(X,Y1,Z)),
         asserta(waterLevel(X,Y1,1)),
         deleteConsumable(10, 1),
         write('You planted a strawberry seeds.')
         )),expAfter(farm,5),!.


harvest :- \+isStarted(_), write('You have to start your game first!'),!.
harvest :- player(X,Y), 
           Y1 is Y-1,
           ((\+chili(X,Y1),\+paddy(X,Y1),\+tomato(X,Y1),\+pineapple(X,Y1),\+strawberry(X,Y1)),
           write('There is no plant here!')),!.

harvest :- player(X,Y), 
           Y1 is Y-1,
           ((chili(X,Y1) -> harvest_chili);
            (paddy(X,Y1) -> harvest_paddy);
            (tomato(X,Y1) -> harvest_tomato);
            (pineapple(X,Y1) -> harvest_pineapple);
            (strawberry(X,Y1) -> harvest_strawberry)
           ),
           clockAfterFarming,!.

harvest_chili :- player(X,Y),
                 Down is Y-1,
                 timetoGrow(chili_seed, Daygrow),
                 dayPlant(X,Down,Z),
                 day(Current),
                 Ageplant is Current-Z,
                 waterLevel(X,Down,A),
                 ( 
                 ((Ageplant < Daygrow) -> 
                 write('You can not harvest chili now!'));
                 ( 
                 ((Ageplant >= Daygrow) -> 
                        ( ( A < Ageplant  -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),
                                            retract(chili(X,Down)),
                                            retract(isPlant(X,Down)));
                          ( A >= Ageplant -> (addConsumable(23, 1) -> 
                                            write('You harvested chili.'),
                                            retract(chili(X,Down)),
                                            retract(isPlant(X,Down)),
                                            expAfter(farm,10),
                                            retract(waterLevel(X,Down,A)),
                                            retract(dayPlant(X,Down,Z)),
                                            questAddHarvest)
                                          )
                        )
                 ))),!.

harvest_paddy :- player(X,Y),
                 Down is Y-1,
                 timetoGrow(paddy_seed, Daygrow),
                 dayPlant(X,Down,Z),
                 day(Current),
                 Ageplant is Current-Z,
                 waterLevel(X,Down,A),
                 ( 
                 ((Ageplant < Daygrow) -> 
                 write('You can not harvest paddy now!'));
                 ( 
                 ((Ageplant >= Daygrow) -> 
                        ( ( A < Ageplant  -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),
                                            retract(paddy(X,Down)),
                                            retract(isPlant(X,Down)));
                          ( A >= Ageplant -> (addConsumable(24, 1) -> 
                                            write('You harvested paddy.'),
                                            retract(paddy(X,Down)),
                                            retract(isPlant(X,Down)),
                                            expAfter(farm,10),
                                            retract(waterLevel(X,Down,A)),
                                            retract(dayPlant(X,Down,Z)),
                                            questAddHarvest)
                                          )
                        )
                 ))),!.

harvest_tomato :- player(X,Y),
                 Down is Y-1,
                 timetoGrow(tomato_seed, Daygrow),
                 dayPlant(X,Down,Z),
                 day(Current),
                 Ageplant is Current-Z,
                 waterLevel(X,Down,A),
                 ( 
                 ((Ageplant < Daygrow) -> 
                 write('You can not harvest tomato now!'));
                 ( 
                 ((Ageplant >= Daygrow) -> 
                        ( ( A < Ageplant  -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),
                                            retract(tomato(X,Down)),
                                            retract(isPlant(X,Down)));
                          ( A >= Ageplant -> (addConsumable(25, 1) -> 
                                            write('You harvested tomato.'),
                                            retract(tomato(X,Down)),
                                            retract(isPlant(X,Down)),
                                            expAfter(farm,10),
                                            retract(waterLevel(X,Down,A)),
                                            retract(dayPlant(X,Down,Z)),
                                            questAddHarvest)
                                          )
                        )
                 ))),!.

harvest_pineapple :- player(X,Y),
                 Down is Y-1,
                 timetoGrow(pineapple_seed, Daygrow),
                 dayPlant(X,Down,Z),
                 day(Current),
                 Ageplant is Current-Z,
                 waterLevel(X,Down,A),
                 ( 
                 ((Ageplant < Daygrow) -> 
                 write('You can not harvest pineapple now!'));
                 ( 
                 ((Ageplant >= Daygrow) -> 
                        ( ( A < Ageplant  -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),
                                            retract(pineapple(X,Down)),
                                            retract(isPlant(X,Down)));
                          ( A >= Ageplant -> (addConsumable(26, 1) -> 
                                            write('You harvested pineapple.'),
                                            retract(pineapple(X,Down)),
                                            retract(isPlant(X,Down)),
                                            expAfter(farm,10),
                                            retract(waterLevel(X,Down,A)),
                                            retract(dayPlant(X,Down,Z)),
                                            questAddHarvest)
                                          )
                        )
                 ))),!.

harvest_strawberry :- player(X,Y),
                 Down is Y-1,
                 timetoGrow(strawberry_seed, Daygrow),
                 dayPlant(X,Down,Z),
                 day(Current),
                 Ageplant is Current-Z,
                 waterLevel(X,Down,A),
                 ( 
                 ((Ageplant < Daygrow) -> 
                 write('You can not harvest strawberry now!'));
                 ( 
                 ((Ageplant >= Daygrow) -> 
                        ( ( A < Ageplant  -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),
                                            retract(strawberry(X,Down)),
                                            retract(isPlant(X,Down)));
                          ( A >= Ageplant -> (addConsumable(27, 1) -> 
                                            write('You harvested strawberry.'),
                                            retract(strawberry(X,Down)),
                                            retract(isPlant(X,Down)),
                                            expAfter(farm,10),
                                            retract(waterLevel(X,Down,A)),
                                            retract(dayPlant(X,Down,Z)),
                                            questAddHarvest)
                                          )
                        )
                 ))),!.

watering :- \+isStarted(_), write('You have to start your game first!'),!.
watering :- isStarted(_), player(X,Y) ,\+canWater(X,Y), write('You can not watering right here!'),!.
watering :- isStarted(_), 
            player(X,Y), Y1 is Y - 1,
            canWater(X,Y1),
            ( (isPlant(X,Y1) -> waterLevel(X,Y1,Z),
                              Z1 is Z + 1,
                              retract(waterLevel(X,Y1,_)),
                              asserta(waterLevel(X,Y1,Z1)),
                              write('You are watering'),
                              expAfter(farm,2));
              (\+isPlant(X,Y1) -> write('Do not waste water!')))
            ,clockAfterFarming,!.

help_farming        :- write('======================== Farming Guide ====================='),nl,
                       write('Steps: '),nl,
                       write('1. Dig a tile.'),nl,
                       write('2. Plant any seeds that you have.'),nl,
                       write('3. Give your plant water until plant ready to harvest.'),nl,
                       write('Growth Time: '),nl,
                       write('1. Chili seeds     : 5  days'),nl,
                       write('2. Paddy seed      : 4  days'),nl,
                       write('3. Tomato seed     : 7  days'),nl,
                       write('4. Pineapple seed  : 10 days'),nl,
                       write('5. Strawberry seed : 8  days'),nl,
                       write('Command:\n(Run this command when the plant position in the south of your position)'),nl,
                       write('1. dig.'),nl,
                       write('2. plant.'),nl,
                       write('3. harvest.'),nl,
                       write('4. watering.'),!.  
















