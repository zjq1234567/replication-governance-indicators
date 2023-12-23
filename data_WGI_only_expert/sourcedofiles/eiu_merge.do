/******************************************************************************/
// Program to prepare data from Economist Intelligence Unit (EIU) 
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from the Data tab of the public file

// Annual update notes:  No need to update annually
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$eiu_inputfile"
global outputfile "$eiu_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
clear
import excel using "$inputfilepath\\$inputfile", sheet("Data")  firstrow case(lower) allstring
drop country

replace code=strtrim(code)
drop if code=="Year" | code=="" | code==" " | strlen(code)!=3

foreach var of varlist eiu*{
	replace `var'="" if `var'==".." | `var'=="." 
	destring(`var'), replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
