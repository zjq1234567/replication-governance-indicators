/******************************************************************************/
// Program to prepare data from the iJET Country Security Risk Ratings
//
// Contents:
// SECTION 1: Preliminaries
// SECTION 2: Load data from individual country tabs

// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off

// Set input and output file names
global inputfile "$ijt_inputfile"
global outputfile "$ijt_outputfile"

// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:C175) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt04pv="." if ijt04pv==".."
cap destring ijt04pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:C184) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt05pv="." if ijt05pv==".."
cap destring ijt05pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:C189) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt06pv="." if ijt06pv==".."
cap destring ijt06pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:C191) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt07pv="." if ijt07pv==".."
cap destring ijt07pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:C192) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt08pv="." if ijt08pv==".."
cap destring ijt08pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:C202) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt09pv="." if ijt09pv==".."
cap destring ijt09pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:C211) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt10pv="." if ijt10pv==".."
cap destring ijt10pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:C197) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt11pv="." if ijt11pv==".."
cap destring ijt11pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:C202) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt12pv="." if ijt12pv==".."
cap destring ijt12pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:C202) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt13pv="." if ijt13pv==".."
cap destring ijt13pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:C202) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt14pv="." if ijt14pv==".."
cap destring ijt14pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace


// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:C202) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt15pv="." if ijt15pv==".."
cap destring ijt15pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt16pv="." if ijt16pv==".."
cap destring ijt16pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt17pv="." if ijt17pv==".."
cap destring ijt17pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2018") cellrange(A8:C204) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt18pv="." if ijt18pv==".."
cap destring ijt18pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2019 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2019") cellrange(A8:C209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt19pv="." if ijt19pv==".."
cap destring ijt19pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2020") cellrange(A8:C209) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt20pv="." if ijt20pv==".."
cap destring ijt20pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2021 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2021") cellrange(A8:C210) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country

replace ijt21pv="." if ijt21pv==".."
cap destring ijt21pv, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

save "$outputfilepath\\$outputfile", replace
/******************************************************************************/


