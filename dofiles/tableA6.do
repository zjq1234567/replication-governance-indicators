

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.

/**************************************************************/
/* 		  	Clear  data	  */
/**************************************************************/
 	
 	use "$raw_data/02_rule_of_law.dta",clear 
 	*merge polity2 score
	merge 1:1 iso3 year using $raw_data/p5v2018_iso3.dta //到2018年	
		drop _merge 

**************************************************************
***********************Run regression **************************
**************************************************************

	 reghdfe overall polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel replace dec(3)    keep(polity2)

	 reghdfe gov_con polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe abs_cor polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe ope_gov polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe rights polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe order polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe enf polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe civ_jus polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

	 reghdfe cri_jus polity2 ,a(iso3 year) cluster(iso3)
	 outreg2 using $outputs/tableA6, excel append dec(3)    keep(polity2)

