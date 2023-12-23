/******************************************************************************/
// Program to prepare data from the Insitutional Provides Database (IPD)
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs

// Annual update notes: No need to update, this is a discontinued data source
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$ipd_inputfile"
global outputfile "$ipd_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2006/07/08 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI060708") cellrange(A8:H93) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 06 07 08{
	foreach var in va pv rq rl cc ge{
		gen ipd`i'`var'=ipd080706`var'
	}
}
foreach var in va pv rq rl cc ge{
	drop ipd080706`var'
}
foreach i in 06 07 08{
	foreach var in va pv rq rl cc ge{
		replace ipd`i'`var'="." if ipd`i'`var'==".."
		cap destring ipd`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009/10/11 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI091011") cellrange(A8:H131) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 09 10 11{
	foreach var in va pv rq rl cc ge{
		gen ipd`i'`var'=ipd111009`var'
	}
}
foreach var in va pv rq rl cc ge{
	drop ipd111009`var'
}
foreach i in 09 10 11{
	foreach var in va pv rq rl cc ge{
		replace ipd`i'`var'="." if ipd`i'`var'==".."
		cap destring ipd`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012/13/14/15 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI12131415") cellrange(A9:H152) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 12 13 14 15{
	foreach var in va pv rq rl cc ge{
		gen ipd`i'`var'=ipd15141312`var'
	}
}
foreach var in va pv rq rl cc ge{
	drop ipd15141312`var'
}
foreach i in 12 13 14 15{
	foreach var in va pv rq rl cc ge{
		replace ipd`i'`var'="." if ipd`i'`var'==".."
		cap destring ipd`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016/17/18/19 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI16171819") cellrange(A9:H156) firstrow case(lower) allstring

drop if code==""
drop country
foreach i in 16 17 18 19{
	foreach var in va pv rq rl cc ge{
		gen ipd`i'`var'=ipd16171819`var'
	}
}
foreach var in va pv rq rl cc ge{
	drop ipd16171819`var'
}
foreach i in 16 17 18 19{
	foreach var in va pv rq rl cc ge{
		replace ipd`i'`var'="." if ipd`i'`var'==".."
		cap destring ipd`i'`var', replace
	}
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace




