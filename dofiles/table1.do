

**************************************************************
**********************Set Relative Path***********************
**************************************************************
	clear all              // remove everything from the memory, refresh. 

	cap log close         // close any open log file.

	set more off          // show the result all at once.



**************************************************************
***************Generate Data ***************
**************************************************************
	
	//Aggregate information
	import excel "raw_data/Index_Summary_20221229_adjusted.xlsx", sheet("aggregate") cellrange(A2:AI42) firstrow clear
	
	drop if IndexID==23 //23: the government report. It's not an index
	
	
	//abnormal values in  NumofCountriesCovered
	replace NumofCountriesCovered="200" if NumofCountriesCovered=="over 200"
	replace NumofCountriesCovered="210" if NumofCountriesCovered=="195+15"
	
	
	//cleaning variables with #NA
	foreach i of varlist NumofCountriesCovered IndexCitationNumberonGoogle NumberofPublishedReportsonG ArticleCitationNumber1 ArticleCitationNumber2 ArticleCitationNumber3 PublishYear1 PublishYear2 PublishYear3 {
	replace `i'="" if `i'=="#NA"
	destring `i',replace
	}
	
	//rename variables
	rename (RAName IndexID IndexName Publisher1 Publisher2 PublisherClassification1 PublisherClassification2 PublisherCountry1 PublisherCountry2 ISO3CodeoftheCountry1 ISO3CodeoftheCountry2 BeginningYear LatestYear NumofCountriesCovered BriefDescriptionbythePublish IndexCitationNumberonGoogle NumberofPublishedReportsonG DateofAccess CommentsandNotescompleteit Reference) ///
	(ra index_id index_name publisher1 publisher2 pub_class1 pub_class2 pub_country1 pub_country2 iso3_1 iso3_2 year_begin year_latest num_counteis desc citation_num report_num date_access comment reference)
	
	forv i=1/3 {
	rename (Article`i' Author`i' PublishYear`i' Journal`i' ArticleCitationNumber`i') ///
	(art_name`i' art_author`i' art_year`i' art_journal`i' art_citation`i')
	}
	
	
	 
	save $working_data/summary/aggregate.dta ,replace
	   
