## Blue Hues Don't Bring the Blues: questioning conventional notions of color-emotion associations
Karen B. Schloss, Christoph Witzel, Leslie Y. Lai

This project investigated yellow hues were happier than blue hues when lightness and chroma were controlled, either statistically or colorimetrically. 

We controlled for lightness and chroma **statistically** using a dataset on the Berkeley Color Project 37 (BCP-37) colors, previously published in Palmer, et al. (2013). Color notation for the Berkeley Color Project 37 (BCP-37) includes two letters. For the 32 chromatic colors, the first letter is the saturation/lightness level (S[aturated], L[ight], M[uted], or D[ark]) and the 2nd letter is the hue (R[ed], O[range], Y[ellow], [c]H[artreuse], G[reen], C[yan], B[lue], and P[urple]). E.g., Saturated Yellow is "SY." For the 5 achromatic colors, BK = Black, A1 = dark gray, A2 = medium gray, A3 = light gray, and WH = white. We used the following data files and code for this part of the paper:
 
We controlled for lightness and chroma **colorimetrically** using colors a set of colors that were based on the BCP-37 colors, but held lightness and chroma constant within each color set. To do so, it was necessary to use colors that were far less saturated than in the BCP-37. The 32 colors include 8 hues (R, O, Y, H, G, C, B, P) x 2 lightness levels (lt, dk) x 2 chroma levels (lo, hi). 

 ---

`T_BCP.csv`: Mean color-emotion associaitons and color coordinates for the Berkeley Color Project 37 (BCP-37) colors

`T_EquilumColors.csv`: CIExyY, CIELAB, and CIELch (in CIELAB space) coordinates for the 32 colors in Experiment 2 and the supplementary experiment (replication) in the Appendix. 

`T_MatchColors.csv`: CIExyY, CIELAB, and CIELch (in CIELAB space) coordinates for the 32 colors in the supplementary experiment (match) in the Appendix. 

 
 ---
 In folder `MatlabR`
 
`COLOR_EMO_MAIN.M`: runs code for defining colors, organizing and plotting data, and performing some analyses.

`T_BCPEmoSubj`: Color-emotion association ratings (Happy/Sad (HS), Angry (A)) for each participant from Palmer et al. (2013) in wide format.

`T_EquilumData.csv`: Color-emotion association ratings (Happy/Sad, Angry/not-angry) and color appearance ratings (Sat, LD, YB, RG) from Experiment 2 in long format (used in R analyses). These data have been averaged over color repetitions within-subject and scaled to ragne from -100 to +100, but are otherwise raw data. File also includes corresponding CIE L*, a*, b*, and C* coordinates. 

`T_Equilum2Data.csv`: Color-emotion association ratings (Happy/Sad, Angry/not-angry) and color appearance ratings (Sat, LD, YB, RG) from the supplementary experiment in the Appendix (replication and match datasets), in long format (used in R analyses). Underscore r ('_ r') means replication dataset (colors from Experiment 21 and underscore m ('_ m') means match dataset (colors of C* = 20 or colors that were matched around C* = 20). 

`T_EquilumRegressions.csv`: Mean color-emotion assocaiton ratings and color-appearance raitngs 

`T_EquilumHS.csv`: Happy/sad ratings for each participant in Experiment 2, in wide format.

`T_Equilum2HS.csv`: Happy/sad ratings for each participant in the supplementary experiment (Appendix), in wide format.

`EquilumAnalyze.R`: R script that runs linear mixed effects models in Experiment 2 and the supplementary experiment in the Appendix. 

--- 
 In folder `SPSS`
 
`BCP_Regression.sps`: runs forward-stepping multiple linear regressions (MLR) from Experiment 1
 
`Equilum_Regression.sps`: runs forward-stepping MLR from Experiment 2 and the supplementary experiment in the Appendix
 
`EquilumHS_YB_ANOVA.sps`: runs ANOVAs comparing happy/sad ratings for colors of yellow hue and blue hue in Experiment 2 and the supplementary experiment in the Appendix=

`BCP_Regression.sav`: same as `T_BCP.csv`, excluding the CIExyY coordinates.
 
`EquilumRegression.sav`: same as `T_EquilumRegression.csv`.
  
`EquilumHS.sav`: same as `T_EquilumHS.csv`.
  
`Equilum2HS.sav`: same as `T_Equilum2HS.csv`.
   
---

### Reference
Palmer, S. E., Schloss, K. B., Xu, Z., & Prado-León, L. R. (2013). Music–color associations are mediated by emotion. _Proceedings of the National Academy of Sciences_, _110_, 8836-8841. (https://www.pnas.org/content/110/22/8836.short)
