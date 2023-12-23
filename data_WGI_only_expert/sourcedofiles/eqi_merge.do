/******************************************************************************/
// Program to prepare data from the European Quality of Government Survey (EQI)
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
//
// Annual update notes:
//	Step 1:  Add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$eqi_inputfile"
global outputfile "$eqi_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2010 / 2011 / 2012
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI101112") cellrange(A7:E35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 10 11 12{
	foreach var in ge rl cc{
		gen eqi`i'`var'=eqi101112`var'
	}
}
foreach var in ge rl cc{
	drop eqi101112`var'
}
foreach i in 10 11 12{ 
	foreach var in ge rl cc{
		replace eqi`i'`var'="." if eqi`i'`var'==".."
		cap destring eqi`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 / 2014 / 2015 / 2016
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI13141516") cellrange(A7:E35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 13 14 15 16{
	foreach var in ge rl cc{
		gen eqi`i'`var'=eqi13141516`var'
	}
}
foreach var in ge rl cc{
	drop eqi13141516`var'
}
foreach i in 13 14 15 16{ 
	foreach var in ge rl cc{
		replace eqi`i'`var'="." if eqi`i'`var'==".."
		cap destring eqi`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 / 2018 / 2019
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI171819") cellrange(A7:F35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 17 18 19{
	foreach var in va ge rl cc{
		gen eqi`i'`var'=eqi171819`var'
	}
}
foreach var in va ge rl cc{
	drop eqi171819`var'
}
foreach i in 17 18 19{ 
	foreach var in va ge rl cc{
		replace eqi`i'`var'="." if eqi`i'`var'==".."
		cap destring eqi`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 /2021
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:F35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 20 21{
	foreach var in va ge rl cc{
		gen eqi`i'`var'=eqi2021`var'
	}
}
foreach var in va ge rl cc{
	drop eqi2021`var'
}
foreach i in 20 21{ 
	foreach var in va ge rl cc{
		replace eqi`i'`var'="." if eqi`i'`var'==".."
		cap destring eqi`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
