/******************************************************************************/
// Program to prepare data from the International Research and Exchanges Board Media Sustainability Index (MSI)  
// Contents:
// 	SECTION 1: Preliminaries
// 	SECTION 2: Load data from individual country tabs
// 	SECTION 3: Fill gaps with lags of up to two years

// Annual update notes:
//	Step 1:  add code for new year at end of SECTION 2 and SECTION 3 (see note "ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE" below)
//  Note: see detailed note below about updating blocks in SECTION 3
/******************************************************************************/

/******************************************************************************/
//	Note: A new Vibrant Information Barometer (VIBE) index was introduced. New indicators are used starting from the 2020 update. WGI2018 tab changed to WGI201819 tab to stop treating the source as defunct. The WGI2019 column in the Merge tab picked up the past data, but the WGI2020 column in the Merge tab only takes one year for the time being, as it is using a new set of indicators for which we don't want to mix. Thus, SECTION 3 should not create two-year lags in 2020 and 2021 (same as 2020), but should start lags again in 2022 if data resumes.
/******************************************************************************/

/******************************************************************************/
// SECTION 1: Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output file names
global inputfile "$msi_inputfile"
global outputfile "$msi_outputfile"
// Initialize dataset with country codes
import excel using "$inputfilepath\\countrycodes.xlsx", firstrow case(lower)
save "$outputfilepath\\$outputfile", replace

/******************************************************************************/
// SECTION 2: Load data from individual country tabs
/******************************************************************************/

// 2000 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2000") cellrange(A8:C28) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi00va="." if msi00va==".."
cap destring msi00va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2002 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2002") cellrange(A8:C28) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi02va="." if msi02va==".."
cap destring msi02va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2003 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2003") cellrange(A8:C28) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi03va="." if msi03va==".."
cap destring msi03va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2004 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2004") cellrange(A8:C47) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi04va="." if msi04va==".."
cap destring msi04va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2005 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2005") cellrange(A8:C84) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi05va="." if msi05va==".."
cap destring msi05va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2006 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2006") cellrange(A8:C84) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi06va="." if msi06va==".."
cap destring msi06va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2007 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2007") cellrange(A8:C88) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi07va="." if msi07va==".."
cap destring msi07va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2008 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2008") cellrange(A8:C88) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi08va="." if msi08va==".."
cap destring msi08va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2009 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2009") cellrange(A8:C70) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi09va="." if msi09va==".."
cap destring msi09va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2010 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2010") cellrange(A8:C29) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi10va="." if msi10va==".."
cap destring msi10va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2011 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2011") cellrange(A8:C90) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi11va="." if msi11va==".."
cap destring msi11va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2012 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2012") cellrange(A8:C48) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi12va="." if msi12va==".."
cap destring msi12va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2013 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2013") cellrange(A8:C49) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi13va="." if msi13va==".."
cap destring msi13va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2014 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2014") cellrange(A8:C30) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi14va="." if msi14va==".."
cap destring msi14va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2015 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2015") cellrange(A8:C31) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi15va="." if msi15va==".."
cap destring msi15va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2016 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2016") cellrange(A8:C30) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi16va="." if msi16va==".."
cap destring msi16va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2017 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI2017") cellrange(A8:C30) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
replace msi17va="." if msi17va==".."
cap destring msi17va, replace

merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2018 / 19 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI201819") cellrange(A8:C30) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 18 19{
	gen msi`i'va=msi1819va
}
drop msi1819va

foreach i in 18 19{
	replace msi`i'va="." if msi`i'va==".."
	cap destring msi`i'va, replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// 2020 / 21 Data
clear
import excel using "$inputfilepath\\$inputfile", sheet("WGI202021") cellrange(A8:C21) firstrow case(lower) allstring

drop if code=="" | code==".."
drop country
foreach i in 20 21{
	gen msi`i'va=msi2021va
}
drop msi2021va

foreach i in 20 21{
	replace msi`i'va="." if msi`i'va==".."
	cap destring msi`i'va, replace
}
merge 1:1 code using "$outputfilepath\\$outputfile"
drop _merge
save "$outputfilepath\\$outputfile", replace

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

/******************************************************************************/

/******************************************************************************/
// SECTION 3: Fill gaps with lags of up to two years
// This is done because of irregular country coverage in the MSI reports
// Note that this data source changes in 2020 dropping old indicators and
// adding new Vibrant Information Barometer, so lags from 2019 and 2018 not used
// in 2020 or 2021
/******************************************************************************/
rename msi* msi*_tmp
gen msi00va=msi00va_tmp 
gen msi02va=msi02va_tmp
	replace msi02va=msi00va_tmp if msi02va==.
gen msi03va=msi03va_tmp
	replace msi03va=msi02va_tmp if msi03va==.
	replace msi03va=msi00va_tmp if msi03va==.
gen msi04va=msi04va_tmp
	replace msi04va=msi03va_tmp if msi04va==.
	replace msi04va=msi02va_tmp if msi04va==.
gen msi05va=msi05va_tmp
	replace msi05va=msi04va_tmp if msi05va==.
	replace msi05va=msi03va_tmp if msi05va==.
gen msi06va=msi06va_tmp
	replace msi06va=msi05va_tmp if msi06va==.
	replace msi06va=msi04va_tmp if msi06va==.
gen msi07va=msi07va_tmp
	replace msi07va=msi06va_tmp if msi07va==.
	replace msi07va=msi05va_tmp if msi07va==.
gen msi08va=msi08va_tmp
	replace msi08va=msi07va_tmp if msi08va==.
	replace msi08va=msi06va_tmp if msi08va==.
gen msi09va=msi09va_tmp
	replace msi09va=msi08va_tmp if msi09va==.
	replace msi09va=msi07va_tmp if msi09va==.
gen msi10va=msi10va_tmp
	replace msi10va=msi09va_tmp if msi10va==.
	replace msi10va=msi08va_tmp if msi10va==.
gen msi11va=msi11va_tmp
	replace msi11va=msi10va_tmp if msi11va==.
	replace msi11va=msi09va_tmp if msi11va==.
gen msi12va=msi12va_tmp
	replace msi12va=msi11va_tmp if msi12va==.
	replace msi12va=msi10va_tmp if msi12va==.
gen msi13va=msi13va_tmp
	replace msi13va=msi12va_tmp if msi13va==.
	replace msi13va=msi11va_tmp if msi13va==.
gen msi14va=msi14va_tmp
	replace msi14va=msi13va_tmp if msi14va==.
	replace msi14va=msi12va_tmp if msi14va==.
gen msi15va=msi15va_tmp
	replace msi15va=msi14va_tmp if msi15va==.
	replace msi15va=msi13va_tmp if msi15va==.
gen msi16va=msi16va_tmp
	replace msi16va=msi15va_tmp if msi16va==.
	replace msi16va=msi14va_tmp if msi16va==.
gen msi17va=msi17va_tmp
	replace msi17va=msi16va_tmp if msi17va==.
	replace msi17va=msi15va_tmp if msi17va==.
gen msi18va=msi18va_tmp
	replace msi18va=msi17va_tmp if msi18va==.
	replace msi18va=msi16va_tmp if msi18va==.
gen msi19va=msi19va_tmp
	replace msi19va=msi18va_tmp if msi19va==.
	replace msi19va=msi17va_tmp if msi19va==.
gen msi20va=msi20va_tmp
gen msi21va=msi21va_tmp

// ADD BLOCKS FOR ADDITIONAL YEARS WITH EACH ANNUAL UPDATE HERE

drop *tmp

save "$outputfilepath\\$outputfile", replace
