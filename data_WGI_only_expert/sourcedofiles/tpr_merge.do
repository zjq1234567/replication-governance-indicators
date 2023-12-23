/******************************************************************************/
// Program to prepare data from the U.S. Department of State Trafficking in Persons Report (TPR)   

// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
//
// Annual update notes:  Add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/

clear
set more off

// Set input and output file names
global inputfile "$tpr_inputfile"
global outputfile "$tpr_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/
// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A8:C89) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr00rl="." if tpr00rl==".."
cap destring tpr00rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A8:C124) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr02rl="." if tpr02rl==".."
cap destring tpr02rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A8:C139) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr03rl="." if tpr03rl==".."
cap destring tpr03rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:C149) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr04rl="." if tpr04rl==".."
cap destring tpr04rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:C157) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr05rl="." if tpr05rl==".."
cap destring tpr05rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:C159) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr06rl="." if tpr06rl==".."
cap destring tpr06rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:C161) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr07rl="." if tpr07rl==".."
cap destring tpr07rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:C181) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr08rl="." if tpr08rl==".."
cap destring tpr08rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:C185) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr09rl="." if tpr09rl==".."
cap destring tpr09rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:C191) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr10rl="." if tpr10rl==".."
cap destring tpr10rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:C192) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr11rl="." if tpr11rl==".."
cap destring tpr11rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:C193) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr12rl="." if tpr12rl==".."
cap destring tpr12rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:C193) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr13rl="." if tpr13rl==".."
cap destring tpr13rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:C195) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr14rl="." if tpr14rl==".."
cap destring tpr14rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:C196) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr15rl="." if tpr15rl==".."
cap destring tpr15rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:C195) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr16rl="." if tpr16rl==".."
cap destring tpr16rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:C195) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr17rl="." if tpr17rl==".."
cap destring tpr17rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A8:C195) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr18rl="." if tpr18rl==".."
cap destring tpr18rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A8:C194) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr19rl="." if tpr19rl==".."
cap destring tpr19rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A8:C197) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr20rl="." if tpr20rl==".."
cap destring tpr20rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:C196) firstrow case(lower) allstring

drop if code=="" | code==".." | code=="."
drop country
replace tpr21rl="." if tpr21rl==".."
cap destring tpr21rl, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE
