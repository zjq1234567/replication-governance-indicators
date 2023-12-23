/******************************************************************************/
// Program to prepare data from Asian Development Bank Country and Institutional 
// Assessments (ASD)
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs

// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2(see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$asd_inputfile"
global outputfile "$asd_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:F32) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd05`var'="." if asd05`var'==".."
	cap destring asd05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:F33) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd06`var'="." if asd06`var'==".."
	cap destring asd06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:F36) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd07`var'="." if asd07`var'==".."
	cap destring asd07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd08`var'="." if asd08`var'==".."
	cap destring asd08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd09`var'="." if asd09`var'==".."
	cap destring asd09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd10`var'="." if asd10`var'==".."
	cap destring asd10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd11`var'="." if asd11`var'==".."
	cap destring asd11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd12`var'="." if asd12`var'==".."
	cap destring asd12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:F35) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd13`var'="." if asd13`var'==".."
	cap destring asd13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:F36) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd14`var'="." if asd14`var'==".."
	cap destring asd14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:F36) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace asd15`var'="." if asd15`var'==".."
	cap destring asd15`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016/17 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201617") cellrange(A7:F34) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 16 17{
	foreach var in ge rq rl cc{
		gen asd`i'`var' = asd1617`var'
	}
}
foreach var in ge rq rl cc{
	drop asd1617`var'
}

foreach i in 16 17{
	foreach var in ge rq rl cc{
		replace asd`i'`var'="." if asd`i'`var'==".."
		cap destring asd`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018/19 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201819") cellrange(A7:F34) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 18 19{
	foreach var in ge rq rl cc{
		gen asd`i'`var' = asd1819`var'
	}
}
foreach var in ge rq rl cc{
	drop asd1819`var'
}

foreach i in 18 19{
	foreach var in ge rq rl cc{
		replace asd`i'`var'="." if asd`i'`var'==".."
		cap destring asd`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020/21 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI202021") cellrange(A7:F34) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 20 21{
	foreach var in ge rq rl cc{
		gen asd`i'`var' = asd2021`var'
	}
}
foreach var in ge rq rl cc{
	drop asd2021`var'
}

foreach i in 20 21{
	foreach var in ge rq rl cc{
		replace asd`i'`var'="." if asd`i'`var'==".."
		cap destring asd`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
