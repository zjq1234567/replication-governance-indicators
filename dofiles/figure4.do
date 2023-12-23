

clear all              // remove everything from the memory, refresh. 

cap log close         // close any open log file.

set more off          // show the result all at once.

set seed 2023


	
	use $raw_data/02_rule_of_law.dta,clear  
	keep if year == 2022 //仅用2022年的数据
	keep country overall gov_con abs_cor ope_gov rights order enf civ_jus cri_jus
	rename (gov_con abs_cor ope_gov rights order enf civ_jus cri_jus) ///
			(factor1 factor2 factor3 factor4 factor5 factor6 factor7 factor8)
	rename overall wjp

	*1000次随机权重
	forvalue i = 1/1000 {
		forvalue num=1/8 {
			gen w`num' = runiform()
		}
		egen t=rowtotal(w1 w2 w3 w4 w5 w6 w7 w8 )
		forvalue num=1/8 {
			replace w`num' = w`num'/t //计算权重
		}

		gen index = factor1*w1 + factor2*w2 + factor3*w3 + factor4*w4 + factor5*w5 ///
					+ factor6*w6 + factor7*w7 + factor8*w8  

		sort index 
		gen rank`i' = _n
		drop w1 w2 w3 w4 w5 w6 w7 w8 t index 
	}

	sort wjp 
	gen rank = _n //WJP原有指数的rank

	*计算1000组结果的中位数、均值和方差
	egen rank_mean = rowmean(rank1 - rank1000)
	egen rank_median = rowmedian(rank1 - rank1000)	
	egen rank_sd = rowsd(rank1 - rank1000)
	gen rank_up = rank_mean + 1.96*rank_sd
	gen rank_low = rank_mean - 1.96*rank_sd	

	*绘图
	twoway ///
	(function y = x, range(1 142))   ///
	(rspike rank_low rank_up rank, lc(pink*0.3) lp(solid)) ///
	(scatter rank_median rank, msize(vsmall) mcolor(red) msymbol(circle))   ///
	, xlabel(1(20)142) ylabel(1(20)142) scheme(cleanplots) ///
	legend(order(1 "模拟样本：排名中位数" 2 "95%置信区间上下限" 4 "45度线")) ///
	xtitle("法治指数国家排名",size(small)) ytitle("模拟样本国家排名",size(small))

	
	//|| line rank_up rank, lc(black*0.9) lp(dot)  ///
	//|| line rank_low rank , lc(black*0.9) lp(dot)  ///
	
	graph export $outputs/figure4.png, replace 





