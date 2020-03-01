* Encoding: UTF-8.



**************************************************************************************
DATA FILE: ColorEmoExp1+2_Regression.sav
**************************************************************************************


* EXPERIMENT 1------------------------------------

* Happy/sad model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HS1
  /METHOD=FORWARD L C a b



* Happy/sad model using only L,C,a,b, lightnes ratings, saturation ratings

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HS1
  /METHOD=FORWARD L C a b, LD1, Sat1



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



* EXPERIMENT 2-------------------------------------

* Happy/sad model using only L,C,a,b

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HSr
  /METHOD=FORWARD L C a b



* Happy/sad model using only L,C,a,b, lightnes ratings, saturation ratings

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HSr
  /METHOD=FORWARD L C a b, LDr, Satr


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
  
  
