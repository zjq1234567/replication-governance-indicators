/******************************************************************************/
// Program to prepare data from World Justice Project (WJP)
// Contents:
//	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs

// Annual update notes: add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1:  Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$wjp_inputfile"
global outputfile "$wjp_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:G73) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp11`var'="." if wjp11`var'==".."
	cap destring wjp11`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:G104) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp12`var'="." if wjp12`var'==".."
	cap destring wjp12`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:G106) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp13`var'="." if wjp13`var'==".."
	cap destring wjp13`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:G109) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp14`var'="." if wjp14`var'==".."
	cap destring wjp14`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2015-16 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201516") cellrange(A7:G120) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp1516`var'="." if wjp1516`var'==".."
	cap destring wjp1516`var', replace
	foreach yr in 15 16{
		gen wjp`yr'`var'=wjp1516`var'
		}
	drop wjp1516`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:G120) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp17`var'="." if wjp17`var'==".."
	cap destring wjp17`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:G120) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp18`var'="." if wjp18`var'==".."
	cap destring wjp18`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019-20 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201920") cellrange(A7:G120) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp1920`var'="." if wjp1920`var'==".."
	cap destring wjp1920`var', replace
	foreach yr in 19 20{
		gen wjp`yr'`var'=wjp1920`var'
		}
	drop wjp1920`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:G146) firstrow case(lower) allstring
drop country
foreach var in va pv rq rl cc{
	replace wjp21`var'="." if wjp21`var'==".."
	cap destring wjp21`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
/******************************************************************************/

/******************************************************************************/
// NOTE:
// This data source covers a gradually-expanding and largely balanced set of 
// countries, so gaps are not filled with lags, beyond the use of the 2016 WJP
// for 2015 and 2016, and the 2020 WJP for 2019 and 2020.
/******************************************************************************/


