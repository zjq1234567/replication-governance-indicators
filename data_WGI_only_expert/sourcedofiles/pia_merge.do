/******************************************************************************/
// Program to prepare data from World Bank Country Policy and Institutional Assessments (PIA)
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from the Data tab of the public file

// Annual update notes:  add code for new year at end of SECTION 2 at location // ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/

clear
set more off
// Set input and output file names
global inputfile "$pia_inputfile"
global outputfile "$pia_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:F81) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia05`var'="." if pia05`var'==".."
	cap destring pia05`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:F83) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia06`var'="." if pia06`var'==".."
	cap destring pia06`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:F83) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia07`var'="." if pia07`var'==".."
	cap destring pia07`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:F83) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia08`var'="." if pia08`var'==".."
	cap destring pia08`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:F85) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia09`var'="." if pia09`var'==".."
	cap destring pia09`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:F85) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia10`var'="." if pia10`var'==".."
	cap destring pia10`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:F86) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia11`var'="." if pia11`var'==".."
	cap destring pia11`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:F88) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia12`var'="." if pia12`var'==".."
	cap destring pia12`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:F89) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia13`var'="." if pia13`var'==".."
	cap destring pia13`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:F84) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia14`var'="." if pia14`var'==".."
	cap destring pia14`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:F84) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia15`var'="." if pia15`var'==".."
	cap destring pia15`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:F81) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia16`var'="." if pia16`var'==".."
	cap destring pia16`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:F81) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia17`var'="." if pia17`var'==".."
	cap destring pia17`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A8:F81) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia18`var'="." if pia18`var'==".."
	cap destring pia18`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A8:F80) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia19`var'="." if pia19`var'==".."
	cap destring pia19`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A8:F81) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia20`var'="." if pia20`var'==".."
	cap destring pia20`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:F80) firstrow case(lower) allstring

drop if code==""
drop country
foreach var in ge rq rl cc{
    replace pia21`var'="." if pia21`var'==".."
	cap destring pia21`var', replace
}

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

save "$outputfilepath\\$outputfile", replace
/******************************************************************************/


/******************************************************************************/
// Note: In the WGI vintages through the 2021 release, we filled gaps with lags
// beginning in 2014.  This is because around 2014 the CPIA began being produced
// at less than annual frequency for non-IDA countries (where the data also was 
// confidential).  Non-confidential data for IDA countries has always been produced
// annually.  Beginning with the 2022 vintage of the WGI where confidential CPIA 
// data has been dropped, it no longer is necessary to fill gaps with lags
/******************************************************************************/
