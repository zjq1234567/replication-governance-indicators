
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
	
	keep if year>=1995
	
	binscatter v2x_rule year if iso3 == "CHN", line(connect) colors(red)  ///,  ///
	scheme(cleanplots) ylabel(0(0.2)1) xlabel(1995(5)2020) ///
	ytitle("V-dem: 法治") xtitle(年份)
	
	graph export $outputs/figure9A.png, replace
	




			
	