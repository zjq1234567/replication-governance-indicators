/***************************************************************************/
// Program to Estimate Worldwide Governance Indicators (WGI) 
// Version:  August 2022 
/***************************************************************************/
// This is a master program that calls several individual programs to do
// the estimation of the WGI given the source data from the individual
// indicators.  The overall structure of the programs called by this 
// program is as follows:
// importmerge1.do -- imports the individual indicators data from the the source-specific Excel files.  This program calls a separate
//					.do file for each data source and executes it to retrieve the data from each year tab of the corresponding source-specific
//					Excel file.  These are then merged into a combined dataset with the individual indicators for each data source called
//					sourcedata.dta
// estimate1.do -- loops over all the aggregate indicators and time periods.
//					For each indicator-year, it retrieves the corresponding data from sourcedata.dta
//					estimates the Unobserved Components Model (UCM) for representative sources, and generates the
//					corresponding aggregate indicator using data for the non-representative
//					sources as well.  After completing this loop, it also calculates the 
//					percentile ranks of the indicators and upper and lower bounds of 90%
//					confidence intervals. This program calls three sub-programs to do 
//					these three tasks:
//						ucmcode1.do (estimates Unobserved Components Model (UCM))
//							Note: requires as input an Excel file with the master list of country names and codes (countrycodes.xlsx)
//						nonrepcode1.do (incorporates nonrepresentative sources)
//						rankcalc1.do (compute percentile ranks)
//					Nothing in these four programs needs to be changed from year to year
// This is followed by a couple of utilities to prepare the data for loading into Tableau
// and for the other downloadable files available on the website
// Key outputs are "sourcedata.dta" that stores all the individual indicators as loaded from the Excel files
// and "resultsdata.dta" which stores all the individual indicators, aggregate indicators, and parameter estimates
// Only items that require updating from year to year are in the "preliminaries" block below
// User should set global filepath below to location where replication package is downloaded
/***************************************************************************/

/***************************************************************************/
// 1. Preliminaries
/***************************************************************************/
clear
clear matrix
clear mata
set more off
set maxvar 20000
set matsize 5000

// Set filepath
global filepath "C:/~GovernanceIndex/一阶段/WGI_replication/analysis"   
cd "$filepath"

// Globally-defined list of data sources, aggregate indicators and time periods in current dataset 
global sourcelist "adb afr asd bps bti ccr ebr eiu eqi frh gcb gcs gii gwp her hum hrm ifd ijt ipd irp lbo msi obi pia prc prs rsf tpr vab vdm wcy wjp wmo"
global indicatorlist "va pv ge rq rl cc" 
global periodlist "96 98 00 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21" 
/***************************************************************************/


/***************************************************************************/
// 2.  Import and merge datasets from source-specific Excel files 
// Retrieves data from source-specific Excel files, one for each source
// using source-specific .do files.  Excel files containing data and source-
// specific .do files are in $filepath\sourcedata
// Generates output sourcedata.dta containing data from individual data sources
// used to estimate the six aggregate WGI indicators
/***************************************************************************/
run $dofiles/3_importmerge1.do //变量名以1结尾→ representative data; 2→ nonrepresentative data 


/***************************************************************************/
// ****2. Keep expert database or survey database 
/***************************************************************************/

***Only expert data
use $working_data/sourcedata, clear

keep adb* asd* bti* ccr* ebr* eiu* frh* gii* her* hrm* hum* ifd* ijt* ipd* irp* msi* obi* pia* prs* rsf* tpr* vdm* wjp* wmo*

global sourcelist "adb asd  bti ccr ebr eiu  frh   gii  her hum hrm ifd ijt ipd irp  msi obi pia  prs rsf tpr  vdm wjp wmo"

save $working_data/sourcedata, replace 
*Data Code:ADB, ASD, BTI, CCR, EBR, EIU, FRH, GII, HER, HRM, HUM, IFD, IJT, IPD, IRP, MSI, OBI, PIA, PRS, RSF, TPR, VDM, WJP, WMO


/***************************************************************************/
// 3. Call estimation code 
// Uses as input source data in sourcedata.dta
// Generates output resultsdata.dta containing all source data, 
// parameter estimates, and aggregate indicators
/***************************************************************************/
use $working_data/sourcedata.dta,clear 

run $dofiles/3_estimate1.do

