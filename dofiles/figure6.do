

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.




/**************************************************************/
/*            Step1: Merge database                  */
/**************************************************************/

 use $raw_data/wgidataset_expert.dta, clear   // Here: import your index data 

 	keep code year vae pve gee rqe rle cce 

 	foreach var of varlist vae pve gee rqe rle cce {

 		rename `var' `var'_expert

 	}

 	merge 1:1 code year using  $raw_data/wgidataset.dta 
 		drop _m

 	rename code iso3

********Step2: Merge group data ******

		*1.policy2 score
			merge 1:1 iso3 year using $raw_data/p5v2018_iso3.dta 	
				drop _merge 

			encode iso3, generate(countrycode)  //for xtset 
			xtset countrycode year

			* We use the Polity2 score in 2018 to replace the missing values in 2019 and 2020, assuming that the Polity2 score would be stable two years after 2018 
				replace polity2 = L.polity2 if year == 2019 & polity2 == .
				replace polity2 = L.polity2 if year == 2020 & polity2 == .
				replace polity2 = L.polity2 if year == 2021 & polity2 == . //Here: replace 2021 

		*2.income level 
			merge 1:1 iso3 year using $raw_data/country_income.dta 	 
				drop _merge

		*3.income thresholds
			merge m:1 year using $raw_data/country_income_thresholds.dta 
				drop _merge 


	********Step3: Generate groups for figure plotting ******

		*1.Democracy vs Non-democracy vs China
			gen dem = .
				replace dem = 0 if iso3 == "CHN"
				replace dem = 1 if (polity2 >= 0) & iso3 != "CHN" //democracy
				replace dem = 2 if (polity2 < 0 ) & iso3 != "CHN" //non-democracy

				label var dem " 1-democracy; 2-nondemocracy;0-china"

				replace dem = 2 if dem == 0


		*2.Income group, refer to Wolrd Bank
			gen income_group = . 
				replace income_group = 0 if iso3 == "CHN"
				replace income_group = 1 if (gniper2>thresh3) & income_group ==.  //high-income  
				replace income_group = 2 if (gniper2<=thresh3 & gniper2 > thresh2) & income_group == . //upper middle 
				replace income_group = 3 if (gniper2<=thresh2 & gniper2 > thresh1) & income_group == .   //lower middle 
				replace income_group = 4 if (gniper2<=thresh1) //low-income 
				replace income_group = . if gniper2 ==. 

				label var income_group "1-high; 2-uppermiddle; 3-lowermiddle; 4-low; 0-China"

				replace income_group = 2 if income_group == 0

		*3.Developed bs developing , refer to Wolrd Bank
			gen dev = . 
				replace dev = 0 if iso3 == "CHN"
				replace dev = 1 if income_group == 1 //developed country
				replace dev = 2 if income_group == 2 | income_group == 3 | income_group == 4 // developing country

				label var dev "1-developed; 2-developing; 0-China"


				replace dev = 2 if dev == 0
**************************************************************
***********************Plot Figures **************************
**************************************************************
	keep if year > 1995

	*生成两套数据的得分差

	foreach var of varlist vae pve gee rqe rle cce {

		gen `var'_d = `var' -`var'_expert 
		*WGI-WGI（仅专家数据源），如果差为正，说明加入民主评价后该国得分上升、反之下降。
	} 

	*A 表达和问责

			binscatter vae_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_a.png, replace	 //Here: change the name of sub-folder

	*B 政治稳定与无暴力

			binscatter pve_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_b.png, replace	 //Here: change the name of sub-folder


	*C 政府有效性


			binscatter gee_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_c.png, replace	 //Here: change the name of sub-folder


	*D 监管质量


			binscatter rqe_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_d.png, replace	 //Here: change the name of sub-folder

	*E 法治

			binscatter rle_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_e.png, replace	 //Here: change the name of sub-folder

	*F 腐败控制

			binscatter cce_d year , by(dem) line(connect) ///
				discrete ///
				xlabel(#14) ///
				yline(0) ///
				colors(maroon eltblue) msymbol(O T) ///
				xtitle("年份",size(medsmall)) ///
				ytitle("WGI-WGI（仅专家数据源）",size(medsmall)) ///				
				scheme(cleanplots) ///
				legend( label(1 "民主国家 ") label(2 "非民主国家") pos(3) )  ///
				title("`varlabel'",size(medsmall))  xlabel(1996(5)2021)

				graph export $outputs/figure6_f.png, replace	 //Here: change the name of sub-folder

