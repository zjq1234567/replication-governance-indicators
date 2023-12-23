/******************************************************************************/
// Program to prepare data from the Global Integrity Index (GII)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs
// SECTION 3: Fill gaps with lags of up to two years
// 
// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 ONLY (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
//  Note the two-year lags in SECTION 2 are only used until 2012, so they need not be updated.
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$gii_inputfile"
global outputfile "$gii_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A6:E47) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va rl cc{
    replace gii06`var'="." if gii06`var'==".."
	cap destring gii06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A6:E54) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va rl cc{
    replace gii07`var'="." if gii07`var'==".."
	cap destring gii07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A6:E52) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va rl cc{
    replace gii08`var'="." if gii08`var'==".."
	cap destring gii08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A6:E40) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va rl cc{
    replace gii09`var'="." if gii09`var'==".."
	cap destring gii09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A6:E37) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va rl cc{
    replace gii10`var'="." if gii10`var'==".."
	cap destring gii10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 / 12 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20112012") cellrange(A7:E38) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 11 12{
    foreach var in va rl cc{
		gen gii`i'`var' = gii1211`var'
	}
}
foreach var in va rl cc{
    drop gii1211`var'
}
foreach i in 12 11{
    foreach var in va rl cc{
	    replace gii`i'`var'="." if gii`i'`var'==".."
		cap destring gii`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii13`var'="." if gii13`var'==".."
	cap destring gii13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii14`var'="." if gii14`var'==".."
	cap destring gii14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii15`var'="." if gii15`var'==".."
	cap destring gii15`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii16`var'="." if gii16`var'==".."
	cap destring gii16`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii17`var'="." if gii17`var'==".."
	cap destring gii17`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii18`var'="." if gii18`var'==".."
	cap destring gii18`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii19`var'="." if gii19`var'==".."
	cap destring gii19`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii20`var'="." if gii20`var'==".."
	cap destring gii20`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:F61) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rl cc{
    replace gii21`var'="." if gii21`var'==".."
	cap destring gii21`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/


/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// Note the lags are used only until 2012 since country coverage was irregular
// over this period.  From 2013 onwards GII has consistently covered all countries
// in Africa on an annual basis, so no need to fill gaps with lags
/******************************************************************************/
rename gii* gii*_tmp
foreach var in va rl cc{
	gen gii06`var'=gii06`var'_tmp 
	gen gii07`var'=gii07`var'_tmp
		replace gii07`var'=gii06`var'_tmp if gii07`var'==.
	gen gii08`var'=gii08`var'_tmp
		replace gii08`var'=gii07`var'_tmp if gii08`var'==.
		replace gii08`var'=gii06`var'_tmp if gii08`var'==.
	gen gii09`var'=gii09`var'_tmp
		replace gii09`var'=gii08`var'_tmp if gii09`var'==.
		replace gii09`var'=gii07`var'_tmp if gii09`var'==.
	gen gii10`var'=gii10`var'_tmp
		replace gii10`var'=gii09`var'_tmp if gii10`var'==.
		replace gii10`var'=gii08`var'_tmp if gii10`var'==.
	gen gii11`var'=gii11`var'_tmp
		replace gii11`var'=gii10`var'_tmp if gii11`var'==.
		replace gii11`var'=gii09`var'_tmp if gii11`var'==.
	gen gii12`var'=gii12`var'_tmp
		replace gii12`var'=gii10`var'_tmp if gii12`var'==.
	}
foreach var in va ge rl cc{	
	gen gii13`var'=gii13`var'_tmp
	gen gii14`var'=gii14`var'_tmp
	gen gii15`var'=gii15`var'_tmp
	gen gii16`var'=gii16`var'_tmp
	gen gii17`var'=gii17`var'_tmp
	gen gii18`var'=gii18`var'_tmp
	gen gii19`var'=gii19`var'_tmp
	gen gii20`var'=gii20`var'_tmp
	gen gii21`var'=gii21`var'_tmp
	}

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

drop if code=="YUG"  // DROP THIS LINE FROM FINAL VERSION OF CODE
drop *_tmp	
save "$outputfilepath\\$outputfile", replace
