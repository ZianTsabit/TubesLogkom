/****    FAKTA DAN RULE TIAP ROLE ****/

/**  VALID ROLE **/

validJob(fisherman).
validJob(farmer).
validJob(rancher).

jobID(fisherman,1).
jobID(farmer,2).
jobID(rancher,3).

/***    FAKTA DAN RULE ITEM   ***/
/* item(ID, nama, job). {belum tahu lagi apa} */


/* ITEM FISHERMAN */
item(1,fishing_rod,fisherman).


/* ITEM FARMER */
item(1,shovel,farmer).
item(2,watering_can,farmer).


/* ITEM RANCHER */
item(1, milking_equipment, rancher).
item(2, scissors, rancher).


/***    FAKTA DAN RULE CONSUMABLE   ***/
/* consumable(ID, nama) {belum tahu lagi apa} */

/* CONSUMABLE FISHERMAN */
consumable(1, tuna_fish).
consumable(2, mackerel_fish).
consumable(3, sardines_fish).
consumable(4, puffer_fish).


/* CONSUMABLE FARMER */
consumable(5, chili_seed).
consumable(6, paddy_seed).
consumable(7, tomato_seed).
consumable(8, pineapple_seed).
consumable(9, strawberry_seed).

/* CONSUMABLE RANCHER */
consumable(10, chicken_feed).
consumable(11, sheep_feed).
consumable(12, cow_feed).
consumable(13, horse_feed).