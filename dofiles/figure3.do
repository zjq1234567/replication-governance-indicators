

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.


/**************************************************************/
/* 		  	WGI:举例子，相同的WGI得分，但是不同的outcome */
/**************************************************************/
 	
 		use $raw_data/wgidataset.dta, clear   // Here: import your index data 

 		 rename code iso3
		

/**************************************************************/
/* 		  	WGI&V-dem */
/**************************************************************/
 
	merge 1:1 iso3 year using $raw_data/02_rule_of_law.dta
		keep if _m == 3
		drop _m

		preserve 
			drop vae vas van var val vau pve pvs pvn pvr pvl pvu gee ges gen ger gel geu rqe rqs rqn rqr rql rqu
			drop cce ccs ccn ccr ccl ccu

		*埃及和阿根廷在WGI里的rule of law得分一致
		twoway(connected rlr year if iso3 == "ARG" & year >= 2012&year <= 2021 ,sort lc(ltblue)  mc(ltblue) msymbol(triangle)) ///
			(line rll year if iso3 == "ARG" & year >= 2012 &year <= 2021 ,sort lp(dash) lc(ltblue)) ///
			(line rlu year if iso3 == "ARG" & year >= 2012&year <= 2021 ,sort lp(dash) lc(ltblue)) ///
			(connected rlr year if iso3 == "EGY" & year >= 2012&year <= 2021  ,sort lc(orange_red) mc(orange_red) msymbol(circle)) ///
			(line rll year if iso3 == "EGY" & year >= 2012&year <= 2021 ,sort lp(dash) lc(orange_red)) ///
			(line rlu year if iso3 == "EGY" & year >= 2012&year <= 2021 ,sort lp(dash) lc(orange_red)) ///
			,legend(col(3) label(1 "阿根廷") label(2 "90%置信区间上限") label(3 "90%置信区间下限")   ///
				label(4 "埃及") label(5 "90%置信区间下限") label(6 "90%置信区间下限") ///
				size(vsmall) position(6)) xlabel(2012(2)2021) ylabel(0(20)100) xtitle("年份", size(small)) ///
				 ytitle("世界治理指数-法制维度",size(small)) 

			graph export $outputs/figure3_a.png, replace	
			graph save $outputs/figure3_a.gph, replace	 

		
		*埃及和阿根廷在WJP中的得分差异较大
		 twoway(connected overall year if iso3 == "ARG" & year >= 2012&year <= 2021, sort lc(ltblue) mc(ltblue) msymbol(triangle) ) ///
		 		(connected overall year if iso3 == "EGY" & year >= 2012&year <= 2021 ,sort lc(orange_red) mc(orange_red) msymbol(circle)) ///
		 		,xlabel(2012(2)2021) ylabel(0(0.2)1) ///
				legend(col(2) label(1 "阿根廷") label(2 "埃及") size(vsmall) position(6)) ///
		 		 ytitle("世界正义工程法治指数",size(small)) xtitle("年份", size(small))
			graph export $outputs/figure3_b.png, replace	 
			graph save $outputs/figure3_b.gph, replace	


		graph combine $outputs/figure3_a.gph $outputs/figure3_b.gph
		graph export $outputs/figure3.png, replace	 

		erase $outputs/figure3_a.gph
		erase $outputs/figure3_b.gph