//subindex
	import excel "raw_data/Index_Summary_20221229_adjusted.xlsx", sheet("sub-index") cellrange(A3:AT239) firstrow clear
	drop if IndexID==.
	drop if IndexID==23 //23: the government report. It's not an index
	 

	 
	rename (IndexID IndexName SubindexID SubindexName VersionID UpdateComparedtoPreviousVers BeginningYearofThisVersion LatestYearofThisVersion AspectofGovernancekeywords AspectofGovernancedefinition WeightofThisSubindexinTotal ///
UseStatisticalData PrimaryStatisticalDatabaseNam PublisherofPrimaryStatistical SupplementaryStatisticalDataN HowtoFilltheMissingStatisti WeightofStatisticalDataifa ///
UsePublicSurveyData PrimarySurveyNameifany PublisherofthePrimarySurvey SupplementarySurveyNameifan HowtoFilltheMissingPublicS WeightofPublicSurveyDataif ///
UseExpertSurveyData TotalNumberofExpertsintheL ofPublisherEmployees ofScholars ofIndustrialExperts ofGovernmentOfficials ofOtherExperts IdentityofOtherExperts ofExpertsLivingintheCount ofExpertsnotLivingintheC WeightofExpertSurveyDataif ///
UseOtherCategoriesofData DataName Publisher WeightoftheData ///
ModelName1 BriefDescription1 ModelName2 BriefDescription2 ModelName3 BriefDescription3 CommentsandNotes Reference) ///
	(index_id index_name subindex_id subindex_name version_id update_info ver_year_begin ver_year_latest gov_keyword gov_def subindex_weight ///
	stat_any stat_prim_name stat_prim_publisher stat_sup_name stat_fill_miss stat_weight ///
	public_any public_prim_name public_prim_publisher public_sup_name public_fill_miss public_weight ///
	expert_any expert_num_total expert_prop_internal expert_prop_scholar expert_prop_industry expert_prop_gov expert_prop_other expert_identity_other expert_prop_live exbert_prop_visit expert_weight ///
	other_any other_name other_publisher other_weight ///
	model_name1 model_desc1 model_name2 model_desc2 model_name3 model_desc3 comments_subindex reference_subindex)

	
	//weight as geometric mean 
	replace subindex_weight="0.333333"  if subindex_weight==" geometric mean" //geometric mean: view as arithmetic mean
	
	//V-dem: we code factual data made by V-dem as "Other" type in raw data. Better to classify it into objective data
	replace stat_any = other_any if index_id ==10
	replace stat_prim_name = other_name  if index_id ==10
	replace stat_prim_publisher = other_publisher  if index_id==10
	replace stat_weight = other_weight if index_id ==10
	
	replace other_any = 0 if index_id ==10
	replace other_name = "#NA" if index_id ==10
	replace other_publisher = "#NA" if index_id ==10
	replace other_weight = "#NA" if index_id ==10
	

	//deal with #NA
	foreach i of varlist ver_year_begin subindex_weight stat_weight public_weight expert_any expert_num_total expert_prop_internal expert_prop_scholar expert_prop_industry expert_prop_gov expert_prop_other expert_prop_live exbert_prop_visit expert_weight other_weight {
	replace `i'= "" if `i'=="#NA"
	replace `i'= "" if `i'=="Simple Average"
	ge no_disc_`i'=(`i'=="Missing"|`i'=="missing")
	replace `i'= "" if `i'=="Missing"|`i'=="missing"
	destring `i',replace
	}	
	
	
	
	save $working_data/summary/subindex.dta ,replace
	
// merge	
	use $working_data/summary/aggregate.dta ,replace
	merge 1:m index_id using $working_data/summary/subindex.dta 
	keep if _merge==3 //dropped 20 Global Corruption Barometer, since it does not have subindex
	drop _merge
	sort index_id subindex_id version_id
	order index_id subindex_id version_id index_name subindex_name ver_year_begin ver_year_latest update_info
	
	codebook index_id //total: 36/38 indices.  20: no subindex; 23: not an index
	
	label define pub 1 "Governments" 2 "International Organizations" 3 "Universities" 4 "Non-profit Organizations" 5 "Private Firms"
	label value pub_class1 pub
	label value pub_class2 pub
	
	save $working_data/summary/summary.dta ,replace
	
**************************************************************
***************Analysis ***************
**************************************************************	
	use $working_data/summary/summary.dta ,replace
	keep if version_id==1 //keep the latest version
	
	//dealing with missing subindex_weight: treat as arithmetic mean
	by index_id, sort: egen count=count(index_id)
	replace subindex_weight=1/count if subindex_weight==.
	
	foreach i of varlist stat_weight public_weight expert_weight other_weight {
	ge w_`i'=`i'*subindex_weight
	by index_id, sort: egen aggr_`i'=sum(w_`i')
	}
	
	
	
	//export weight table
	preserve
	keep index_id index_name ra  aggr_stat_weight aggr_public_weight aggr_expert_weight aggr_other_weight
	duplicates drop 
	drop if aggr_stat_weight+aggr_public_weight+aggr_expert_weight+aggr_other_weight==0
	keep index_name aggr_stat_weight aggr_expert_weight  aggr_public_weight  aggr_other_weight
	order index_name aggr_stat_weight aggr_expert_weight  aggr_public_weight  aggr_other_weight
	rename (index_name aggr_stat_weight aggr_expert_weight  aggr_public_weight  aggr_other_weight) ///
	(指数名称 事实数据 专家评价 居民问卷 现有数据)
	
	format 事实数据 专家评价 居民问卷 现有数据 %9.2f
	
	set obs 22
	replace 指数名称 = "平均值" in 22
	
	foreach i of varlist 事实数据 专家评价 居民问卷 现有数据 {
	egen m_`i'=mean(`i')
	replace `i' = m_`i' in 22
	}
	
	drop m_*
	
	export excel "$outputs/table1.xlsx", sheet("Sheet1") firstrow(variable) replace 
	restore

	