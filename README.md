## Blue Hues Don't Bring the Blues: questioning conventional notions of color-emotion associations
Karen B. Schloss, Christoph Witzel, Leslie Y. Lai

This project investigated yellow hues were happier than blue hues when lightness and chroma were controlled, either statistically or colorimetrically. Most of the code for organizing and plotting the data is run through `COLOR_EMO_MAIN.M`.

--- 

We controlled for lightness and chroma **statistically** using a dataset on the Berkeley Color Project 37 (BCP-37) colors, previously published in Palmer, et al. (2013). Color notation for the Berkeley Color Project 37 (BCP-37) includes two letters. For the 32 chromatic colors, the first letter is the saturation/lightness level (S[aturated], L[ight], M[uted], or D[ark]) and the 2nd letter is the hue (R[ed], O[range], Y[ellow], [c]H[artreuse], G[reen], C[yan], B[lue], and P[urple]). E.g., Saturated Yellow is "SY." For the 5 achromatic colors, BK = Black, A1 = dark gray, A2 = medium gray, A3 = light gray, and WH = white. We used the following data files and code for this part of the paper:
            
`T_BCP.csv`: Mean color-emotion associaitons and color coordinates for the Berkeley Color Project 37 (BCP-37) colors

`T_BCPEmoSubj.csv`: Color-emotion association ratings (Happy/sad and Angry) for the BCP-37 colors for each subject

`BCPcoloremo.m`: MATLAB code used to analysze and plot the color-emotion association data for the BCP-37 colors

`PlotBCP.m`: Function used to plot data in `BCPcoloremo.m` 

`computeCohen_d.m`: Function for calculating d (effect size)  (Bettinardi, 2020)

`BCPColorEmo_Regression.sav`: SPSS data for forward-stepping multiple linear regression (same data as `T_BCP.csv`)

`BCPcolorEmo_Regression.sps`: SPSS syntax used for forward-stepping multiple linear regression 

--- 

We controlled for lightness and chroma **colorimetrically** using colors a set of colors that were based on the BCP-37 colors, but held lightness and chroma constant within each color set. To do so, it was necessary to use colors that were far less saturated than in the BCP-37. The 32 colors include 8 hues (R, O, Y, H, G, C, B, P) x 2 lightness levels (lt, dk) x 2 chroma levels (lo, hi).

`DefineColors.m`: MATLAB code that defines the colors for Experiment 1 and Experiment 2,  based on the BCP-37 colors.

`colorconvert.m`: MATLAB code for translating between color spaces (https://github.com/LaurentLessard/colorconvert)

`T_Exp1+2Clrs.csv`: CIExyY, CIELAB, and CIELch (in CIELAB space) coordinates for the 32 colors in Experiment 1 and Experiment 2B-replicaiton. 

We also had particpants perceptually match the sautration of colors acorss different hues within each lightness level. Colors were matched relative to C* = 20. 

`T_Exp2MatchColors.csv`: CIExyY, CIELAB, and CIELch (in CIELAB space) coordinates for the 32 colors in Expeirment 2B-match when colors were equal chroma ('equal', C* = 20) or perceptually matched ('match'). 

Data from Experiment 1 and 2B are stored in the following files:

`EquilumData.mat`: raw data from Experiment 1 and Experiment 2B (see comments in `COLOR_EMO_MAIN.M` for details)

`T_Exp1Data.csv`: Color-emotion association ratings (Happy/Sad, Angry/not-angry) and color appearance ratings (Sat, LD, YB, RG) from Experiment 1 in long format (used in R analyses). These data have been averaged over color repetitions within-subject and scaled to ragne from -100 to +100, but are otherwise raw data. File also includes corresponding CIE L*, a*, b*, and C* coordinates. 

`T_Exp2Data.csv`: Color-emotion association ratings (Happy/Sad, Angry/not-angry) and color appearance ratings (Sat, LD, YB, RG) from Experiment 2B in long format (used in R analyses). Underscore r ('_ r') means replication dataset (colors from Experiment 1 and underscore m ('_ m') means match dataset (colors of C* = 20 or colors that were matched around C* = 20). 

`T_Exp1+2avgs.csv` and `ColorEmoExp1+2_Regression.sav`: Mean color-emotion assocaiton ratings and color-appearance raitngs used in for forward-stepping multiple linear regression in SPSS (same data in both files).






### References
Palmer, S. E., Schloss, K. B., Xu, Z., & Prado-León, L. R. (2013). Music–color associations are mediated by emotion. _Proceedings of the National Academy of Sciences_, _110_, 8836-8841. (https://www.pnas.org/content/110/22/8836.short)

Ruggero G. Bettinardi (2020). computeCohen_d(x1, x2, varargin) (https://www.mathworks.com/matlabcentral/fileexchange/62957-computecohen_d-x1-x2-varargin), MATLAB Central File Exchange. Retrieved February 26, 2020.

