**************************************************************
**********************Set Relative Path***********************
**************************************************************
	clear all              // remove everything from the memory, refresh. 

	cap log close         // close any open log file.

	set more off          // show the result all at once.



**************************************************************
***************Import data and Define groups***************
**************************************************************

	use $raw_data/wgidataset.dta, clear   // Here: import your index data 

		*import excel "$raw_data/Incomedata_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
		
		rename code iso3 

	********Step1: Adjust country code to ISO3  ****** // Here: unify the country code style (ISO3_code.xlsx)

		*duplicates drop scode, force //
		*merge m:1 scode using "$raw_data/policy2_iso3.dta"   
			*drop _m


	********Step2: Merge group data ******

		*1.policy2 score
			merge 1:1 iso3 year using $raw_data/p5v2018_iso3.dta 	
				count if _m == 2  // only in using data  
				count if _m == 1  // only in master data
				drop _merge 

			* We use the Polity2 score in 2018 to replace the missing values in 2019 and 2020, assuming that the Polity2 score would be stable two years after 2018 
				encode iso3, generate(countrycode)  //for xtset 
				xtset countrycode year

					replace polity2 = L.polity2 if year == 2019 & polity2 == .
					replace polity2 = L.polity2 if year == 2020 & polity2 == .

		*2.income level 
			merge 1:1 iso3 year using $raw_data/country_income.dta 	
				drop _merge

		*3.income thresholds
			merge m:1 year using $raw_data/country_income_thresholds.dta // 1989-2021 	
				drop _merge 

	********Step3: Generate groups for figure plotting ******

		*1.Democracy vs Non-democracy vs China
			gen dem = .
				replace dem = 0 if iso3 == "CHN"
				replace dem = 1 if (polity2 >= 0 & polity2 !=. ) & iso3 != "CHN" //democracy
				replace dem = 2 if (polity2 < 0 ) & iso3 != "CHN" //non-democracy

				label var dem "2-nondemocracy; 1-democracy; 0-china"

		*2.Income group, refer to Wolrd Bank
			gen income_group = . 
				replace income_group = 0 if iso3 == "CHN"
				replace income_group = 1 if (gniper2<=thresh1) & iso3 != "CHN" //low-income 
				replace income_group = 2 if (gniper2<=thresh2) & income_group == . & iso3 != "CHN"  //lower middle 
				replace income_group = 3 if (gniper2<=thresh3) & income_group == . & iso3 != "CHN" //upper middle 
				replace income_group = 4 if (gniper2>thresh3) & income_group ==. & iso3 != "CHN" //high-income  
					replace income_group = . if gniper2 ==. 

				label var income_group "4-high; 3-uppermiddle; 2-lowermiddle; 1-low; 0-China"

		*3.Developed vs developing , refer to Wolrd Bank
			gen dev = . 
				replace dev = 0 if iso3 == "CHN"
				replace dev = 1 if income_group == 1 | income_group == 2 | income_group == 3 // developing country
				replace dev = 2 if income_group == 4 //developed country
					replace dev = . if gniper2 == .

				label var dev "2-developed; 1-developing; 0-China"



		* Boxplot
		label define dev_label 1 "发展中国家" 2 "发达国家"
		label values dev dev_label
		
		
		graph box  rle vae pve rqe cce gee if year==2019 & dev!=0, over (dev) ysize(2) bgcolor(white)	plotregion(fcolor(white)) graphregion(fcolor(white))  ///
		legend(label(1 "法治") label(2 "表达和问责") label(3 "政治稳定和无暴力") label(4 "政府有效性") label(5 "监管质量") label(6 "腐败控制") ) ytitle("点估计")
		
		graph export $outputs/figure2.png, replace
		
		keep if year==2019
		gen dev2=1 if dev==2
		replace dev2=0 if dev==1
		xtset, clear
		xtset dev2 countrycode 
		
		matrix A=J(6,2,0)
		local t = 1
		foreach i of varlist rle vae pve rqe cce gee {
			xtsum `i' if year==2019&dev2!=.
			mat A[`t',1]= r(sd_w)
			mat A[`t',2]= r(sd_b)
			local t = `t'+1
		}
		clear
		svmat A
		rename (A1 A2) (平均组内方差 平均组间方差)
		ge 指标 = ""
		replace 指标 = "法治水平（Rule of Law）" in 1
		replace 指标 = "表达和问责水平（Voice and Accountability）" in 2
		replace 指标 = "政治稳定和无暴力水平（Political Stability and Absence of Violence）" in 3
		replace 指标 = "监管质量（Regulatory Quality）" in 4
		replace 指标 = "腐败控制水平（Control of Corruption）" in 5
		replace 指标 = "政府有效性（Government Effectiveness）" in 6		
		order 指标 平均组内方差 平均组间方差
		format 平均组内方差 平均组间方差 %12.2f
		
		export excel "$outputs/tableA8.xlsx", sheet("Sheet1") firstrow(variable) replace 
				
		
		
		