/******************************************************************************/
// Program to prepare data from Vanderbilt University's Americas Barometer (VAB) 

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
global inputfile "$vab_inputfile"
global outputfile "$vab_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2004 / 2005
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0504") cellrange(A7:E18) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 04 05{
	foreach var in va rl cc{
		gen vab`i'`var'=vab0504`var'
	}
}
foreach var in va rl cc{
	drop vab0504`var'
}
foreach i in 04 05{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 / 2007
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0706") cellrange(A7:E29) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 06 07{
	foreach var in va rl cc{
		gen vab`i'`var'=vab0706`var'
	}
}
foreach var in va rl cc{
	drop vab0706`var'
}
foreach i in 07 06{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 / 2009
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0908") cellrange(A7:E30) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 08 09{
	foreach var in va rl cc{
		gen vab`i'`var'=vab0908`var'
	}
}
foreach var in va rl cc{
	drop vab0908`var'
}
foreach i in 08 09{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 / 2011
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1110") cellrange(A7:E32) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 10 11{
	foreach var in va rl cc{
		gen vab`i'`var'=vab1110`var'
	}
}
foreach var in va rl cc{
	drop vab1110`var'
}
foreach i in 10 11{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 / 2013
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1213") cellrange(A7:E33) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 12 13{
	foreach var in va rl cc{
		gen vab`i'`var'=vab1213`var'
	}
}
foreach var in va rl cc{
	drop vab1213`var'
}
foreach i in 12 13{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 / 2015
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1415") cellrange(A7:E35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 14 15{
	foreach var in va rl cc{
		gen vab`i'`var'=vab1415`var'
	}
}
foreach var in va rl cc{
	drop vab1415`var'
}
foreach i in 14 15{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 / 2017
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1617") cellrange(A7:E36) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 16 17{
	foreach var in va rl cc{
		gen vab`i'`var'=vab1617`var'
	}
}
foreach var in va rl cc{
	drop vab1617`var'
}
foreach i in 16 17{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 / 2019 / 2020
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI181920") cellrange(A7:E27) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 18 19 20{
	foreach var in va rl cc{
		gen vab`i'`var'=vab181920`var'
	}
}
foreach var in va rl cc{
	drop vab181920`var'
}
foreach i in 18 19 20{
	foreach var in va rl cc{
		replace vab`i'`var'="." if vab`i'`var'==".."
		cap destring vab`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI21") cellrange(A7:E29) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace vab21`var'="." if vab21`var'==".."
	cap destring vab21`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

//
/******************************************************************************/
