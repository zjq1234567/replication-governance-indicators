/******************************************************************************/
// Program to prepare data from the Human Rights Measurement Initiative (HRM)
//
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
// 	SECTION 3: Fill gaps with lags of up to two years
//
// Annual update notes:
//	Add code for new year at end of SECTION 2 and SECTION 3 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$hrm_inputfile"
global outputfile "$hrm_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:D46) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va pv{
    replace hrm17`var'="." if hrm17`var'==".."
	cap destring hrm17`var', replace
	
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:D46) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va pv{
    replace hrm18`var'="." if hrm18`var'==".."
	cap destring hrm18`var', replace
	
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:D46) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va pv{
    replace hrm19`var'="." if hrm19`var'==".."
	cap destring hrm19`var', replace
	
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:D46) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va pv{
    replace hrm20`var'="." if hrm20`var'==".."
	cap destring hrm20`var', replace
	
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:D41) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country

foreach var in va pv{
    replace hrm21`var'="." if hrm21`var'==".."
	cap destring hrm21`var', replace
	
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

//
/******************************************************************************/

/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// This is done because of the irregular country coverage of this data source
/******************************************************************************/
rename hrm* hrm*_tmp
foreach var in va pv{
	gen hrm17`var'=hrm17`var'_tmp 
	gen hrm18`var'=hrm18`var'_tmp
		replace hrm18`var'=hrm17`var'_tmp if hrm18`var'==.
	gen hrm19`var'=hrm19`var'_tmp
		replace hrm19`var'=hrm18`var'_tmp if hrm19`var'==.
		replace hrm19`var'=hrm17`var'_tmp if hrm19`var'==.
	gen hrm20`var'=hrm20`var'_tmp
		replace hrm20`var'=hrm19`var'_tmp if hrm20`var'==.
		replace hrm20`var'=hrm18`var'_tmp if hrm20`var'==.
	gen hrm21`var'=hrm21`var'_tmp
		replace hrm21`var'=hrm20`var'_tmp if hrm21`var'==.
		replace hrm21`var'=hrm19`var'_tmp if hrm21`var'==.
			
	// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
}

drop *_tmp	
save "$outputfilepath\\$outputfile", replace
