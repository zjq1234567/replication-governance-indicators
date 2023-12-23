/******************************************************************************/
// Program to prepare data from the Latinobarometro (LBO)  

// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs

// Annual update notes:  add code for new year at end of SECTION 2(see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$lbo_inputfile"
global outputfile "$lbo_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo96`var'="." if lbo96`var'==".."
	cap destring lbo96`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
drop lbo96cc	// Note that this variable is not available in 1996, empty column in Excel file is just a placeholder
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo98`var'="." if lbo98`var'==".."
	cap destring lbo98`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
drop lbo98ge	// Note that this variable is not available in 1998, empty column in Excel file is just a placeholder
drop lbo98cc	// Note that this variable is not available in 1998, empty column in Excel file is just a placeholder
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo00`var'="." if lbo00`var'==".."
	cap destring lbo00`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
drop lbo00ge	// Note that this variable is not available in 2000, empty column in Excel file is just a placeholder
drop lbo00cc	// Note that this variable is not available in 2000, empty column in Excel file is just a placeholder
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo02`var'="." if lbo02`var'==".."
	cap destring lbo02`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo03`var'="." if lbo03`var'==".."
	cap destring lbo03`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo04`var'="." if lbo04`var'==".."
	cap destring lbo04`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo05`var'="." if lbo05`var'==".."
	cap destring lbo05`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo06`var'="." if lbo06`var'==".."
	cap destring lbo06`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo07`var'="." if lbo07`var'==".."
	cap destring lbo07`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo08`var'="." if lbo08`var'==".."
	cap destring lbo08`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo09`var'="." if lbo09`var'==".."
	cap destring lbo09`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo10`var'="." if lbo10`var'==".."
	cap destring lbo10`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 / 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20112012") cellrange(A7:F35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 11 12{
	foreach var in va ge rl cc{
		gen lbo`i'`var'=lbo1112`var'
	}
}
foreach var in va ge rl cc{
	drop lbo1112`var'
}
foreach i in 11 12{ 
	foreach var in va ge rl cc{
		replace lbo`i'`var'="." if lbo`i'`var'==".."
		cap destring lbo`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 / 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201314") cellrange(A7:F35) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 13 14{
	foreach var in va ge rl cc{
		gen lbo`i'`var'=lbo1314`var'
	}
}
foreach var in va ge rl cc{
	drop lbo1314`var'
}
foreach i in 13 14{ 
	foreach var in va ge rl cc{
		replace lbo`i'`var'="." if lbo`i'`var'==".."
		cap destring lbo`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo15`var'="." if lbo15`var'==".."
	cap destring lbo15`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo16`var'="." if lbo16`var'==".."
	cap destring lbo16`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va ge rl cc{
    replace lbo17`var'="." if lbo17`var'==".."
	cap destring lbo17`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 / 2019  Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201819") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 18 19 {
	foreach var in va ge rl cc{
		gen lbo`i'`var'=lbo1819`var'
	}
}
foreach var in va ge rl cc{
	drop lbo1819`var'
}
foreach i in 18 19 { 
	foreach var in va ge rl cc{
		replace lbo`i'`var'="." if lbo`i'`var'==".."
		cap destring lbo`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI202021") cellrange(A7:F25) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
foreach i in 20 21 {
	foreach var in va ge rl cc{
		gen lbo`i'`var'=lbo2021`var'
	}
}
foreach var in va ge rl cc{
	drop lbo2021`var'
}
foreach i in 20 21 { 
	foreach var in va ge rl cc{
		replace lbo`i'`var'="." if lbo`i'`var'==".."
		cap destring lbo`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE


