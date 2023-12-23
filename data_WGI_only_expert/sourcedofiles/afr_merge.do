/******************************************************************************/
// Program to prepare data from Afrobarometer (AFR)
// Contents:
//	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
// 	SECTION 3: Fill gaps with lags of up to two years
// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 and SECTION 3 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1:  Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$afr_inputfile"
global outputfile "$afr_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2002-2003-2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI020304") cellrange(A7:F23) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr020304`var'="." if afr020304`var'==".."
	cap destring afr020304`var', replace
	foreach yr in 02 03 04{
		gen afr`yr'`var'=afr020304`var'
		}
	drop afr020304`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005-2006-2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI050607") cellrange(A7:F25) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr050607`var'="." if afr050607`var'==".."
	cap destring afr050607`var', replace
	foreach yr in 05 06 07{
		gen afr`yr'`var'=afr050607`var'
		}
	drop afr050607`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2008-2009-2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI080910") cellrange(A7:F27) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr080910`var'="." if afr080910`var'==".."
	cap destring afr080910`var', replace
	foreach yr in 08 09 10{
		gen afr`yr'`var'=afr080910`var'
		}
	drop afr080910`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011-2012-2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI111213") cellrange(A7:F40) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr111213`var'="." if afr111213`var'==".."
	cap destring afr111213`var', replace
	foreach yr in 11 12 13{
		gen afr`yr'`var'=afr111213`var'
		}
	drop afr111213`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:F28) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr14`var'="." if afr14`var'==".."
	cap destring afr14`var', replace
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015-16 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1516") cellrange(A7:F18) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr1516`var'="." if afr1516`var'==".."
	cap destring afr1516`var', replace
	foreach yr in 15 16{
		gen afr`yr'`var'=afr1516`var'
		}
	drop afr1516`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017-2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1718") cellrange(A7:F41) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr1718`var'="." if afr1718`var'==".."
	cap destring afr1718`var', replace
	foreach yr in 17 18 {
		gen afr`yr'`var'=afr1718`var'
		}
	drop afr1718`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019-2020-2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI192021") cellrange(A7:F33) firstrow case(lower) allstring
drop country
foreach var in va ge rl cc{
	replace afr192021`var'="." if afr192021`var'==".."
	cap destring afr192021`var', replace
	foreach yr in 19 20 21 {
		gen afr`yr'`var'=afr192021`var'
		}
	drop afr192021`var'
	}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
/******************************************************************************/

/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// This is done for this source because of its irregular timing and country 
// coverage
/******************************************************************************/
rename afr* afr*_tmp

// For data 2002-2013, no filling of gaps with lags (since each survey round covered a three-year period)
foreach yr in 02 03 04 05 06 07 08 09 10 11 12 13{
	foreach var in va ge rl cc{
		gen afr`yr'`var'=afr`yr'`var'_tmp
		}
	}

// For 2014 round fill gaps with previous round
foreach var in va ge rl cc{
	gen afr14`var'=afr14`var'_tmp
	replace afr14`var'=afr13`var'_tmp if afr14`var'==.
	}
	
// For 2015/16 round fill gaps with 2014
foreach var in va ge rl cc{
	gen afr15`var'=afr15`var'_tmp
	replace afr15`var'=afr14`var'_tmp if afr15`var'==.
	}
foreach var in va ge rl cc{
	gen afr16`var'=afr16`var'_tmp
	replace afr16`var'=afr14`var'_tmp if afr16`var'==.
	}
	
// For 2017/18 round fill gaps with 2015/16
foreach var in va ge rl cc{
	gen afr17`var'=afr17`var'_tmp
	replace afr17`var'=afr16`var'_tmp if afr17`var'==.
	}
foreach var in va ge rl cc{
	gen afr18`var'=afr18`var'_tmp
	replace afr18`var'=afr16`var'_tmp if afr18`var'==.
	}
	
// For 2021, do not fill gaps with lags as previous survey round is too old
foreach var in va ge rl cc{
	foreach yr in 19 20 21{
		gen afr`yr'`var'=afr`yr'`var'_tmp
		}
	}

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE	
	
drop *_tmp	
save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
