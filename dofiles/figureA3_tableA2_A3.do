
**************************************************************
**********************Set Relative Path***********************
**************************************************************
	clear all              // remove everything from the memory, refresh. 

	cap log close         // close any open log file.

	set more off          // show the result all at once.
	set maxvar 10000


	
****************************WVS Data**********************************

	use $raw_data/WVS_TimeSeries_1981_2022_Stata_v3_0.dta , replace
	rename (S020 COUNTRY_ALPHA S007) (year iso3 uniqueid)
	
	order iso3 uniqueid year 
	drop if uniqueid==.
	save $working_data/WVS.dta, replace

**************************************************************
***************Import data and Define groups***************
**************************************************************
	use $raw_data/10_vdem.dta, clear   // Here: import your index data 
	rename (country_text_id country_name) (iso3  countryname)
	drop country_id
	//drop duplicates,keeping the latest record within one year
	sort iso3 year historical
	drop if iso3==iso3[_n+1] & year==year[_n+1]
	
	//keep selected variables		
	keep countryname iso3 year historical_date project historical histname codingstart codingend codingstart_contemp codingend_contemp codingstart_hist codingend_hist gapstart1 gapstart2 gapstart3 gapend1 gapend2 gapend3 gap_index COWcode v2x_polyarchy v2x_libdem v2x_partipdem v2x_delibdem v2x_egaldem
			
	keep if year > 1980
	
	// fill in missing values by last period values
	sort iso3 year
	foreach i of varlist v2x_polyarchy v2x_libdem v2x_partipdem v2x_delibdem v2x_egaldem {
	replace `i'=`i'[_n-1] if iso3==iso3[_n-1] & `i'==. & `i'[_n-1]!=.
	}
	
	
	label var v2x_polyarchy "选举民主指数"
	label var v2x_libdem "自由民主指数"
	label var v2x_partipdem "参与民主指数"
	label var v2x_delibdem "审议民主指数"
	label var v2x_egaldem "平等民主指数"
	

	********Step1: Merge group data ******

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
				
	********Step2: Merge WVS  ******
	keep if year>1980	
	//merge with WVS
	merge 1:m iso3 year using $working_data/WVS.dta
	keep if _merge==3
	drop _merge
	
	order countryname iso3 uniqueid year 
	sort iso3 uniqueid year 
	
	
	
	save $working_data/Vdem_WVS.dta, replace
	
	
	********Step3: Processing ******
	use $working_data/Vdem_WVS.dta, replace
	keep if S002VS==7
	//variables relative to V-dem high-level indices
	
	//electoral democracy
	//V-dem: The electoral principle of democracy seeks to embody the core value of making rulers
	//responsive to citizens, achieved through electoral competition for the electorate's approval
	//under circumstances when suffrage is extensive; political and civil society organizations can
	//operate freely; elections are clean and not marred by fraud or systematic irregularities; and
	//elections affect the composition of the chief executive of the country.
	rename (E069_64 E265_01 E265_04 E265_06 E265_08 E265_09) ///
	(elect_conf elect_vote_count elect_vote_bribe elect_off_fair elect_threat elect_gen_choice )
	
	//liberal democracy
	//V-dem: This is achieved by constitutionally protected civil liberties, 
	//strong rule of law, an independent judiciary, and effective checks and balances that, 
	//together, limit the exercise of executive power.
	
	//no applicable questions
	
	//participatory democracy
	//V-dem: The participatory principle of democracy emphasizes active participation by citizens
	//in all political processes, electoral and non-electoral. It is motivated by uneasiness about
	//a bedrock practice of electoral democracy: delegating authority to representatives. Thus,
	//direct rule by citizens is preferred, wherever practicable. This model of democracy thus takes
	//suffrage for granted, emphasizing engagement in civil society organizations, direct democracy,
	//and subnational elected bodies.
	rename (E025 E026 E027 E028 E289 E286 E287 E288 E291) ///
	(petition boycott peace_demonstration strike enco_vote donate contact_off enco_act have_a_say)
	
	//deliberative democracy
	//V-dem: The deliberative principle of democracy focuses on the process by which decisions
	//are reached in a polity. A deliberative process is one in which public reasoning focused on the
	//common good motivates political decisions—as contrasted with emotional appeals, solidary
	//attachments, parochial interests, or coercion. According to this principle, democracy requires
	//more than an aggregation of existing preferences. There should also be respectful dialogu
	//at all levels—from preference formation to final decision—among informed and competent
	//participants who are open to persuasion. 
	
	//no survey questions matched: the political trust module is only applicable for several counties
	
	
	//egalitarian democracy
	//V-dem: Egalitarian democracy is achieved when 1 rights
	//and freedoms of individuals are protected equally across all social groups; and 2 resources are
	//distributed equally across all social groups; 3 groups and individuals enjoy equal access to
	//power.
	
	rename (E035 E233A E265_10) (income_equality cri_state_income_eq women_equal_power)
	
	order elect_conf elect_vote_count elect_vote_bribe elect_off_fair elect_threat elect_gen_choice petition boycott peace_demonstration strike enco_vote donate contact_off enco_act have_a_say income_equality cri_state_income_eq women_equal_power
	
	//drop missing values
	foreach i of varlist elect_conf elect_vote_count elect_vote_bribe elect_off_fair elect_threat elect_gen_choice ///
	petition boycott peace_demonstration strike enco_vote donate contact_off enco_act have_a_say ///
	income_equality cri_state_income_eq women_equal_power X001 X003 X025A_01 {
	replace `i'=. if `i'<0
	}
	
	//unify values
	foreach i of varlist petition boycott peace_demonstration strike enco_vote donate contact_off enco_act {
	replace `i'=4 if `i'==3
	replace `i'=3 if `i'==1
	replace `i'=1 if `i'==4
	}
	
	//define elements
	global elect_main "v2x_polyarchy"
	global elect_survey "elect_conf elect_vote_count elect_vote_bribe elect_off_fair elect_threat elect_gen_choice" 
	global parti_main "v2x_partipdem"
	global parti_survey "petition boycott peace_demonstration strike enco_vote donate contact_off enco_act have_a_say"
	global egal_main "v2x_egaldem"
	global egal_survey "income_equality cri_state_income_eq women_equal_power"
	
	foreach i of global elect_survey  {
	by iso3, sort: egen mean_`i'=mean(`i')
	}
	
	foreach i of global parti_survey  {
	by iso3, sort: egen mean_`i'=mean(`i')
	}
	
	foreach i of global egal_survey  {
	by iso3, sort: egen mean_`i'=mean(`i')
	}
	
	cap drop gdpper2_k
	gen gdpper2_k = gdpper2 / 1000  
	
	ge ln_gdpper2 = log(gdpper2)
	
	global field "elect parti"
	
	by iso3, sort: egen pop=count(S006)
	
	//step4: plotting
	global field_plot "elect parti"
	global elect_survey_plot "elect_conf " 
	global parti_survey_plot "contact_off"
	
	
	preserve
	keep countryname iso3 dev dem income_group v2x_polyarchy v2x_libdem v2x_partipdem v2x_delibdem v2x_egaldem mean_*  gdpper2_k
	duplicates drop
	
	foreach i of global field {
		ge `i'_main_100=$`i'_main*100 //rescale to 0-100
	}
	label var elect_main_100 "选举民主指数 (0-100)"
	label var parti_main_100 "参与民主指数 (0-100)"
	
	
	
	foreach i of global field_plot {
		local y "`i'_main_100"
		local gl "`i'_survey_plot"
		local varlabel: var label `y' //Extracting labels for naming
		foreach j of global `gl' {
			local x "mean_`j'"
			
			qui: sum `x',d
			local min=floor(r(min))
			local max=ceil(r(max))
			
			tw (scatter `y' `x' if dev==1, m(circle) mcolor(red) mfcolor(white) msize(small) xlabel(`min'(1)`max')  ) ///
			(lfit `y' `x' if dev==1, lcolor(ltblue) lpattern(solid) xlabel(`min'(1)`max') ) ///
			(scatter `y' `x' if dev==2, m(square) mcolor(gray) mfcolor(white) msize(small) xlabel(`min'(1)`max') ) ///
			(lfit `y' `x' if dev==2, lcolor(black) lpattern(solid) xlabel(`min'(1)`max') ) ///
			, legend(label(1 "发达国家") label(2 "发达国家") label(3 "发展中国家") label(4 "发展中国家")) ///
			xlabel(`min'(1)`max') ylabel(0(20)100) graphregion(color(white)) xtitle(WVS指标均值) ytitle("`varlabel'")
			
			graph export $outputs/figureA3_`i'_`j'_group.png , replace	
			
			tw (scatter `y' `x' , m(circle) mcolor(red) mfcolor(white) msize(small) xlabel(`min'(1)`max'))  ///
			(lfit `y' `x' , lcolor(ltblue) lpattern(solid)  xlabel(`min'(1)`max'))  ///
			, legend(off) ///
			xlabel(`min'(1)`max') ylabel(0(20)100) graphregion(color(white)) xtitle(WVS指标均值) ytitle("`varlabel'")
			
			graph export $outputs/figureA3_`i'_`j'_all.png , replace	
			
		
		}
	}
	restore

	//step5: regress WVS variables on sub-indicators
	local group1 " if 1"
	local group2 " if dev==1"
	local group3 " if dev==2"
	
	local grp1 " All "
	local grp2 " Developed"
	local grp3 " Developing"
	
	
	foreach i of global field {
		if "`i'" == "elect" {
			local t = 2
		}
		if "`i'" == "parti" {
			local t = 3
		}
		local y "`i'_main"
		local gl "`i'_survey"
		local count=1
		foreach j of global `gl' {	
			forv g=1/3{
			
			qui: reg `j'  $`y' ln_gdpper2 i.year i.X001 i.X003 i.X025A_01 [pw=pop] `group`g'', vce(cluster iso3)
			
				if  `count'==1 & `g'==1 {
					outreg2 using "$outputs/tableA`t'", excel nocons ///
					addtext( "Group", "`grp`g''", "Constant", "yes", "Controls", "GDP per capita") ///
					keep($`y') sdec(3) bdec(3) replace
				}
				else {
					outreg2 using "$outputs/tableA`t'", excel nocons ///
					addtext( "Group", "`grp`g''", "Constant", "yes", "Controls", "GDP per capita, Survey Year FE") ///
					keep($`y') sdec(3) bdec(3)
				}
			}
		local count=`count'+1	
		}
	}

