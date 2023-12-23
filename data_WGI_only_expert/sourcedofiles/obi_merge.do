/******************************************************************************/
// Program to prepare data from the International Budget Project Open Budget Index (OBI)  
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes: add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$obi_inputfile"
global outputfile "$obi_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace
//save "$outputfilepath/$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2005 / 06 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI200605") cellrange(A8:C67) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 05 06 {
	gen obi`i'va=obi0605va
}

drop obi0605va

foreach i in 05 06{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 / 08 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI200807") cellrange(A8:C93) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 07 08 {
	gen obi`i'va=obi0807va
}

drop obi0807va

foreach i in 07 08{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 / 10 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201009") cellrange(A8:C102) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 09 10 {
	gen obi`i'va=obi1009va
}

drop obi1009va

foreach i in 09 10{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 / 12 / 13 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20131211") cellrange(A8:C109) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 11 12 13 {
	gen obi`i'va=obi111213va
}

drop obi111213va

foreach i in 11 12 13{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 / 15 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201415") cellrange(A8:C110) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 14 15 {
	gen obi`i'va=obi1415va
}

drop obi1415va

foreach i in 14 15{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 / 17 / 18 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20161718") cellrange(A8:C123) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 16 17 18 {
	gen obi`i'va=obi161718va
}

drop obi161718va

foreach i in 16 17 18{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 / 20 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201920") cellrange(A8:C125) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 19 20 {
	gen obi`i'va=obi1920va
}

drop obi1920va

foreach i in 19 20{
	replace obi`i'va="." if obi`i'va==".."
	cap destring obi`i'va, replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:C128) firstrow case(lower) allstring

drop if code==""
drop country

replace obi21va="." if obi21va==".."
cap destring obi21va, replace


merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
