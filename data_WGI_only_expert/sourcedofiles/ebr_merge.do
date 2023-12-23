/******************************************************************************/
// Program to prepare data from European Bank for Reconstruction and Development
// Transition Report (EBR) historic dataset
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs
//
// Annual update notes: No need to update, this is a discontinued dataset that does not enter the WGI after 2016
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear

set more off

// Set input and output file names
global inputfile "$ebr_inputfile"
global outputfile "$ebr_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:C34) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr96rq="." if ebr96rq==".."
cap destring ebr96rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:C33) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr98rq="." if ebr98rq==".."
cap destring ebr98rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:C33) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr00rq="." if ebr00rq==".."
cap destring ebr00rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:C34) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr02rq="." if ebr02rq==".."
cap destring ebr02rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:C34) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr03rq="." if ebr03rq==".."
cap destring ebr03rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:C34) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr04rq="." if ebr04rq==".."
cap destring ebr04rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:C34) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr05rq="." if ebr05rq==".."
cap destring ebr05rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr06rq="." if ebr06rq==".."
cap destring ebr06rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr07rq="." if ebr07rq==".."
cap destring ebr07rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr08rq="." if ebr08rq==".."
cap destring ebr08rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr09rq="." if ebr09rq==".."
cap destring ebr09rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr10rq="." if ebr10rq==".."
cap destring ebr10rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:C36) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr11rq="." if ebr11rq==".."
cap destring ebr11rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:C40) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr12rq="." if ebr12rq==".."
cap destring ebr12rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:C41) firstrow case(lower) allstring

drop if code==""
drop country
replace ebr13rq="." if ebr13rq==".."
cap destring ebr13rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 / 15 /16 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20141516") cellrange(A7:C42) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 14 15 16{
	gen ebr`i'rq = ebr141516rq
}
drop ebr`i'141516
foreach i in 14 15 16{
	replace ebr`i'rq="." if ebr`i'rq==".."
	cap destring ebr`i'rq, replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


/******************************************************************************/
