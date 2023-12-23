/******************************************************************************/
// Program to prepare data from the African Development Bank Country Policy
// and Institutional Assessments (ADB)
//
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
global inputfile "$adb_inputfile"
global outputfile "$adb_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb04`var'="." if adb04`var'==".."
	cap destring adb04`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb05`var'="." if adb05`var'==".."
	cap destring adb05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb06`var'="." if adb06`var'==".."
	cap destring adb06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb07`var'="." if adb07`var'==".."
	cap destring adb07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb08`var'="." if adb08`var'==".."
	cap destring adb08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb09`var'="." if adb09`var'==".."
	cap destring adb09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:F46) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb10`var'="." if adb10`var'==".."
	cap destring adb10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:F47) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb11`var'="." if adb11`var'==".."
	cap destring adb11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:F47) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb12`var'="." if adb12`var'==".."
	cap destring adb12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:F47) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb13`var'="." if adb13`var'==".."
	cap destring adb13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:F47) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb14`var'="." if adb14`var'==".."
	cap destring adb14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:F45) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb15`var'="." if adb15`var'==".."
	cap destring adb15`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016/17 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201617") cellrange(A7:F45) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 16 17{
   foreach var in ge rq rl cc{
		gen adb`i'`var'=adb1617`var'
	}
}
foreach var in ge rq rl cc{
    drop adb1617`var'
}
foreach i in 16 17{
    foreach var in ge rq rl cc{
		replace adb`i'`var'="." if adb`i'`var'==".."
		cap destring adb`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018/19 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201819") cellrange(A7:F44) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 18 19{
    foreach var in ge rq rl cc{
		gen adb`i'`var' = adb1819`var'
	}
}
foreach var in ge rq rl cc{
    drop adb1819`var'
}

foreach i in 18 19{
    foreach var in ge rq rl cc{
		replace adb`i'`var'="." if adb`i'`var'==".."
		cap destring adb`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:F44) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb20`var'="." if adb20`var'==".."
	cap destring adb20`var', replace
	
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:F44) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace adb21`var'="." if adb21`var'==".."
	cap destring adb21`var', replace
	
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/
