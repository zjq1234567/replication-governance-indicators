/******************************************************************************/
// Program to prepare data from Varieties of Democracies dataset (VDM)
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
global inputfile "$vdm_inputfile"
global outputfile "$vdm_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:E177) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm96`var'="." if vdm96`var'==".."
	cap destring vdm96`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:E178) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm98`var'="." if vdm98`var'==".."
	cap destring vdm98`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm00`var'="." if vdm00`var'==".."
	cap destring vdm00`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm02`var'="." if vdm02`var'==".."
	cap destring vdm02`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm03`var'="." if vdm03`var'==".."
	cap destring vdm03`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm04`var'="." if vdm04`var'==".."
	cap destring vdm04`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm05`var'="." if vdm05`var'==".."
	cap destring vdm05`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:E179) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm06`var'="." if vdm06`var'==".."
	cap destring vdm06`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:E180) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm07`var'="." if vdm07`var'==".."
	cap destring vdm07`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:E180) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm08`var'="." if vdm08`var'==".."
	cap destring vdm08`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:E180) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm09`var'="." if vdm09`var'==".."
	cap destring vdm09`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:E180) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm10`var'="." if vdm10`var'==".."
	cap destring vdm10`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm11`var'="." if vdm11`var'==".."
	cap destring vdm11`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm11`var'="." if vdm11`var'==".."
	cap destring vdm11`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm12`var'="." if vdm12`var'==".."
	cap destring vdm12`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm13`var'="." if vdm13`var'==".."
	cap destring vdm13`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm14`var'="." if vdm14`var'==".."
	cap destring vdm14`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm15`var'="." if vdm15`var'==".."
	cap destring vdm15`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm16`var'="." if vdm16`var'==".."
	cap destring vdm16`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm17`var'="." if vdm17`var'==".."
	cap destring vdm17`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm18`var'="." if vdm18`var'==".."
	cap destring vdm18`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm19`var'="." if vdm19`var'==".."
	cap destring vdm19`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:E181) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm20`var'="." if vdm20`var'==".."
	cap destring vdm20`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:E186) firstrow case(lower) allstring
drop country
drop if code==".."
foreach var in va rl cc{
	replace vdm21`var'="." if vdm21`var'==".."
	cap destring vdm21`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
/******************************************************************************/
