/******************************************************************************/
// Program to prepare data from the International Fund for Agricultural Development
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs
// SECTION 3: Fill gaps with lags of up to two years

// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 AND 3 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$ifd_inputfile"
global outputfile "$ifd_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:G132) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd04`var'="." if ifd04`var'==".."
	cap destring ifd04`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:G129) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd05`var'="." if ifd05`var'==".."
	cap destring ifd05`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:G108) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd06`var'="." if ifd06`var'==".."
	cap destring ifd06`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:G95) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd07`var'="." if ifd07`var'==".."
	cap destring ifd07`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:G98) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd08`var'="." if ifd08`var'==".."
	cap destring ifd08`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:G119) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd09`var'="." if ifd09`var'==".."
	cap destring ifd09`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:G120) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd10`var'="." if ifd10`var'==".."
	cap destring ifd10`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:G120) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd11`var'="." if ifd11`var'==".."
	cap destring ifd11`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:G106) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd12`var'="." if ifd12`var'==".."
	cap destring ifd12`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:G106) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd13`var'="." if ifd13`var'==".."
	cap destring ifd13`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:G107) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd14`var'="." if ifd14`var'==".."
	cap destring ifd14`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2015 / 16 / 17 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20151617") cellrange(A8:G110) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 15 16 17{
	foreach var in va rl rq ge cc{
		gen ifd`i'`var'=ifd151617`var'
	}
}
foreach var in va rl rq ge cc{
	drop ifd151617`var'
}
foreach i in 15 16 17{
	foreach var in va rl rq ge cc{
		replace ifd`i'`var'="." if ifd`i'`var'==".."
		cap destring ifd`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 / 19 / 20 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI20181920") cellrange(A8:G110) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 18 19 20{
	foreach var in va rl rq ge cc{
		gen ifd`i'`var'=ifd181920`var'
	}
}
foreach var in va rl rq ge cc{
	drop ifd181920`var'
}
foreach i in 18 19 20{
	foreach var in va rl rq ge cc{
		replace ifd`i'`var'="." if ifd`i'`var'==".."
		cap destring ifd`i'`var', replace
	}
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:G74) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach var in va rl rq ge cc{
	replace ifd21`var'="." if ifd21`var'==".."
	cap destring ifd21`var', replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/

/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// This is done through 2015 given irregular country coverage of the annual IFD reports
// Note the lags are used only until 2016 and not thereafter when IFD moved to 
// a three-year cycle
/******************************************************************************/
rename ifd* ifd*_tmp
foreach var in va ge rq rl cc{
	gen ifd04`var'=ifd04`var'_tmp 
	gen ifd05`var'=ifd05`var'_tmp
		replace ifd05`var'=ifd04`var'_tmp if ifd05`var'==.
	gen ifd06`var'=ifd06`var'_tmp
		replace ifd06`var'=ifd05`var'_tmp if ifd06`var'==.
		replace ifd06`var'=ifd04`var'_tmp if ifd06`var'==.
	gen ifd07`var'=ifd07`var'_tmp
		replace ifd07`var'=ifd06`var'_tmp if ifd07`var'==.
		replace ifd07`var'=ifd05`var'_tmp if ifd07`var'==.
	gen ifd08`var'=ifd08`var'_tmp
		replace ifd08`var'=ifd07`var'_tmp if ifd08`var'==.
		replace ifd08`var'=ifd06`var'_tmp if ifd08`var'==.
	gen ifd09`var'=ifd09`var'_tmp
		replace ifd09`var'=ifd08`var'_tmp if ifd09`var'==.
		replace ifd09`var'=ifd07`var'_tmp if ifd09`var'==.
	gen ifd10`var'=ifd10`var'_tmp
		replace ifd10`var'=ifd09`var'_tmp if ifd10`var'==.
		replace ifd10`var'=ifd08`var'_tmp if ifd10`var'==.
	gen ifd11`var'=ifd11`var'_tmp
		replace ifd11`var'=ifd10`var'_tmp if ifd11`var'==.
		replace ifd11`var'=ifd09`var'_tmp if ifd11`var'==.
	gen ifd12`var'=ifd12`var'_tmp
		replace ifd12`var'=ifd11`var'_tmp if ifd12`var'==.
		replace ifd12`var'=ifd10`var'_tmp if ifd12`var'==.
	gen ifd13`var'=ifd13`var'_tmp
		replace ifd13`var'=ifd12`var'_tmp if ifd13`var'==.
		replace ifd13`var'=ifd11`var'_tmp if ifd13`var'==.
	gen ifd14`var'=ifd14`var'_tmp
		replace ifd14`var'=ifd13`var'_tmp if ifd14`var'==.
		replace ifd14`var'=ifd12`var'_tmp if ifd14`var'==.
	gen ifd15`var'=ifd15`var'_tmp
		replace ifd15`var'=ifd14`var'_tmp if ifd15`var'==.
		replace ifd15`var'=ifd13`var'_tmp if ifd15`var'==.
	gen ifd16`var'=ifd16`var'_tmp
		replace ifd16`var'=ifd15`var'_tmp if ifd16`var'==.
		replace ifd16`var'=ifd14`var'_tmp if ifd16`var'==.
	gen ifd17`var'=ifd17`var'_tmp
	gen ifd18`var'=ifd18`var'_tmp
	gen ifd19`var'=ifd19`var'_tmp
	gen ifd20`var'=ifd20`var'_tmp
	gen ifd21`var'=ifd21`var'_tmp
	// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
}


drop *_tmp	

save "$outputfilepath\\$outputfile", replace

