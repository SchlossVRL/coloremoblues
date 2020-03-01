* Encoding: UTF-8.

************************************************
*EXPERIMENT  1  
Data file: HSexp1 
************************************************
 *3-way repeated measures ANOVA comparing 2 hues x 2 lightness x 2 chroma 

GLM Lt_Lo_Y Lt_Lo_B Lt_Hi_Y Lt_Hi_B Dk_Lo_Y Dk_Lo_B Dk_Hi_Y Dk_Hi_B 
  /WSFACTOR=Lightness 2 Polynomial Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Lightness Chroma Hue Lightness*Chroma Lightness*Hue Chroma*Hue Lightness*Chroma*Hue.


 *2-way repeated measures ANOVA comparing 2 hues  x 2 chroma within the LIGHT colors
  
GLM Lt_Lo_Y Lt_Lo_B Lt_Hi_Y Lt_Hi_B 
  /WSFACTOR=Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Chroma Hue Chroma*Hue.


 *2-way repeated measures ANOVA comparing 2 hues  x 2 chroma within the DARK colors
  
GLM Dk_Lo_Y Dk_Lo_B Dk_Hi_Y Dk_Hi_B 
  /WSFACTOR=Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Chroma Hue Chroma*Hue.



************************************************
*EXPERIMENT  2  - REPLICATION DATASET
Data file: HSexp2
************************************************

*3-way repeated measures ANOVA comparing 2 hues x 2 lightness x 2 chroma 

GLM Rep_Lt_Lo_Y Rep_Lt_Lo_B Rep_Lt_Hi_Y Rep_Lt_Hi_B Rep_Dk_Lo_Y Rep_Dk_Lo_B Rep_Dk_Hi_Y Rep_Dk_Hi_B 
  /WSFACTOR=Lightness 2 Polynomial Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Lightness Chroma Hue Lightness*Chroma Lightness*Hue Chroma*Hue Lightness*Chroma*Hue.

 *2-way repeated measures ANOVA comparing 2 hues  x 2 chroma within the LIGHT colors
  
GLM Rep_Lt_Lo_Y Rep_Lt_Lo_B Rep_Lt_Hi_Y Rep_Lt_Hi_B 
  /WSFACTOR=Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Chroma Hue Chroma*Hue.

 *2-way repeated measures ANOVA comparing 2 hues  x 2 chroma within the DARK colors
  
GLM Rep_Dk_Lo_Y Rep_Dk_Lo_B Rep_Dk_Hi_Y Rep_Dk_Hi_B 
  /WSFACTOR=Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Chroma Hue Chroma*Hue.



************************************************
*EXPERIMENT  2  - MATCH DATASET
Data file: HSexp2
************************************************

*3-way repeated measures ANOVA comparing 2 hues x 2 lightness x 2 chroma 

GLM Match_Lt_20_Y Match_Lt_20_B Match_Lt_Mc_Y Match_Lt_Mc_B Match_Dk_20_Y Match_Dk_20_B 
    Match_Dk_Mc_Y Match_Dk_Mc_B 
  /WSFACTOR=Lightess 2 Polynomial Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Lightess Chroma Hue Lightess*Chroma Lightess*Hue Chroma*Hue Lightess*Chroma*Hue.


 *2-way repeated measures ANOVA comparing 2 hues  x 2 chroma within the LIGHT colors
GLM Match_Lt_20_Y Match_Lt_20_B Match_Lt_Mc_Y Match_Lt_Mc_B 
  /WSFACTOR=Chroma 2 Polynomial Hue 2 Polynomial 
  /METHOD=SSTYPE(3) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05) 
  /WSDESIGN=Chroma Hue Chroma*Hue.
