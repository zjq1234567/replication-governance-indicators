/******************************************************************************/
// Program to prepare data from the African Electoral Index (IRP)
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs

// Annual update notes: Add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear all
global masterfilepath "C:\Users\jpavi\Documents\WorldBank WGI"
global year "2021"
/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/

clear
set more off
// Set input and output file names
global inputfile "$irp_inputfile"
global outputfile "$irp_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp00va="." if irp00va==".."
cap destring irp00va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp02va="." if irp02va==".."
cap destring irp02va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp03va="." if irp03va==".."
cap destring irp03va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp04va="." if irp04va==".."
cap destring irp04va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp05va="." if irp05va==".."
cap destring irp05va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp06va="." if irp06va==".."
cap destring irp06va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp07va="." if irp07va==".."
cap destring irp07va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp08va="." if irp08va==".."
cap destring irp08va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp09va="." if irp09va==".."
cap destring irp09va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A7:C60) firstrow case(lower) allstring

drop if code==""
drop country
replace irp10va="." if irp10va==".."
cap destring irp10va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp11va="." if irp11va==".."
cap destring irp11va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp12va="." if irp12va==".."
cap destring irp12va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp13va="." if irp13va==".."
cap destring irp13va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp14va="." if irp14va==".."
cap destring irp14va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp15va="." if irp15va==".."
cap destring irp15va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp16va="." if irp16va==".."
cap destring irp16va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp17va="." if irp17va==".."
cap destring irp17va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp18va="." if irp18va==".."
cap destring irp18va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp19va="." if irp19va==".."
cap destring irp19va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp20va="." if irp20va==".."
cap destring irp20va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A7:C61) firstrow case(lower) allstring

drop if code==""
drop country
replace irp21va="." if irp21va==".."
cap destring irp21va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
