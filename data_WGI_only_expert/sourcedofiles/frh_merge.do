/******************************************************************************/
// Program to prepare data from Freedom House (FRH)
//
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
//
// Annual update notes:
//	Step 1:  Add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$frh_inputfile"
global outputfile "$frh_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh96`var'="." if frh96`var'==".."
	cap destring frh96`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
drop frh96cc	// Note this variable is not available in 1996 -- column in Excel file is an empty placeholder
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A7:E207) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh98`var'="." if frh98`var'==".."
	cap destring frh98`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh00`var'="." if frh00`var'==".."
	cap destring frh00`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh02`var'="." if frh02`var'==".."
	cap destring frh02`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh03`var'="." if frh03`var'==".."
	cap destring frh03`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh04`var'="." if frh04`var'==".."
	cap destring frh04`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh05`var'="." if frh05`var'==".."
	cap destring frh05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh06`var'="." if frh06`var'==".."
	cap destring frh06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh07`var'="." if frh07`var'==".."
	cap destring frh07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh08`var'="." if frh08`var'==".."
	cap destring frh08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh09`var'="." if frh09`var'==".."
	cap destring frh09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh10`var'="." if frh10`var'==".."
	cap destring frh10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:E205) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh11`var'="." if frh11`var'==".."
	cap destring frh11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:E205) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh12`var'="." if frh12`var'==".."
	cap destring frh12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:E205) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh13`var'="." if frh13`var'==".."
	cap destring frh13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:E206) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh14`var'="." if frh14`var'==".."
	cap destring frh14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:E205) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh15`var'="." if frh15`var'==".."
	cap destring frh15`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh16`var'="." if frh16`var'==".."
	cap destring frh16`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh17`var'="." if frh17`var'==".."
	cap destring frh17`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh18`var'="." if frh18`var'==".."
	cap destring frh18`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh19`var'="." if frh19`var'==".."
	cap destring frh19`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:E204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh20`var'="." if frh20`var'==".."
	cap destring frh20`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:E205) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl cc{
	replace frh21`var'="." if frh21`var'==".."
	cap destring frh21`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/

