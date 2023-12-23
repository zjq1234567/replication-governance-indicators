/******************************************************************************/
// Program to prepare data from World Competitiveness Yearbook (WCY)
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
global inputfile "$wcy_inputfile"
global outputfile "$wcy_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:H53) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy96`var'="." if wcy96`var'==".."
	cap destring wcy96`var', replace
	}
drop wcy96pv  // note that this is an empty column in the dataset, data on PV start only in 2000
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:H53) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy98`var'="." if wcy98`var'==".."
	cap destring wcy98`var', replace
	}
drop wcy98pv  // note that this is an empty column in the dataset, data on PV start only in 2000
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:H54) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy00`var'="." if wcy00`var'==".."
	cap destring wcy00`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:H56) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy02`var'="." if wcy02`var'==".."
	cap destring wcy02`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:H58) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy03`var'="." if wcy03`var'==".."
	cap destring wcy03`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:H58) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy04`var'="." if wcy04`var'==".."
	cap destring wcy04`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:H58) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy05`var'="." if wcy05`var'==".."
	cap destring wcy05`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:H61) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy06`var'="." if wcy06`var'==".."
	cap destring wcy06`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:H62) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy07`var'="." if wcy07`var'==".."
	cap destring wcy07`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:H64) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy08`var'="." if wcy08`var'==".."
	cap destring wcy08`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:H64) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy09`var'="." if wcy09`var'==".."
	cap destring wcy09`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:H65) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy10`var'="." if wcy10`var'==".."
	cap destring wcy10`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:H66) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy11`var'="." if wcy11`var'==".."
	cap destring wcy11`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:H66) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy12`var'="." if wcy12`var'==".."
	cap destring wcy12`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:H67) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy13`var'="." if wcy13`var'==".."
	cap destring wcy13`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:H67) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy14`var'="." if wcy14`var'==".."
	cap destring wcy14`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:H68) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy15`var'="." if wcy15`var'==".."
	cap destring wcy15`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:H70) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy16`var'="." if wcy16`var'==".."
	cap destring wcy16`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:H70) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy17`var'="." if wcy17`var'==".."
	cap destring wcy17`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:H70) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy18`var'="." if wcy18`var'==".."
	cap destring wcy18`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:H70) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy19`var'="." if wcy19`var'==".."
	cap destring wcy19`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:H70) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy20`var'="." if wcy20`var'==".."
	cap destring wcy20`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:H72) firstrow case(lower) allstring
drop country
foreach var in va pv ge rq rl cc{
	replace wcy21`var'="." if wcy21`var'==".."
	cap destring wcy21`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
/******************************************************************************/

