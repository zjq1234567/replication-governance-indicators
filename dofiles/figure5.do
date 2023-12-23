

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.




/**************************************************************/
/* 		 Step1: clean WVS data	  */
/**************************************************************/
 	
 	use "$raw_data/WVS_trends_3_0.dta",clear 

 	keep if S002 == 7 //只看第七轮

 	keep S007 X001 X003 X025A_01
 	rename (S007 X001 X003 X025A_01) (s007 x001 x003 x025a_01)
 	tempfile bridge
	save `bridge'

	use $raw_data/WVS_Cross-National_Wave_7_stata_v4_0.dta,clear  
	merge 1:1 s007 using `bridge'
		keep if _m == 3
		drop _merge

	keep a_year b_country_alpha pwght w_weight s018  q71 q72 q73 q76 /// trust
 		q112 q113 q114 q115 q116 q117 q118  q120 /// 腐败
 		 q224 q225 q226 q227 q228 q229 q230 q231 q232 q233 ///vote
 		 q251 q252 q253 q254 ///民主
 		 q70 ///相信法院
 		 x001 x003 x025a_01 //个体特征变量


 	foreach var of varlist q71 q72 q73 q76 /// trust
 		q112 q113 q114 q115 q116 q117 q118  q120 /// 腐败
 		 q224 q225 q226 q227 q228 q229 q230 q231 q232 q233 ///vote
 		 q251 q252 q253 q254 q70 x001 x003 x025a_01 {
 	
 		replace `var' = . if `var' <0	
 	
 	}

 	*调整指标，越大越positive
	replace q112 = q112 - 10 
		replace q112 = 10 if q112 == -9
		replace q112 = 9 if q112 == -8
		replace q112 = 8 if q112 == -7
		replace q112 = 7 if q112 == -6	
		replace q112 = 6 if q112 == -5
		replace q112 = 5 if q112 == -4
		replace q112 = 4 if q112 == -3
		replace q112 = 3 if q112 == -2	
		replace q112 = 2 if q112 == -1
		replace q112 = 1 if q112 == 0


 	rename b_country_alpha iso3
 	rename a_year year

 	collapse (mean) q*, by(year iso3)

 	tempfile WVS7_country
 	save `WVS7_country'	



/**************************************************************/
/* 		 Step2: Merge group data  */
/**************************************************************/

 use $raw_data/wgidataset.dta, clear  

		rename code iso3 

******** Merge group data ******

		*1.income level 
			merge 1:1 iso3 year using $raw_data/country_income.dta 	 
				drop _merge

		*2.income thresholds
			merge m:1 year using $raw_data/country_income_thresholds.dta 
				drop _merge 


******** Generate groups for figure plotting ******

		*1.Income group, refer to Wolrd Bank
			gen income_group = . 
				replace income_group = 0 if iso3 == "CHN"
				replace income_group = 1 if (gniper2>thresh3) & income_group ==.  //high-income  
				replace income_group = 2 if (gniper2<=thresh3 & gniper2 > thresh2) & income_group == . //upper middle 
				replace income_group = 3 if (gniper2<=thresh2 & gniper2 > thresh1) & income_group == .   //lower middle 
				replace income_group = 4 if (gniper2<=thresh1) //low-income 
				replace income_group = . if gniper2 ==. 

				label var income_group "1-high; 2-uppermiddle; 3-lowermiddle; 4-low; 0-China"

		*2.Developed bs developing , refer to Wolrd Bank
			gen dev = . 
				replace dev = 0 if iso3 == "CHN"
				replace dev = 1 if income_group == 1 //developed country
				replace dev = 2 if income_group == 2 | income_group == 3 | income_group == 4 // developing country

				replace dev = 2 if dev == 0 //中国
				label var dev "1-developed; 2-developing; 0-China"


	merge 1:1 year iso3 using `WVS7_country'
	drop if _m == 2 
	drop if _m == 1
	drop _merge 

	save $working_data/wgi_wvs_country.dta,replace



/**************************************************************/
/* 		 Step3:Plot Figures */
/**************************************************************/

use $working_data/wgi_wvs_country.dta,clear 

	*corruption 
	*Q112 你认为所在国家是否腐败，1-腐败；10-不腐败  [Shouldbe: 负相关]		
			twoway(sc cce  q112 )(lfit cce  q112 )   ///
			,xtitle("你认为所在国家是否腐败(WVS)") xlabel(1(1)10) ///
			ytitle("腐败控制(WGI)") ylabel(-2.5(1)2.5) ///
			scheme(cleanplots) legend(off) //developing country 

			graph export $outputs/figure5_a.png, replace	

			twoway(sc cce  q112 if dev ==1)(lfit cce  q112  if dev ==1) ///
			(sc cce  q112 if dev ==2)(lfit cce  q112  if dev ==2) ///
			,xtitle("你认为所在国家是否腐败(WVS)") xlabel(1(1)10) /// 
			ytitle("腐败控制(WGI)") ylabel(-2.5(1)2.5)  ///			
			legend(label(1 "发达国家") label(2 "发达国家")  label(3 "发展中国家")  label(4 "发展中国家") pos(3)) ///
			scheme(cleanplots)  

			graph export $outputs/figure5_b.png, replace	 

