
**************************************************************
**********************Set Relative Path***********************
**************************************************************
	clear all              // remove everything from the memory, refresh. 

	cap log close         // close any open log file.

	set more off          // show the result all at once.




**************************************************************
***************Import data and Define groups***************
**************************************************************
	use $raw_data/10_vdem.dta, clear   // Here: import your index data 
	rename (country_text_id country_name) (code countryname)
	


	
	********Step1: Adjust country code to ISO3  ******
		
		*merge m:1 using "$raw_data/iso3_dta"   // Here: unify the country code style

		rename code iso3 
	//drop duplicates,keeping the latest record within one year
	sort iso3 year historical
	drop if iso3==iso3[_n+1] & year==year[_n+1]
	
	//keep if year>1995

	********Step2: Merge group data ******

		*1.policy2 score
			merge 1:1 iso3 year using $raw_data/p5v2018_iso3.dta 	//  194 countries,1800-2018; 169 after 1996
				drop _merge 

			encode iso3, generate(countrycode)  //for xtset 
			xtset countrycode year

			* We use the Polity2 score in 2018 to replace the missing values in 2019 and 2020, assuming that the Polity2 score would be stable two years after 2018 
				replace polity2 = L.polity2 if year == 2019 & polity2 == .
				replace polity2 = L.polity2 if year == 2020 & polity2 == .
				replace polity2 = L.polity2 if year == 2021 & polity2 == .

		*2.income level 
			merge 1:1 iso3 year using $raw_data/country_income.dta 	 // 266 countries,1960-2021
				drop _merge

		*3.income thresholds
			merge m:1 year using $raw_data/country_income_thresholds.dta // 1989-2021 	
				drop _merge 

	********Step3: Generate groups for figure plotting ******

		*1.Democracy vs Non-democracy vs China
			gen dem = .
				replace dem = 0 if iso3 == "CHN"
				replace dem = 1 if (polity2 >= 0) & iso3 != "CHN" //democracy
				replace dem = 2 if (polity2 < 0 ) & iso3 != "CHN" //non-democracy

				label var dem "2-nondemocracy; 1-democracy; 0-china"


		*2.Income group, refer to Wolrd Bank
			gen income_group = . 
				replace income_group = 0 if iso3 == "CHN"
				replace income_group = 1 if (gniper2>thresh3) & income_group ==.  //high-income  
				replace income_group = 2 if (gniper2<=thresh3 & gniper2>thresh2) & income_group == . //upper middle 
				replace income_group = 3 if (gniper2<=thresh2 & gniper2>thresh1) & income_group == .   //lower middle 
				replace income_group = 4 if (gniper2<=thresh1) //low-income 
				replace income_group = . if gniper2 ==. 

				label var income_group "1-high; 2-uppermiddle; 3-lowermiddle; 4-low; 0-China"


		*3.Developed bs developing , refer to Wolrd Bank
			gen dev = . 
				replace dev = 0 if iso3 == "CHN"
				replace dev = 1 if income_group == 1 //developed country
				replace dev = 2 if income_group == 2 | income_group == 3 | income_group == 4 // developing country


				label var dev "1-developed; 2-developing; 0-China"
	
	global index_var "v2x_polyarchy v2x_libdem v2x_partipdem v2x_delibdem v2x_egaldem v2x_liberal v2x_partip v2xdl_delib v2x_egal " //Here: Here: change the item varlist 
	 
	label var v2x_polyarchy "选举民主指数"
	label var v2x_libdem "自由民主指数"
	label var v2x_partipdem "参与民主指数"
	label var v2x_delibdem "审议民主指数"
	label var v2x_egaldem "平等民主指数"
		 
	label var v2x_polyarchy_codelow "选举民主指数"
	label var v2x_libdem_codelow "自由民主指数"
	label var v2x_partipdem_codelow "参与民主指数"
	label var v2x_delibdem_codelow "审议民主指数"
	label var v2x_egaldem_codelow "平等民主指数"
		 
	label var v2x_polyarchy_codehigh "选举民主指数"
	label var v2x_libdem_codehigh "自由民主指数"
	label var v2x_partipdem_codehigh "参与民主指数"
	label var v2x_delibdem_codehigh "审议民主指数"
	label var v2x_egaldem_codehigh "平等民主指数"
	
	
	
	
	* update frequency
	global freq_list "v2x_polyarchy v2x_liberal v2x_partip v2xdl_delib v2x_egal"
	sort iso3 year
	keep iso3 year $freq_list
	keep if year>2000
	foreach i of global freq_list {
	by iso3, sort: egen count_`i'=count(`i')
	ge freq_`i'=21/count_`i'
	}
	drop if count_v2x_liberal == 0 & count_v2x_partip == 0 &  count_v2xdl_delib == 0 & count_v2x_egal == 0
	
	preserve
	keep iso3 count* freq*
	duplicates drop
	
	
	graph box freq_v2x_polyarchy freq_v2x_liberal freq_v2x_partip freq_v2xdl_delib freq_v2x_egal, ///
	noout graphregion(color(white)) ytitle("更新频率") note("") ///
	legend(label(1 "选举")  label(2 "自由") label(3 "参与") label(4 "审议") label(5 "平等")  col(3) position(6) region(lstyle(solid) lcolor(black))) scheme(cleanplots)
					
	graph export $outputs/figureA1.png,  replace	

	restore			
	
	
	

	preserve
	keep iso3 year
	keep if year>2000
	save $working_data/10_vdem/iso3_year_list.dta, replace
	restore
	
	* take difference
	foreach i of global freq_list  {
	preserve
	keep iso3 year `i' 
	sort iso3 year 
	keep if year>2000
	drop if `i'==.
	ge diff_`i'=`i'-`i'[_n-1] if iso3==iso3[_n-1]
	keep iso3 year  diff_`i' 
	save $working_data/10_vdem/diff_`i'.dta, replace
	restore
	}
	
	foreach i of global freq_list  {
	preserve
	keep iso3 year `i'
	sort iso3 year 
	keep if year>2000
	ge missing=`i'==. 
	replace `i'=`i'[_n-1] if iso3==iso3[_n-1] & `i'==. & `i'[_n-1]!=.  //填补缺失值用于排序
	
	drop if `i'==. 
	by year, sort: egen rank_`i'=rank(`i'), field //rank in each year
	drop if missing==. //计算排序变化的时候，不用填补过的obs
	sort iso3 year
	ge diff_rank_`i'=rank_`i'-rank_`i'[_n-1] if  iso3==iso3[_n-1]
	keep iso3 year  diff_rank_`i'
	save $working_data/10_vdem/diff_rank_`i'.dta, replace
	restore
	}
	
	
	//保留最旧和最新的指数，对比
	foreach i of global freq_list  {
	preserve
	keep iso3 year `i' 
	sort iso3 year 
	keep if year>2000
	drop if `i'==.
	ge temp=1
	by iso3, sort: gen count=sum(temp)
	by iso3, sort: egen max_count=max(count)
	keep if count==1 | count==max_count
	replace count=2 if count==max_count
	keep iso3 `i' count

	reshape wide `i' ,i(iso3) j(count)
	
	rename (`i'1 `i'2 ) (`i'_oldest `i'_latest )
	
	
	save $working_data/10_vdem/diff_long_`i'.dta, replace
	restore
	}
	
	//保留最旧和最新的指数，对比 rank
	foreach i of global freq_list  {
	preserve
	keep iso3 year `i' 
	sort iso3 year 
	keep if year>2000
	replace `i'=`i'[_n-1] if iso3==iso3[_n-1] & `i'==. & `i'[_n-1]!=.  //填补缺失值用于排序
	drop if `i'==.
	by year, sort: egen rank_`i'=rank(`i'), field //rank in each year

	ge temp=1
	by iso3, sort: gen count=sum(temp)
	by iso3, sort: egen max_count=max(count)
	keep if count==1 | count==max_count
	replace count=2 if count==max_count
	keep iso3  rank_`i' count
	

	reshape wide  rank_`i',i(iso3) j(count)
	
	rename ( rank_`i'1 rank_`i'2) (rank_`i'_oldest rank_`i'_latest)
	
	save $working_data/10_vdem/diff_long_rank_`i'.dta, replace
	restore
	}
	
	
	
	preserve 
	use $working_data/10_vdem/iso3_year_list.dta, replace
	
	foreach i of global freq_list {
	merge 1:1 iso3 year using $working_data/10_vdem/diff_`i'.dta
	drop _merge
	merge 1:1 iso3 year using $working_data/10_vdem/diff_rank_`i'.dta
	drop _merge
	merge m:1 iso3 using $working_data/10_vdem/diff_long_`i'.dta
	drop _merge
	merge m:1 iso3 using $working_data/10_vdem/diff_long_rank_`i'.dta
	drop _merge
	}
	
	
	
	graph box diff_v2x_polyarchy diff_v2x_liberal diff_v2x_partip diff_v2xdl_delib diff_v2x_egal, ///
	noout graphregion(color(white) lcolor(white)) ytitle("更新幅度") note("") ///
		legend(label(1 "选举")  label(2 "自由") label(3 "参与") label(4 "审议") label(5 "平等")  col(3) position(6) region(lstyle(solid) lcolor(black))) scheme(cleanplots)
					
	graph export $outputs/figure7A.png,  replace
	
	graph box diff_rank_v2x_polyarchy diff_rank_v2x_liberal diff_rank_v2x_partip diff_rank_v2xdl_delib diff_rank_v2x_egal, ///
	noout graphregion(color(white) lcolor(white)) ytitle("更新幅度") note("") ///
	m(1,msize(vtiny)) m(2,msize(vtiny)) m(3,msize(vtiny)) m(4,msize(vtiny)) m(5,msize(vtiny)) ///
		legend(label(1 "选举")  label(2 "自由") label(3 "参与") label(4 "审议") label(5 "平等") col(3) position(6) region(lstyle(solid) lcolor(black))) scheme(cleanplots)
	
	graph export $outputs/figure7B.png,   replace
	
	keep iso3 *oldest *latest
	duplicates drop
	
	
	
	foreach i of global freq_list {
	
	ge `i'_fit=`i'_oldest
	ge rank_`i'_fit=rank_`i'_oldest

	tw (scatter `i'_latest  `i'_oldest, msize(small) msymbol(circle_hollow)) ///
	(lfit `i'_latest  `i'_oldest, lpattern(solid)) ///
	(lfit `i'_fit  `i'_oldest, lcolor(black)  lpattern(dash)) , ///
	graphregion(fcolor(white) lcolor(white)) xtitle(起始值) ytitle(最新值) ///
	legend(label(1 "散点") label(2 "拟合线") label(3 "45度线") position(6) col(2) region(lstyle(solid) lcolor(black))) scheme(cleanplots) /// 
	xlabel(0(0.2)1) ylabel(0(0.2)1)
	
	if "`i'" == "v2x_polyarchy" {
		graph export $outputs/figure8A.png,  replace
	}

	graph export $outputs/figureA2_`i'.png,  replace
	
	tw (scatter rank_`i'_latest  rank_`i'_oldest, msize(small) msymbol(circle_hollow)) ///
	(lfit rank_`i'_latest  rank_`i'_oldest,  lpattern(solid)) ///
	(lfit rank_`i'_fit  rank_`i'_oldest, lcolor(black) lpattern(dash)) , ///
	graphregion(fcolor(white) lcolor(white)) xtitle(起始值) ytitle(最新值) ///
	legend(label(1 "散点") label(2 "拟合线") label(3 "45度线") position(6) col(2) region(lstyle(solid) lcolor(black)) ) scheme(cleanplots) ///
	xlabel(0(40)200) ylabel(0(40)200)
	
	if "`i'" == "v2x_polyarchy" {
		graph export $outputs/figure8B.png,  replace
	}
	
	graph export $outputs/figureA2_rank_`i'.png,  replace
	
	}

	restore
	




			
	