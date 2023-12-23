/***************************************************************************/
// Program to estimate UCM for nonrepresentative sources 
// Called from:  	estimate1.do 
// Input data: 		nonrepdata -- contains representative sources for selected year and aggregate indicator 
// Ouput data: 		alldata -- contains all data sources for selected year and aggregate indicator,  
// 						together with parameter estimates (alpha, beta, sigma) for each data source, stored as column vector in dataset 
// Codes called:	None
/***************************************************************************/

clear
set more off

/* Start estimating nonrep sources */
clear
use nonrepdata

// save global $varnames containing list of WGI variable names 
qui describe, varlist
global varnames=r(varlist) 
scalar k=r(k) /* save scalar with number of variables */
scalar n=r(N) /* save number of observations */
egen cid=seq() /* numeric country identifier */

// merge in results from representative sources
merge 1:1 cid using repdata
drop _merge

// obtain parameters of non-representative sources by regressing data on estimate based on representative sources
foreach var of varlist $varnames{
	// regress source on estimate of governance from representative sources
	qui reg `var' estgovrep
	gen `var'beta=_b[estgovrep]
	// construct variance ratio to adjust slope coefficient for measurement error
	su estgovrep if `var'~=.
	gen vghat=r(Var) // variance of estimate of governance
	gen xx=sdgovrep^2 // variance of error term
	su xx if `var'~=.
	gen vuhat=r(mean)  // average variance of error term
	gen vratio=(vghat-vuhat)/vghat // adjustment ratio
	replace vratio=1 if vratio<0  // occasionally this variance ratio is negative, in this case turn off adjustment 
	replace `var'beta=`var'beta/vratio
	drop vghat xx vuhat vratio
	// retrieve alpha and sigma
	gen xx=`var'-`var'beta*estgovrep
	su xx if `var'~=.
	gen `var'alpha=r(mean)
	gen `var'sigma=r(sd)/`var'beta
	drop xx
}

save alldata, replace

// Keep temporary version of dataset containing only the source variables
// Do this to be able to generate global `varnames' containing names of all sources
keep *1 *2
save allsources, replace


// Generate estimates of governance combining representative and nonrepresentative sources
clear
use allsources
qui describe, varlist
global varnames=r(varlist) 
scalar k=r(k) /* save scalar with number of variables */
scalar n=r(N) /* save number of observations */
egen cid=seq() /* numeric country identifier */
keep cid
merge 1:1 cid using alldata
drop _merge
erase allsources.dta

/* Construct estimates of governance given parameters and data */
gen estgov=0 /* Estimate of governance */
gen sdgov=0 /* Standard error of estimate of governance */
foreach var of varlist $varnames{
	replace estgov=estgov+(`var'sigma^(-2))*(`var'-`var'alpha)/`var'beta if `var'~=.
	replace sdgov=sdgov+`var'sigma^(-2) if `var'~=.
	}
egen nsrc=rownonmiss($varnames)
replace estgov=. if nsrc==0
replace sdgov=. if nsrc==0
replace nsrc=. if nsrc==0
replace estgov=estgov/(1+sdgov)
replace sdgov=1/sqrt(1+sdgov)

save alldata, replace
