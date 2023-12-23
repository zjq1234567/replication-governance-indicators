/***************************************************************************/
// Program to estimate aggregate WGI indicators 
/***************************************************************************/
// Called from:  wgicode.do 
// Input: 	sourcedata.dta, containing all the individual indicators, created by "importmerge1.do"
//			countrycodes.xlsx
// Ouput: 	resultsdata.dta containing:
// 				data from all individual sources, as contained in sourcedata.dta
//				estimated parameters (as column vectors) for each source, format is sourcenameXX, XX=alpha,beta,sigma,load
//				estimated aggregate indicators based on representative sources, e.g. vae12rep
//				estimated aggregate indicators based on all sources, e.g. vae12, vas12, van12, var12 val12 vau12 
// Codes called:
//			ucmcode1.do -- estimates unobserved components model using representative data
//			nonrepcode1.do -- estimates parameters for non-representative sources and constructs overall aggregate indicators
//			rankcalc1.do -- mata program that calculates percentile ranks of estimates and upper/lower bounds of confidence intervals
/***************************************************************************/

/***************************************************************************/
// 1. Preliminaries
/***************************************************************************/
set more off
// Create master dataset to store results
// Stores all the source data, estimated parameters for each source, and aggregate indicators
clear
set obs 250
egen cid=seq()
save resultsdata, replace
clear

/***************************************************************************/
// 2. Loop over all time periods and aggregate indicators
// For each time period and aggregate indicator, call two codes that:
// (a) estimate the UCM using data for representative sources
// (b) estimates the parameters for non-representative sources and constructs overall aggregate indicators
// Note that for some indicator-year pairs, there are no non-representative data sources -- conditional
// branch in block of code below handles this.
// For a complete technical description of the UCM model as used in the WGI, see Section 3 of:
// Kaufmann, Daniel, Aart Kraay and Pablo Zoido-Lobaton (1999).  "Aggregating Governance Indicators".  
// World Bank Policy Research Working Paper No. 2195
// https://documents1.worldbank.org/curated/en/167911468766840406/pdf/multi-page.pdf
/***************************************************************************/
foreach per in $periodlist{
	foreach ind in $indicatorlist{
		// Call UCM for representative sources
		clear
		use $working_data/sourcedata.dta
		keep *`per'`ind'1
		save repdata, replace
		run $dofiles/3_ucmcode1.do
		// Complete estimation using data from non-representative sources 
		// Note conditional branch, since some aggregate indicators do not have nonrep sources
		clear
		use $working_data/sourcedata.dta
		cap keep *`per'`ind'2
		// Branch if nonrepresentative sources are available
		if _rc==0{
			save nonrepdata, replace
			run $dofiles/3_nonrepcode1.do
			// Rename generic estimates
			rename estgovrep `ind'e`per'rep
			rename sdgovrep `ind's`per'rep
			rename nsrcrep `ind'n`per'rep
			rename estgov `ind'e`per'
			rename sdgov `ind's`per'
			rename nsrc `ind'n`per'
			save alldata, replace
		}
		// Branch if no non-representative sources are available
		if _rc==111{
			clear
			use repdata
			rename estgovrep `ind'e`per'rep
			rename sdgovrep `ind's`per'rep
			rename nsrcrep `ind'n`per'rep
			gen `ind'e`per'=`ind'e`per'rep
			gen `ind's`per'=`ind's`per'rep
			gen `ind'n`per'=`ind'n`per'rep
			save alldata, replace
		}
		// Append results to master dataset
		clear
		use resultsdata
		merge 1:1 cid using alldata
		drop _merge
		save resultsdata, replace
	}
}

/***************************************************************************/
// 3. Standardize aggregate indicators for each period
// For estimates: subtract mean, divide by standard deviation
// For standard errors: divide by standard deviation of estimate
/***************************************************************************/
foreach ind in $indicatorlist{
	foreach per in $periodlist{
		qui su `ind'e`per'
		qui replace `ind'e`per'=(`ind'e`per'-r(mean))/r(sd)
		qui replace `ind's`per'=(`ind's`per')/r(sd)
	}
}
save resultsdata, replace

/***************************************************************************/
// 4. Compute percentile ranks of estimates and upper and lower bounds of 90% confidence interval
/***************************************************************************/
foreach ind in $indicatorlist{
	foreach per in $periodlist{
		// Construct matrix x containing estimate of governance, and lower and upper bounds of 90% confidence interval
		qui gen x1=`ind'e`per'
		qui gen x2=`ind'e`per'-1.64*`ind's`per'
		qui gen x3=`ind'e`per'+1.64*`ind's`per'
		mkmat x1 x2 x3, matrix(x)
		qui drop x1-x3
		
		run $dofiles/3_rankcalc1.do
		
		// unpack matrix into into WGI-named variables
		svmat xr
		qui gen `ind'r`per'=xr1
		qui gen `ind'l`per'=xr2 
		qui gen `ind'u`per'=xr3
		qui drop xr1-xr3
	}
}

save resultsdata, replace

/***************************************************************************/
// 5. Merge in country codes and country names, finalize dataset, clean up directory
/***************************************************************************/
clear
import excel  "$filepath\countrycodes.xlsx", firstrow sheet("Sheet1")
save countrycodes, replace
clear
use resultsdata
merge 1:1 cid using countrycodes
drop _merge
save resultsdata, replace
erase countrycodes.dta

// Erase unneeded .dta files created in this code
erase repdata.dta
erase nonrepdata.dta
erase alldata.dta

/***************************************************************************/
// End of Code
/***************************************************************************/
