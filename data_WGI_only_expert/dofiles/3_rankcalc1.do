/***************************************************************************/
// Utility to calculate percentile ranks of estimates and upper and lower bounds of 90% confidence intervals 
// Called from:		estimate1.do
// Input data:		no input data file, uses data in memory passed from stata to mata
// Output data:		no output data file, passes matrix of results from mata back to stata
// Codes called:	none 
/***************************************************************************/

mata:
// retrieve variables in mata that were passed from stata
x=st_matrix("x")  
x1=x[.,1]
x2=x[.,2]
x3=x[.,3]
		
// percentile rank of x1
x1r=(x1:>=(J(rows(x1),1,1) # (x1')))* J(rows(x1),1,1) 
x1r=x1r:*(x1:~=.)-999*(x1:==.)
x1r=editvalue(x1r,-999,.)
x1rmax=colmax(x1r) 
x1r=100*(x1r:-1):/(x1rmax-1) 
		
// percentile rank of each element of x2 in x1
x2r=(x2:>=(J(rows(x1),1,1) # (x1')))* J(rows(x1),1,1)
x2r=x2r:*(x1:~=.)-999*(x1:==.)
x2r=editvalue(x2r,-999,.)
x2r=100*(x2r:-1):/(x1rmax-1)
x2r=x2r:*(x2r:>=0)+0*(x2r:<0)

// percentile rank of each element of x3 in x1
x3r=(x3:>=(J(rows(x1),1,1) # (x1')))* J(rows(x1),1,1)
x3r=x3r:*(x1:~=.)
x3r=x3r:*(x1:~=.)-999*(x1:==.)
x3r=editvalue(x3r,-999,.)
x3r=100*(x3r:-1):/(x1rmax-1)


// pass matrix of results back to stata
st_matrix("xr", (x1r,x2r,x3r))
		
	
end
		

