%MAIN file that runs all of the matlab code for this project
    %some of these scripts build on eachother, so they should be run in the
    %order provide below


BCPcoloremo  % Analyze and makes plots of data from Palmer et al. (2013)

DefineColors % Define color coordinates for colors used in Exps. 1 and 2

load EquilumData % Loads color-emotion assoication and color appearance data
    %EmoLoad and EmoLoad2 store color-emotion associations from both 
    %versions 1 and 2 (referred to exp 2 and supplementary study, respectively). 
        % Rows are condition (defined in EmoNames1 or EmoNames2 as:
            %emotion dimension, hue, lightness, chroma) 
        % Columns are repetitions of each condition
        % 3rd dimension is subjects
     %ColorApp and ColorApp2 store color appearance ratings from Exp 1 and 2, respectively. 
        % the structure is the same as discribed for EmoLoad, and the
        % conditions for Exp 1 and 2 are defiend in ColorAppNames1 and
        % ColorAppNames2, respectively.
     % See bottom of this file for futher detail about matrix structures
     
OrganizeData %Restructures data for csv files and plots
MakeFigures %Make color-emotion associations and color-appearance figures


%% Further description of matrix strucutre in EquilumData
% COLOR-EMOTION ASSOCATION RATINGS
% Rows 1-32: sad/happy (-/+)
% Rows 33-64: not-angry/angry (-/+)
% Within each emotion
    %colors in the 1st 16 rows are light
    %colors in the 2nd 16 rows are dark 
        %within each lightness level
            %colors in the 1st 8 rows are low chroma
            %colors in the 2nd 8 ros are high chroma
            	%within each chroma level hues are:
                    %R,O,Y,H,G,C,B,P        
 %Columns 1-2:replications of each condition
 
% COLOR-APPEARANCE RATINGS
% Rows 1-32: Destat/sat (-/+)
% Rows 33-64: dark/light (-/+)
% Rows 65-96: blue/yellow (-/+)
% Rows 97-128: green/red (-/+)
% Within each color appearance dimension
    %colors in the 1st 16 rows are light
    %colors in the 2nd 16 rows are dark 
        %within each lightness level
            %colors in the 1st 8 rows are low chroma
            %colors in the 2nd 8 ros are high chroma
            	%within each chroma level hues are:
                    %R,O,Y,H,G,C,B,P
 %Columns 1-2:replications of each condition
 
 % COLOR-EMOTION ASSOCATION RATINGS
% Rows 1-64: sad/happy (-/+)
% Rows 65-128: not-angry/angry (-/+)
% Within each emotion
    %colors in the 1st 16 rows are light
    %colors in the 2nd 16 rows are dark 
        %within each lightness level
            %colors in the 1st 8 rows are low chroma (15)
            %colors in the 2nd 8 ros are high chroma (30)
            	%within each chroma level hues are:
                    %R,O,Y,H,G,C,B,P
    %colors in the 3rd 16 rows are light again
    %colors in the 4th 16 rows are dark  again             
        %within each lightness level
            %colors in the 1st 8 rows are mid chroma (20)
            %colors in the 2nd 8 ros are matched chroma (matched to 20)
            	%within each chroma level hues are:
                    %R,O,Y,H,G,C,B,P
                    
% COLOR-APPEARANCE RATINGS          
% Rows 1-64: Destat/sat (-/+)
% Rows 65-128: dark/light (-/+)
% Rows 129-192: blue/yellow (-/+)
% Rows 193-256: green/red (-/+)
    % within each color appearance dimension, same structure as color-emo
    % associations above

