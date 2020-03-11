* Encoding: UTF-8.



**************************************************************************************
DATA FILE: Equilum_Regression.sav
**************************************************************************************


* EXPERIMENT 2------------------------------------

* Happy/sad model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HS1
  /METHOD=FORWARD L C a b



* Happy/sad model using only L,C,a,b, lightnes ratings, saturation ratings, red/green ratings, and yellow/blue ratings

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HS1
  /METHOD=FORWARD L C a b, LD1, Sat1, YB1, RG1



* Angry model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT A1
  /METHOD=FORWARD L C a b
  

* Saturation model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT Sat1
  /METHOD=FORWARD L C a b



* Lightness model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT LD1
  /METHOD=FORWARD L C a b



* Correlate YB ratings with b*
 
CORRELATIONS 
  /VARIABLES=YB1 b 
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.



* Correlate RG ratings with a*
 
CORRELATIONS 
  /VARIABLES=RG1 a 
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.


* Correlate LD ratings with Sat ratings
 
CORRELATIONS 
  /VARIABLES=LD1 Sat1 
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.



* REPLICATION DATASET-------------------------------------

* Happy/sad model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HSr
  /METHOD=FORWARD L C a b



* Happy/sad model using only L,C,a,b, lightnes ratings, saturation ratings, yellow/blue ratings, and red/green ratings

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HSr
  /METHOD=FORWARD L C a b, LDr, Satr, YBr, RGr


* Angry/not-angry model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT Ar
  /METHOD=FORWARD L C a b

* Lightness rating model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT LDr
  /METHOD=FORWARD L C a b
  
* Saturation rating model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT Satr
  /METHOD=FORWARD L C a b
  
  
