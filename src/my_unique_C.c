#include <stdlib.h>
#include <stdio.h>
#include <R.h>
#include <Rinternals.h>


// SUBFUNCTIONS
inline int in_compare(double *matrix, int row1, int row2, int I1, int J1){

int equal = 1;
double value1;
double value2;

for (long int i = 0; i < J1; i++){
   value1 = matrix[row1 + I1*i];
   value2 = matrix[row2 + I1*i];
   if(value1!=value2){
     equal = 0;
     break;
   }
}
return(equal);

} // End of function in_compare


SEXP my_unique_C(SEXP RinMatrix){

SEXP duplicated = R_NilValue;

int I;
int J;
SEXP Rdim;
SEXP Rvalue;

Rdim = getAttrib(RinMatrix, R_DimSymbol);
I    = INTEGER(Rdim)[0]; // Reihen 
J    = INTEGER(Rdim)[1]; // Spalten

Rvalue           = coerceVector(RinMatrix, REALSXP);
double *Rval     = REAL(Rvalue);

PROTECT(duplicated = allocVector(INTSXP,I));

// Init duplicated
for(int i=0; i< I; i++){
   INTEGER(duplicated)[i]=0; 
}

int isdupli=1;
double value1;
double value2;

for (int i = 0; i < I-1; i++){
 for (int j = i+1; j < I; j++){
 
   if(INTEGER(duplicated)[j]==0){ 
     //isdupli = in_compare(Rval, i, j, I, J);
 	INTEGER(duplicated)[j] = 1;
	for (int k = 0; k < J; k++){
   		value1 = Rval[i + I*k];
   		value2 = Rval[j + I*k];
   		if(value1!=value2){
     		INTEGER(duplicated)[j] = 0;
     		break;
 	  	}
        }
 
   }

 }
}

UNPROTECT(1);
return(duplicated);

}





