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
item(1, perah_susu, rancher).
item(2, gunting_bulu, rancher).


/***    FAKTA DAN RULE CONSUMABLE   ***/
/* consumable(ID, nama) {belum tahu lagi apa} */

/* CONSUMABLE FISHERMAN */
consumable(1, tuna).
consumable(2, tenggiri).
consumable(3, sarden).
consumable(4, buntal).


/* CONSUMABLE FARMER */
consumable(5, bibit_cabai).
consumable(6, bibit_padi).
consumable(7, bibit_tomat).
consumable(8, bibit_nanas).
consumable(9, bibit_strawberry).

/* CONSUMABLE RANCHER */
consumable(10, pakan_ayam).
consumable(10, pakan_domba).
consumable(10, pakan_sapi).
consumable(10, pakan_kuda).