

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.



	*中国逐年变化情况
	use $raw_data/02_rule_of_law.dta,clear  

	keep if country == "China"

	twoway scatter  overall year, connect(l) ///
	ylabel(0(0.2)1) xlabel(2010(5)2022) scheme(cleanplots) ///
	xtitle("年份", size(small)) ytitle("法治指数", size(small))

	graph export $outputs/figure9b.png, replace

	//注：WJP里，2017-2018两年只出了一版指标，2012-2013两年只出了一版指标
