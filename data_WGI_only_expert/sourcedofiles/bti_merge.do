/******************************************************************************/
// Program to prepare data from Bertelsmann Transformation Index (BTI)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs
//
// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$bti_inputfile"
global outputfile "$bti_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)

save "$outputfilepath\\$outputfile", replace
/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI02") cellrange(A7:G123) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in va ge rq rl cc{
    replace bti02`var'="." if bti02`var'==".."
	cap destring bti02`var', replace
}
drop bti02cc	// Note this is an empty column in the Excel file

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 / 04 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0304") cellrange(A7:G126) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 03 04{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti0304`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti0304`var'
}
foreach i in 03 04{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 / 06 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0506") cellrange(A7:G132) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 05 06{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti0506`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti0506`var'
}
foreach i in 05 06{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 / 08 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI0708") cellrange(A7:G135) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 07 08{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti0708`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti0708`var'
}
foreach i in 07 08{
	foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 / 10 / 11 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI091011") cellrange(A7:G135) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 09 10 11{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti091011`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti091011`var'
}
foreach i in 09 10 11{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 / 13 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1213") cellrange(A7:G136) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 12 13{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti1213`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti1213`var'
}
foreach i in 12 13{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 / 15 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1415") cellrange(A7:G136) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 14 15{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti1415`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti1415`var'
}
foreach i in 14 15{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 / 17 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1617") cellrange(A7:G136) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 16 17{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti1617`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti1617`var'
}
foreach i in 16 17{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 / 19 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1819") cellrange(A7:G144) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 18 19{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti1819`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti1819`var'
}
foreach i in 18 19{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 / 21 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:G144) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 20 21{
    foreach var in va ge rq rl cc{
	    gen bti`i'`var' = bti2021`var'
	}
}
foreach var in va ge rq rl cc{
    drop bti2021`var'
}
foreach i in 20 21{
    foreach var in va ge rq rl cc{
		replace bti`i'`var'="." if bti`i'`var'==".."
		cap destring bti`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
