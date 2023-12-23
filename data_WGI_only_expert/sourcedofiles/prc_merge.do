/******************************************************************************/
// Program to prepare data from the Political and Economic Risk Consultancy Corruption in Asia Survey (PRC) 
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes: add code for new year at end of SECTION 2 
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$prc_inputfile"
global outputfile "$prc_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 1996 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1996") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc96cc="." if prc96cc==".."
cap destring prc96cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 1998 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI1998") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc98cc="." if prc98cc==".."
cap destring prc98cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc00cc="." if prc00cc==".."
cap destring prc00cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc02cc="." if prc02cc==".."
cap destring prc02cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc03cc="." if prc03cc==".."
cap destring prc03cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc04cc="." if prc04cc==".."
cap destring prc04cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc05cc="." if prc05cc==".."
cap destring prc05cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc06cc="." if prc06cc==".."
cap destring prc06cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc07cc="." if prc07cc==".."
cap destring prc07cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc08cc="." if prc08cc==".."
cap destring prc08cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc09cc="." if prc09cc==".."
cap destring prc09cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc10cc="." if prc10cc==".."
cap destring prc10cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:C24) firstrow case(lower) allstring

drop if code==""
drop country
replace prc11cc="." if prc11cc==".."
cap destring prc11cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc12cc="." if prc12cc==".."
cap destring prc12cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc13cc="." if prc13cc==".."
cap destring prc13cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc14cc="." if prc14cc==".."
cap destring prc14cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc15cc="." if prc15cc==".."
cap destring prc15cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc16cc="." if prc16cc==".."
cap destring prc16cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc17cc="." if prc17cc==".."
cap destring prc17cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc18cc="." if prc18cc==".."
cap destring prc18cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc19cc="." if prc19cc==".."
cap destring prc19cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc20cc="." if prc20cc==".."
cap destring prc20cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:C25) firstrow case(lower) allstring

drop if code==""
drop country
replace prc21cc="." if prc21cc==".."
cap destring prc21cc, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
