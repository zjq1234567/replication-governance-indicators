/******************************************************************************/
// Program to prepare data from the Reporters Without Borders Press Freedom Index (RSF)  
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes: add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$rsf_inputfile"
global outputfile "$rsf_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A8:C147) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf02va="." if rsf02va==".."
cap destring rsf02va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A8:C172) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf03va="." if rsf03va==".."
cap destring rsf03va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:C173) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf04va="." if rsf04va==".."
cap destring rsf04va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:C173) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf05va="." if rsf05va==".."
cap destring rsf05va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:C174) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf06va="." if rsf06va==".."
cap destring rsf06va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:C174) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf07va="." if rsf07va==".."
cap destring rsf07va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:C178) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf08va="." if rsf08va==".."
cap destring rsf08va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:C180) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf09va="." if rsf09va==".."
cap destring rsf09va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:C182) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf10va="." if rsf10va==".."
cap destring rsf10va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:C183) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf11va="." if rsf11va==".."
cap destring rsf11va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:C185) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf12va="." if rsf12va==".."
cap destring rsf12va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf13va="." if rsf13va==".."
cap destring rsf13va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf14va="." if rsf14va==".."
cap destring rsf14va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf15va="." if rsf15va==".."
cap destring rsf15va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf16va="." if rsf16va==".."
cap destring rsf16va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf17va="." if rsf17va==".."
cap destring rsf17va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf18va="." if rsf18va==".."
cap destring rsf18va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf19va="." if rsf19va==".."
cap destring rsf19va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A8:C186) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf20va="." if rsf20va==".."
cap destring rsf20va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:C187) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace rsf21va="." if rsf21va==".."
cap destring rsf21va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/
