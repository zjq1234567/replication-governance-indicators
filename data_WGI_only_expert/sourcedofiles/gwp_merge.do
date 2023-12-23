/******************************************************************************/
// Program to prepare data from the Gallup World Poll (GWP)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from the Data tab of the public file

// Annual update notes: No need to update annually, data for all years loaded from "data" tab
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$gwp_inputfile"
global outputfile "$gwp_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
clear
import excel using "$inputfilepath\\$inputfile", sheet("Data")  firstrow case(lower) allstring

replace code=strtrim(code)
drop if code=="" | code==" " | strlen(code)!=3

drop country
foreach var of varlist gwp*{
	replace `var'="" if `var'==".." | `var'=="." 
	destring(`var'), replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
