/****    FAKTA DAN RULE TIAP ROLE ****/

/**  VALID ROLE **/

validJob(fisherman).
validJob(farmer).
validJob(rancher).

jobID(fisherman,1).
jobID(farmer,2).
jobID(rancher,3).

/***    FAKTA DAN RULE ITEM   ***/
/* item(ID, Nama, JobItem). {belum tahu lagi apa} */


/* ITEM FISHERMAN */
item(1,fishing_rod,fisherman).


/* ITEM FARMER */
item(2,shovel,farmer).
item(3,watering_can,farmer).


/* ITEM RANCHER */
item(4, milking_equipment, rancher).
item(5, scissors, rancher).

/* ITEM UPGRADE*/
item(6, level2_shovel, farmer).
item(7, level3_shovel, farmer).
item(8, level2_watering_can, farmer).
item(9, level3_watering_can, farmer).
item(10, level2_fishing_rod, fisherman).
item(11, level3_fishing_rod, fisherman).



/***    FAKTA DAN RULE CONSUMABLE   ***/
/* consumable(ID, nama) {belum tahu lagi apa} */

/* CONSUMABLE FISHERMAN */
consumable(1, tuna_fish).
consumable(2, mackerel_fish).
consumable(3, sardines_fish).
consumable(4, puffer_fish).
consumable(5, bait).


/* CONSUMABLE FARMER */
consumable(6, chili).
consumable(7, paddy).
consumable(8, tomato).
consumable(9, pineapple).
consumable(10, strawberry).

/* CONSUMABLE RANCHER */
consumable(11, chicken_feed).
consumable(12, sheep_feed).
consumable(13, cow_feed).
consumable(14, horse_feed).
consumable(15, chicken).
consumable(16, sheep).
consumable(17, cow).
consumable(18, horse).
consumable(19, eggs).
consumable(20, milk).
consumable(21, horse_milk).
consumable(22, wool).

/*    FAKTA DAN RULE PRICE TIAP ITEM DAN CONSUMABLES */

/* ITEM */
/* price(item or consumable, nominal)*/

price(chili, 100).
price(paddy, 50).
price(tomato, 100).
price(pineapple, 200).
price(strawberry, 150).
price(chicken_feed, 150).
price(sheep_feed, 175).
price(cow_feed, 200).
price(horse_feed, 225).
price(bait, 15).
price(chicken, 250).
price(sheep, 350).
price(cow, 750).
price(horse, 1000).
price(level2_shovel, 500).
price(level3_shovel, 750).
price(level2_watering_can, 300).
price(level3_watering_can, 550).
price(level2_fishing_rod, 500).
price(level3_fishing_rod, 700).

/* Consumables */
/*sellprice(consumable, nominal)*/

sellprice(chili, 300).
sellprice(tomato, 275).
sellprice(strawberry, 350).
sellprice(paddy, 250).
sellprice(pineapple, 450).
sellprice(milk, 75).
sellprice(eggs, 50).
sellprice(wool, 100).
sellprice(horse_milk, 80).
sellprice(chicken, 400).
sellprice(sheep, 600).
sellprice(cow, 1100).
sellprice(horse, 1500).
sellprice(tuna_fish, 200).
sellprice(mackerel_fish, 150).
sellprice(sardines_fish, 100).
sellprice(puffer_fish, 250).