/***************************************************************************/
// 3. Export the aggregate indicators, source data, and parameters in
// different formats used to populate the WGI website and documentation
/***************************************************************************/
// 3.1 Export estimated parameters to Excel
clear
use resultsdata
putexcel set params.xlsx, replace
qui tabstat *alpha, stats(mean) columns(stats) longstub save
putexcel A1=matrix(r(StatTotal)'), names
qui tabstat *beta, stats(mean) columns(stats) longstub save
putexcel C1=matrix(r(StatTotal)'), names
qui tabstat *sigma, stats(mean) columns(stats) longstub save
putexcel E1=matrix(r(StatTotal)'), names

// 3.2 Export aggregate indicators to Excel, single sheet, rectangular format for all 250 country codes (i.e. including codes for which there is no data)
clear
use resultsdata
keep cid va* pv* ge* rq* rl* cc*
cap drop vab*
drop *rep
drop ccr*cc* ccr*va* ccr*rl*
rename *, upper
describe
export excel using "$filepath\aggindstableau.xlsx", replace firstrow(var) missing("#N/A")

// 3.3 Export individual indicators to Excel, rectangular format for all 250 country codes (i.e. including codes for which there is no data)
clear
use $working_data/sourcedata.dta
rename *, upper // convert to uppercase
rename *1 * // remove 1 subscript indicating representative data sources
rename *2 * // remove 2 subscript indicating non-representative data sources
export excel using "$filepath\individualindstableau.xlsx", replace firstrow(var) missing("#N/A")

// 3.4 Create dataset for downloadable Excel and Stata versions of dataset -- only for countries with data, one tab per aggregate indicator
clear
use resultsdata
keep cid code countryname va* pv* ge* rq* rl* cc*
cap drop vab*
drop *rep
drop ccr*cc* ccr*va* ccr*rl*

// Determine set of countries with data for at least one of the aggregate indicators
gen smpl=0
foreach var of varlist va* pv* ge* rq* rl* cc*{
	qui replace smpl=smpl+1 if `var'~=.
	}
keep if smpl>0
su smpl, d

foreach ind in $indicatorlist{
	global `ind'varlist "countryname code"
	foreach per in $periodlist{
		global `ind'varlist "$`ind'varlist `ind'e`per' `ind's`per' `ind'n`per' `ind'r`per' `ind'l`per' `ind'u`per'"
	}
export excel $`ind'varlist using aggindsdownloadable.xlsx, sheet("`ind'") sheetreplace firstrow(var) missing("#N/A")
}

// 3.5 Create stacked format for stata dataset 
// convert period subscripts into years that can be recognized by stata
foreach per in $periodlist{
	if `per'==96{
		rename *`per' *1996
		}
	if `per'==98{
		rename *`per' *1998
		}
	if `per'~=96 & `per'~=98{
		rename *`per' *20`per'
		}
}
	
reshape long vae vas van var val vau pve pvs pvn pvr pvl pvu gee ges gen ger gel geu rqe rqs rqn rqr rql rqu rle rls rln rlr rll rlu cce ccs ccn ccr ccl ccu, i(code) j(year)
order code countryname vae vas van var val vau pve pvs pvn pvr pvl pvu gee ges gen ger gel geu rqe rqs rqn rqr rql rqu rle rls rln rlr rll rlu cce ccs ccn ccr ccl ccu
drop cid smpl

label variable vae "Voice and Accountability, Estimate"
label variable vas "Voice and Accountability, Standard Error"
label variable van "Voice and Accountability, Number of Sources"
label variable var "Voice and Accountability, Percentile Rank (0-100)"
label variable val "Voice and Accountability, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable vau "Voice and Accountability, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

label variable pve "Political Stability and Absence of Violence/Terrorism, Estimate"
label variable pvs "Political Stability and Absence of Violence/Terrorism, Standard Error"
label variable pvn "Political Stability and Absence of Violence/Terrorism, Number of Sources"
label variable pvr "Political Stability and Absence of Violence/Terrorism, Percentile Rank (0-100)"
label variable pvl "Political Stability and Absence of Violence/Terrorism, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable pvu "Political Stability and Absence of Violence/Terrorism, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

label variable gee "Government Effectiveness, Estimate"
label variable ges "Government Effectiveness, Standard Error"
label variable gen "Government Effectiveness, Number of Sources"
label variable ger "Government Effectiveness, Percentile Rank (0-100)"
label variable gel "Government Effectiveness, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable geu "Government Effectiveness, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

label variable rqe "Regulatory Quality, Estimate"
label variable rqs "Regulatory Quality, Standard Error"
label variable rqn "Regulatory Quality, Number of Sources"
label variable rqr "Regulatory Quality, Percentile Rank (0-100)"
label variable rql "Regulatory Quality, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable rqu "Regulatory Quality, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

label variable rle "Rule of Law, Estimate"
label variable rls "Rule of Law, Standard Error"
label variable rln "Rule of Law, Number of Sources"
label variable rlr "Rule of Law, Percentile Rank (0-100)"
label variable rll "Rule of Law, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable rlu "Rule of Law, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

label variable cce "Control of Corruption, Estimate"
label variable ccs "Control of Corruption, Standard Error"
label variable ccn "Control of Corruption, Number of Sources"
label variable ccr "Control of Corruption, Percentile Rank (0-100)"
label variable ccl "Control of Corruption, Percentile Rank of Lower Bound of 90% Confidence Interval (0-100)"
label variable ccu "Control of Corruption, Percentile Rank of Upper Bound of 90% Confidence Interval (0-100)"

order year, after(countryname)
save $working_data/wgidataset_expert.dta, replace



/***************************************************************************/
// End of Code
/***************************************************************************/








