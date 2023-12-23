/******************************************************************************/
// Program to prepare data from the Heritage Foundation Index of Economic Freedom (HER)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$her_inputfile"
global outputfile "$her_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:D156) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her96`var'="." if her96`var'==".."
	cap destring her96`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:D167) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her98`var'="." if her98`var'==".."
	cap destring her98`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:D162) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her00`var'="." if her00`var'==".."
	cap destring her00`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:D163) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her02`var'="." if her02`var'==".."
	cap destring her02`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:D162) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her03`var'="." if her03`var'==".."
	cap destring her03`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:D162) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her04`var'="." if her04`var'==".."
	cap destring her04`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:D164) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her05`var'="." if her05`var'==".."
	cap destring her05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:D164) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her06`var'="." if her06`var'==".."
	cap destring her06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:D164) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her07`var'="." if her07`var'==".."
	cap destring her07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:D186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her08`var'="." if her08`var'==".."
	cap destring her08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:D186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her09`var'="." if her09`var'==".."
	cap destring her09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:D186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her10`var'="." if her10`var'==".."
	cap destring her10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:D186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her11`var'="." if her11`var'==".."
	cap destring her11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:D190) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her12`var'="." if her12`var'==".."
	cap destring her12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:D191) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her13`var'="." if her13`var'==".."
	cap destring her13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:D193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her14`var'="." if her14`var'==".."
	cap destring her14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:D193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in rl rq{
	replace her15`var'="." if her15`var'==".."
	cap destring her15`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:C193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her16rq="." if her16rq==".."
cap destring her16rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:C193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her17rq="." if her17rq==".."
cap destring her17rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:C193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her18rq="." if her18rq==".."
cap destring her18rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:C193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her19rq="." if her19rq==".."
cap destring her19rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:C193) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her20rq="." if her20rq==".."
cap destring her20rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:C191) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace her21rq="." if her21rq==".."
cap destring her21rq, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
