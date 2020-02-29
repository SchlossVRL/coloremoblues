## Blue Hues Don't Bring the Blues: questioning conventional notions of color-emotion associations
Karen B. Schloss, Christoph Witzel, Leslie Y. Lai

This project investigated yellow hues were happier than blue hues when lightness and chroma were contolled, either statistically or colorimetrically. 

We controlled for lightness and chroma **statiscally** using a dataset on the Berkeley Color Project 37 (BCP-37) colors, previously published in Palmer, et al. (2013). Color notation for the Berkeley Color Project 37 (BCP-37) includes two letters. For the 32 chromatic colors, the first letter is the saturation/lightness level (S[aturated], L[ight], M[uted], or D[ark]) and the 2nd letter is the hue (R[ed], O[range], Y[ellow], [c]H[artreuse], G[reen], C[yan], B[lue], and P[urple]). E.g., Saturated Yellow is "SY." For the 5 achroamtic colors, BK = Black, A1 = dark gray, A2 = medium gray, A3 = light gray, and WH = white.
            
`T_BCP.csv`: Mean color-emotion associaitons and color coordinates for the Berkeley Color Project 37 (BCP-37) colors

`T_EmoSubj.csv`: Color-emotion association ratings (Happy/sad and Angry) for the BCP-37 colors for each subject

`BCPcoloremo.m`: MATLAB code used to analysze and plot the color-emotion association data for the BCP-37 colors
	`PlotBCP.m`: Function used to plot data in `BCPcoloremo.m` 

	`computeCohen_d.m`: Function for calculating d (effect size)  (Bettinardi, 2020)

`BCPColorEmo_Regression.sav`: SPSS data file used for forward-stepping multiple linear regression (same data as `T_BCP.csv`)

`BCPcolorEmo_Regression.sps`: SPSS syntax file used for forward-stepping multiple linear regression 

### References
Palmer, S. E., Schloss, K. B., Xu, Z., & Prado-León, L. R. (2013). Music–color associations are mediated by emotion. _Proceedings of the National Academy of Sciences_, _110_, 8836-8841. (https://www.pnas.org/content/110/22/8836.short)

Ruggero G. Bettinardi (2020). computeCohen_d(x1, x2, varargin) (https://www.mathworks.com/matlabcentral/fileexchange/62957-computecohen_d-x1-x2-varargin), MATLAB Central File Exchange. Retrieved February 26, 2020.

