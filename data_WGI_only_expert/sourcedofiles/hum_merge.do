/******************************************************************************/
// Program to prepare data from the Cingranelli Richards Human Rights Database & Political Terror Scale (HUM)
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
global inputfile "$hum_inputfile"
global outputfile "$hum_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum96`var'="." if hum96`var'==".."
	cap destring hum96`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum98`var'="." if hum98`var'==".."
	cap destring hum98`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum00`var'="." if hum00`var'==".."
	cap destring hum00`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum02`var'="." if hum02`var'==".."
	cap destring hum02`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum03`var'="." if hum03`var'==".."
	cap destring hum03`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum04`var'="." if hum04`var'==".."
	cap destring hum04`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum05`var'="." if hum05`var'==".."
	cap destring hum05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum06`var'="." if hum06`var'==".."
	cap destring hum06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum07`var'="." if hum07`var'==".."
	cap destring hum07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum08`var'="." if hum08`var'==".."
	cap destring hum08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum09`var'="." if hum09`var'==".."
	cap destring hum09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum10`var'="." if hum10`var'==".."
	cap destring hum10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum11`var'="." if hum11`var'==".."
	cap destring hum11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:E209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum12`var'="." if hum12`var'==".."
	cap destring hum12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va pv rl{
    replace hum13`var'="." if hum13`var'==".."
	cap destring hum13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:C203) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum14pv="." if hum14pv==".."
cap destring hum14pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:C211) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum15pv="." if hum15pv==".."
cap destring hum15pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum16pv="." if hum16pv==".."
cap destring hum16pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum17pv="." if hum17pv==".."
cap destring hum17pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum18pv="." if hum18pv==".."
cap destring hum18pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace hum19pv="." if hum19pv==".."
cap destring hum19pv, replace
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 / 21 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI202021") cellrange(A7:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 20 21{
	gen hum`i'pv = hum2021pv
}
drop hum2021pv
foreach i in 20 21{
	replace hum`i'pv="." if hum`i'pv==".."
	cap destring hum`i'pv, replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HUME
