/******************************************************************************/
// Program to prepare data from Global Corruption Barometer (GCB)
// Contents:
//	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
// 	SECTION 3: Fill gaps with lags of up to two years
// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 and SECTION 3 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$gcb_inputfile"
global outputfile "$gcb_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:C69) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb04cc="." if gcb04cc==".."
cap destring gcb04cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:C76) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb05cc="." if gcb05cc==".."
cap destring gcb05cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:C69) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb06cc="." if gcb06cc==".."
cap destring gcb06cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:C59) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb07cc="." if gcb07cc==".."
cap destring gcb07cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:C77) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb08cc="." if gcb08cc==".."
cap destring gcb08cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:C76) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb09cc="." if gcb09cc==".."
cap destring gcb09cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:C107) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb10cc="." if gcb10cc==".."
cap destring gcb10cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:C107) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb11cc="." if gcb11cc==".."
cap destring gcb11cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012/13/14 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20121314") cellrange(A7:C114) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
gen gcb14cc=gcb121314cc
gen gcb13cc=gcb121314cc
gen gcb12cc=gcb121314cc
drop gcb121314cc
forvalues i=12/14{
	replace gcb`i'cc="." if gcb`i'cc==".."
	cap destring gcb`i'cc, replace
	}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:C44) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb15cc="." if gcb15cc==".."
cap destring gcb15cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016/17 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201617") cellrange(A7:C83) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
gen gcb17cc=gcb1617cc
gen gcb16cc=gcb1617cc
drop gcb1617cc
forvalues i=16/17{
	replace gcb`i'cc="." if gcb`i'cc==".."
	cap destring gcb`i'cc, replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:C42) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb18cc="." if gcb18cc==".."
cap destring gcb18cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:C31) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb19cc="." if gcb19cc==".."
cap destring gcb19cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:C51) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb20cc="." if gcb20cc==".."
cap destring gcb20cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:C17) firstrow case(lower) allstring
drop if code=="" | code==".." | code=="."
drop country
replace gcb21cc="." if gcb21cc==".."
cap destring gcb21cc, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/

/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// This is done because of the irregular country coverage of this data source
/******************************************************************************/
rename gcb* gcb*_tmp
gen gcb04cc=gcb04cc_tmp
gen gcb05cc=gcb05cc_tmp
	replace gcb05cc=gcb04cc_tmp if gcb05cc==.
gen gcb06cc=gcb06cc_tmp
	replace gcb06cc=gcb05cc_tmp if gcb06cc==.
	replace gcb06cc=gcb04cc_tmp if gcb06cc==.
gen gcb07cc=gcb07cc_tmp
	replace gcb07cc=gcb06cc_tmp if gcb07cc==.
	replace gcb07cc=gcb05cc_tmp if gcb07cc==.
gen gcb08cc=gcb08cc_tmp
	replace gcb08cc=gcb07cc_tmp if gcb08cc==.
	replace gcb08cc=gcb06cc_tmp if gcb08cc==.
gen gcb09cc=gcb09cc_tmp
	replace gcb09cc=gcb08cc_tmp if gcb09cc==.
	replace gcb09cc=gcb07cc_tmp if gcb09cc==.
gen gcb10cc=gcb10cc_tmp
	replace gcb10cc=gcb09cc_tmp if gcb10cc==.
	replace gcb10cc=gcb08cc_tmp if gcb10cc==.
gen gcb11cc=gcb11cc_tmp
	replace gcb11cc=gcb10cc_tmp if gcb11cc==.
	replace gcb11cc=gcb09cc_tmp if gcb11cc==.
gen gcb12cc=gcb12cc_tmp
	replace gcb12cc=gcb11cc_tmp if gcb12cc==.
	replace gcb12cc=gcb10cc_tmp if gcb12cc==.
gen gcb13cc=gcb13cc_tmp
	replace gcb13cc=gcb11cc_tmp if gcb13cc==.
gen gcb14cc=gcb14cc_tmp
gen gcb15cc=gcb15cc_tmp
	replace gcb15cc=gcb14cc_tmp if gcb15cc==.
gen gcb16cc=gcb16cc_tmp
	replace gcb16cc=gcb15cc_tmp if gcb16cc==.
gen gcb17cc=gcb17cc_tmp
	replace gcb17cc=gcb15cc_tmp if gcb17cc==.
gen gcb18cc=gcb18cc_tmp
	replace gcb18cc=gcb17cc_tmp if gcb18cc==.
gen gcb19cc=gcb19cc_tmp
	replace gcb19cc=gcb18cc_tmp if gcb19cc==.
	replace gcb19cc=gcb17cc_tmp if gcb19cc==.
gen gcb20cc=gcb20cc_tmp
	replace gcb20cc=gcb19cc_tmp if gcb20cc==.
	replace gcb20cc=gcb18cc_tmp if gcb20cc==.
gen gcb21cc=gcb21cc_tmp
	replace gcb21cc=gcb20cc_tmp if gcb21cc==.
	replace gcb21cc=gcb19cc_tmp if gcb21cc==.

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
drop *_tmp	
save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
