/******************************************************************************/
// Program to prepare data from Business Environment and Enterprise Performance Survey (BPS)
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
// Annual update notes: No need to update. This is a discontinued dataset that last enters WGI in 2015.
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$bps_inputfile"
global outputfile "$bps_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI00") cellrange(A7:F33) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
	replace bps00`var'="." if bps00`var'==".."
	cap destring bps00`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002/03/04 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI040302") cellrange(A7:F34) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 02 03 04{
	foreach var in ge rq rl cc{
		gen bps`i'`var'=bps040302`var'
	}
}
foreach var in ge rq rl cc{
	drop bps040302`var'
}
foreach i in 02 03 04{
	foreach var in ge rq rl cc{
		replace bps`i'`var'="." if bps`i'`var'==".."
		cap destring bps`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005/06/07 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI070605") cellrange(A7:F34) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 05 06 07{
	foreach var in ge rq rl cc{
		gen bps`i'`var'=bps070605`var'
	}
}
foreach var in ge rq rl cc{
	drop bps070605`var'
}
foreach i in 05 06 07{
	foreach var in ge rq rl cc{
		replace bps`i'`var'="." if bps`i'`var'==".."
		cap destring bps`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 / 09 / 10 / 11 / 12 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1211100908") cellrange(A7:F37) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 08 09 10 11 12{
	foreach var in ge rq rl cc{
		gen bps`i'`var'=bps1211100908`var'
	}
}
foreach var in ge rq rl cc{
	drop bps1211100908`var'
}
foreach i in 08 09 10 11 12{
	foreach var in ge rq rl cc{
		replace bps`i'`var'="." if bps`i'`var'==".."
		cap destring bps`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 / 14 / 15 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20131415") cellrange(A8:F38) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 13 14 15{
	foreach var in ge rq rl cc{
		gen bps`i'`var'=bps131415`var'
	}
}
foreach var in ge rq rl cc{
	drop bps131415`var'
}
foreach i in 13 14 15{
	foreach var in ge rq rl cc{
		replace bps`i'`var'="." if bps`i'`var'==".."
		cap destring bps`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

