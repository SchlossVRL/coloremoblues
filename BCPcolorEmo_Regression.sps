* Encoding: UTF-8.
*ANALYSIS OF PALMER ET AL. (2013) COLR-EMOTION ASSOCIATIONS

* HAPPY/SAD
* forward-stepping regression on mean ratings
* data file: BCPColorEmo_Regression.sav 

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT HS 
  /METHOD=FORWARD L a b C




* ANGRY
* forward-stepping regression on mean ratings
* data file: BCPColorEmo_Regression.sav 

REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT Angry
  /METHOD=FORWARD L a b c.

