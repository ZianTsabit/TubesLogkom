

:- dynamic(isPlant/2).
:- dynamic(dayPlant/2).
:- dynamic(waterLevel/2).

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
       expAfter(farm,10),
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

plant_chili :- isStarted(_),isPlant(_),day(Z),
         ((\+cekConsumableExist(6, chili_seed),
         write('You do not have chili seeds'));
         (cekConsumableExist(6, chili_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(chili(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(chili,Z)),
         asserta(waterLevel(chili,1)),
         deleteConsumable(6, 1),
         write('You planted a chili seeds.'),
         retract(isPlant(_)))),expAfter(farm,15),!.

plant_paddy :- isStarted(_),isPlant(_),day(Z),
         ((\+cekConsumableExist(7, paddy_seed),
         write('You do not have paddy seeds'));
         (cekConsumableExist(7, paddy_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(paddy(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(paddy,Z)),
         asserta(waterLevel(paddy,1)),
         deleteConsumable(7, 1),
         write('You planted a paddy seeds.'),
         retract(isPlant(_)))),expAfter(farm,15),!.

plant_tomato :- isStarted(_),isPlant(_),day(Z),
         ((\+cekConsumableExist(8, tomato_seed),
         write('You do not have tomato seeds'));
         (cekConsumableExist(8, tomato_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(tomato(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(tomato,Z)),
         asserta(waterLevel(tomato,1)),
         deleteConsumable(8, 1),
         write('You planted a tomato seeds.'),
         retract(isPlant(_)))),expAfter(farm,15),!.

plant_pineapple :- isStarted(_),isPlant(_),day(Z),
         ((\+cekConsumableExist(9, pineapple_seed),
         write('You do not have pineapple seeds'));
         (cekConsumableExist(9, pineapple_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(pineapple(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(pineapple,Z)),
         asserta(waterLevel(pineapple,1)),
         deleteConsumable(9, 1),
         write('You planted a pineapple seeds.'),
         retract(isPlant(_)))),expAfter(farm,15),!.

plant_strawberry :- isStarted(_),isPlant(_),day(Z),
         ((\+cekConsumableExist(10, strawberry_seed),
         write('You do not have strawberry seeds'));
         (cekConsumableExist(10, strawberry_seed),player(X,Y),
         Y1 is Y - 1,
         retract(digged(X,Y1)),
         asserta(strawberry(X,Y1)),
         asserta(isPlant(X,Y1)),
         asserta(dayPlant(strawberry,Z)),
         asserta(waterLevel(strawberry,1)),
         deleteConsumable(10, 1),
         write('You planted a strawberry seeds.'),
         retract(isPlant(_)))),expAfter(farm,15),!.


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
            (strawberry(X,Y1) -> harvest_strawberry);
            ((\+chili(X,Y1),\+paddy(X,Y1),\+tomato(X,Y1),\+pineapple(X,Y1),\+strawberry(X,Y1)) -> write('Invalid input'))
           ),
           clockAfterFarming,!.


harvest_chili :- player(X,Y), 
                 Y1 is Y-1,
                 timetoGrow(chili_seed, V),
                 dayPlant(chili, Z),
                 day(W),
                 Total is W - Z,
                 waterLevel(chili, A),
                 ( 
                 ((Total < V) -> 
                 write('You can not harvest chili now!'));
                 ( 
                 ((Total >= V) -> 
                        ( (( A < Total ) -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),retract(chili(X,Y1)),
                                            retract(isPlant(X,Y1)));
                          (( A >= Total) -> (capacity(X1),
                                            Sum is X1 + 1,
                                            (((Sum =< 100) -> 
                                            (addConsumable(23, 1),
                                            write('You harvested chili.'),
                                            retract(chili(X,Y1)),
                                            retract(isPlant(X,Y1)),
                                            expAfter(farm,15),
                                            questAddHarvest));
                                            ((Sum > 100) -> write('Can not harvest this crops !!'),nl,write( 'Your inventory is full!'))))
                                          )
                        )
                 ))),!.

harvest_paddy :- player(X,Y), 
                 Y1 is Y-1,
                 timetoGrow(paddy_seed, V),
                 dayPlant(paddy, Z),
                 day(W),
                 Total is W - Z,
                 waterLevel(paddy, A),
                 ( 
                 ((Total < V) -> 
                 write('You can not harvest paddy now!'));
                 ( 
                 ((Total >= V) -> 
                        ( (( A < Total ) -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),retract(paddy(X,Y1)),
                                            retract(isPlant(X,Y1)));
                          (( A >= Total) -> (capacity(X1),
                                            Sum is X1 + 1,
                                            (((Sum =< 100) -> 
                                            (addConsumable(24, 1),
                                            write('You harvested paddy.'),
                                            retract(paddy(X,Y1)),
                                            retract(isPlant(X,Y1)),
                                            expAfter(farm,15),
                                            questAddHarvest));
                                            ((Sum > 100) -> write('Can not harvest this crops !!'),nl,write( 'Your inventory is full!'))))
                                          )
                        )
                 ))),!.

harvest_tomato :- player(X,Y), 
                  Y1 is Y-1,
                  timetoGrow(tomato_seed, V),
                  dayPlant(tomato, Z),
                  day(W),
                  Total is W - Z,
                  waterLevel(tomato, A),
                 ( 
                 ((Total < V) -> 
                 write('You can not harvest tomato now!'));
                 ( 
                 ((Total >= V) -> 
                        ( (( A < Total ) -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),retract(tomato(X,Y1)),
                                            retract(isPlant(X,Y1)));
                          (( A >= Total) -> (capacity(X1),
                                            Sum is X1 + 1,
                                            (((Sum =< 100) -> 
                                            (addConsumable(25, 1),
                                            write('You harvested tomato.'),
                                            retract(tomato(X,Y1)),
                                            retract(isPlant(X,Y1)),
                                            expAfter(farm,15),
                                            questAddHarvest));
                                            ((Sum > 100) -> write('Can not harvest this crops !!'),nl,write( 'Your inventory is full!'))))
                                          )
                        )
                 ))),!.

harvest_pineapple :- player(X,Y), 
                     Y1 is Y-1,
                     timetoGrow(pineapple_seed, V),
                     dayPlant(pineapple, Z),
                     day(W),
                     Total is W - Z,
                     waterLevel(pineapple, A),
                     ( 
                     ((Total < V) -> 
                     write('You can not harvest pineapple now!'));
                     ( 
                     ((Total >= V) -> 
                        ( (( A < Total ) -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),retract(pineapple(X,Y1)),
                                            retract(isPlant(X,Y1)));
                          (( A >= Total) -> (capacity(X1),
                                            Sum is X1 + 1,
                                            (((Sum =< 100) -> 
                                            (addConsumable(26, 1),
                                            write('You harvested pineapple.'),
                                            retract(pineapple(X,Y1)),
                                            retract(isPlant(X,Y1)),
                                            expAfter(farm,15),
                                            questAddHarvest));
                                            ((Sum > 100) -> write('Can not harvest this crops !!'),nl,write( 'Your inventory is full!'))))
                                          )
                        )
                     ))),!.

harvest_strawberry :- player(X,Y), 
                      Y1 is Y-1,
                      timetoGrow(strawberry_seed, V),
                      dayPlant(strawberry, Z),
                      day(W),
                      Total is W - Z,
                      waterLevel(strawberry, A),
                      ( 
                      ((Total < V) -> 
                      write('You can not harvest strawberry now!'));
                      ( 
                      ((Total >= V) -> 
                        ( (( A < Total ) -> write('Your crops is broken'),nl,write('Please give your crops water regularly!'),strawberry(chili(X,Y1)),
                                            retract(isPlant(X,Y1)));
                          (( A >= Total) -> (capacity(X1),
                                            Sum is X1 + 1,
                                            (((Sum =< 100) -> 
                                            (addConsumable(23, 1),
                                            write('You harvested strawberry.'),
                                            retract(strawberry(X,Y1)),
                                            retract(isPlant(X,Y1)),
                                            expAfter(farm,15),
                                            questAddHarvest));
                                            ((Sum > 100) -> write('Can not harvest this crops !!'),nl,write( 'Your inventory is full!'))))
                                          )
                        )
                      ))),!.

watering :- \+isStarted(_), write('You have to start your game first!'),!.
watering :- isStarted(_), player(X,Y) ,\+canWater(X,Y), write('You can not watering right here!'),!.
watering :- isStarted(_), player(X,Y), Y1 is Y - 1,
            canWater(X,Y1),
            (
            (chili(X,Y1) -> waterLevel(chili,Z),Z1 is Z + 1,retract(waterLevel(chili,Z)),asserta(waterLevel(chili,Z1)), write('You are watering chili.'));
            (paddy(X,Y1) -> waterLevel(paddy,Z),Z1 is Z + 1,retract(waterLevel(paddy,Z)),asserta(waterLevel(paddy,Z1)), write('You are watering paddy.'));
            (tomato(X,Y1) -> waterLevel(tomato,Z),Z1 is Z + 1,retract(waterLevel(tomato,Z)),asserta(waterLevel(tomato,Z1)), write('You are watering tomato.'));
            (pineapple(X,Y1) -> waterLevel(pineapple,Z),Z1 is Z + 1,retract(waterLevel(pineapple,Z)),asserta(waterLevel(pineapple,Z1)), write('You are watering pineapple.'));
            (strawberry(X,Y1) -> waterLevel(strawberry,Z),Z1 is Z + 1,retract(waterLevel(strawberry,Z)),asserta(waterLevel(strawberry,Z1)), write('You are watering strawberry.'))
            ),expAfter(farm,10),clockAfterFarming,!.
         
















