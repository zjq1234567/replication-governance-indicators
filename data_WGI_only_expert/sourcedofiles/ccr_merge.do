/******************************************************************************/
// Program to prepare data from Freedom House Countries at the Crossroads (CCR)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes: No need to update, this is a discontinued data source last used in WGI in 2013
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear

set more off

// Set input and output file names
global inputfile "$ccr_inputfile"
global outputfile "$ccr_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
// SECTION 2: Load data 
// Note that CCR had very irregular timing.  Therefore the WGI uses
// a unique set of country-specific rules to assign the data from CCR rounds to calendar years
// These are coded in the Excel file, with the final data appearing in 
// the "FinalData" tab.  This tab is loaded directly here.
/******************************************************************************/

clear
import excel using "$inputfilepath\\$inputfile", sheet("FinalData") cellrange(B1:AI254) firstrow case(lower) allstring
drop if code=="" | code=="Year" | code=="Indicator" | code=="Rep/NonRep"

foreach var in va rl cc{
	foreach yr in 03 04 05 06 07 08 09 10 11 12 13{
		replace ccr`yr'`var'="." if ccr`yr'`var'==".."
		cap destring ccr`yr'`var', replace
		}
	}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// NO NEED TO ADD ADDTIONAL BLOCKS, AS THIS IS A HISTORIC FILE
/******************************************************************************/

