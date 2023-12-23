/******************************************************************************/
// Program to prepare data from IHS Markit (WMO)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from the Data tab of the public file

// Annual update notes: No need to update annually, data for all years loaded from Data tab
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear

set more off

// Set input and output file names
global inputfile "$wmo_inputfile"
global outputfile "$wmo_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data 
/******************************************************************************/
clear
import excel using "$inputfilepath\\$inputfile", sheet("Data")  firstrow case(lower) allstring
drop country

replace code=strtrim(code)
drop if code=="Year" | code=="" | code==" " | strlen(code)!=3

foreach var of varlist wmo*{
	replace `var'="" if `var'==".." | `var'=="." | `var'=="#N/A"
	destring(`var'), replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
