/******************************************************************************/
// Master file for loading individual indicators data from Excel files for each source
// Version:  August 2022
/******************************************************************************/
// This is a master program that calls individual .do files for each individual
// data source. 
// Called from:  wgicode1.do 
// Input:	Excel data files, one for each WGI data source, XXX.xlsx where XXX is 
//				three-letter source code
// Output:	sourcedata.dta containing individual indicators from each data source
//				as used to estimate the aggregate WGI indicators
// Codes called:
//			XXX_merge.do where XXX is three-letter source code
// Note that all input data Excel files are stored in $filepath\sourcedata and
// all source merge do files are stored in $filepath\sourcedofiles
// Note:  takes approximately 5 minutes to run through all data sources
/******************************************************************************/

/******************************************************************************/
// 1. Preliminaries
/******************************************************************************/
clear
set more off
// Set input and output filepaths for the source data
global inputfilepath "$filepath\sourcedata"
global outputfilepath "$filepath\sourcedata"

// Set input and output file names for each source
// `src'_inputfile identifies the Excel file containing the input data from each source `src'
// `src'_outputfile identifies the .dta file containing the data from each source `src' 
foreach src in $sourcelist{
	global `src'_inputfile "`src'.xlsx"
	global `src'_outputfile "`src'data"
	}

/******************************************************************************/
// 2. Run merge files for each source
/******************************************************************************/
clear
foreach src in $sourcelist{
	do "$filepath//sourcedofiles//`src'_merge.do"
	}

/******************************************************************************/
// 3. Merge sources in `sourcelist' into single statadataset and
// erase individual source .dta files to clean up directory
/******************************************************************************/
clear
set obs 250
egen cid=seq()
foreach src in $sourcelist{
	merge 1:1 cid using "$inputfilepath\\`src'data"
	list cid code _merge if _merge~=3
	drop _merge
	erase "$inputfilepath\\`src'data.dta"
	}

/***************************************************************************/
// 4. Identify data sources as representative/non-representative 
// Append "1" to end of variable name if representative, "2" if nonrepresentative 
// This affects how the data sources are treated in the aggregation process
// UCM can be estimated "out of the box" to the representative data sources
// Reason is that if data sources cover broad cross-section of countries it is 
// plausible to impose the choice of units that unobserved governance has a unit
// normal distribution in each of the data sources.  This assumption is not plausible
// for non-representative data sources that cover geographically or income-limited 
// sets of countries.  See WGI methodology paper for further details of how
// estimation works for these two sets of data sources.  Note that a representative 
// data source can be treated as either representative or non-representative in
// the aggregation methodology -- in both cases the methodology should deliver
// consistent parameter estimates.  However this is not true for non-representative
// data sources which must be treated as such in the aggregation methodology 
/***************************************************************************/
// Data sources with broad country coverage that can be considered as representative in the aggregation methodology
foreach src in eiu frh gcs gwp her hum ijt ipd prs rsf tpr vdm wmo{
	foreach per in $periodlist{
		foreach ind in va pv ge rq rl cc{
			cap rename `src'`per'`ind' `src'`per'`ind'1
		}
	}
}

// Data sources with coverage restricted by region or income level are considered nonrepresentative in the aggregation methodology 
foreach src in adb afr asd bps bti ccr ebr eqi gcb gii hrm ifd irp lbo msi obi pia prc vab wcy wjp {  
	foreach per in $periodlist{
		foreach ind in va pv ge rq rl cc{
			cap rename `src'`per'`ind' `src'`per'`ind'2
		}
	}
}

*由于source data在年度之间的调整，单个data source 也可能从nonrepre→repre
// Override to set humXXva and vdmXXva as non-rep for all years (otherwise UCM overloads almost entirely onto FRH in early years 1996-2005) 
// Note that these sources could also be considered as representative post-2005.  Aggregation methodology should generate consistent estimates
// of the parameters for these sources whether they are treated as representative or not
foreach per in $periodlist{
	cap rename hum`per'va1 hum`per'va2
	cap rename vdm`per'va1 vdm`per'va2
}
// Override to set frhXXcc and frhXXrl as non-rep (they come from regional FRH reports and are not globally representative)
foreach per in $periodlist{
	cap rename frh`per'rl1 frh`per'rl2
	cap rename frh`per'cc1 frh`per'cc2
}
// Override to set gcsXXYY as non-rep for 1996-2002 (smaller country coverage in earlier years)
foreach per in 96 98 00 02{
	foreach var in va pv ge rq rl cc{
		cap rename gcs`per'`var'1 gcs`per'`var'2
	}
}


/***************************************************************************/
// 5. Save file containing all the source data to the root filepath
/***************************************************************************/
order cid code countryname, first
save $working_data/sourcedata, replace

/***************************************************************************/
// End of Code
/***************************************************************************/




