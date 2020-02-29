% Code for analyzing and plotting color-emotion association data from 
% Palmer et al., (2013, PNAS)
% Written by Karen B. Schloss (2020)

%T_BCP.csv from berkeley color project (BCP), 
    %ColorName the 2 letter name of the color. 
        % 1st letter is S[aturated], L[ight], M[uted], or D[ark]. 
        % 2nd letter is R[ed], O[range], Y[ellow], [c]H[artreuse], 
        %               G[reen], C[yan], B[lue], and P[urple].
        
    %ColorNumber is the order of the colors in the output file
    %Happy, Sad, and Angry, are the color-emotion associaitons ratings
    %CIE_x, CIE_y, and CIE_Y are the CIE xyY coordinates for each color
    %L, a, b, and C are CIE L*, a*, b* and C* coordinates for each color
        %using white point of CIE xn = .312, yn = .318, Yn = 116

        
%Load in table
T_BCP = readtable('T_BCP.csv'); 

%Combine happy and sad ratings
T_BCP.HS = (T_BCP.Happy+T_BCP.Sad*(-1))/2;


%% Linear regression for mean happy/sad and angry ratings using L* and C*

% define models
model_HS = 'HS ~ L + C';
model_A = 'Angry ~ L + C';

%run multiple linear regression 
mdl_HS = fitlm(T_BCP, model_HS);
mdl_A = fitlm(T_BCP, model_A);

%store weights from multiple linear regression
HSweights = mdl_HS.Coefficients.Estimate;
Aweights = mdl_A.Coefficients.Estimate;

% generate predictions from intercept, L*, and C*
T_BCP.HSpred = HSweights(1) + HSweights(2).* T_BCP.L + HSweights(3).*T_BCP.C;
T_BCP.Apred = Aweights(1) + Aweights(2).* T_BCP.L + Aweights(3).*T_BCP.C;

%calculate residuals
T_BCP.HSres = T_BCP.HS-T_BCP.HSpred;
T_BCP.Ares = T_BCP.Angry-T_BCP.Apred;


%% Color-emotion associaitons for individual subjects
    %   T_EmoSubj.csv has data from Palmer et al., (2013, PNAS)
    %   rows are subjects, columns are emo (HappySad 1-37 or angry 38-74)
    %   for each BCP color (see above comment for color notiation)

T_EmoSubj = readtable('T_EmoSubj.csv'); 

%separate HS data and A data for each subject
HSsubj = T_EmoSubj{:,1:37};
Asubj  = T_EmoSubj{:,38:74};

%calculate subject residuals by subtracting predictions obtained above
HSsubjRes = HSsubj - T_BCP.HSpred';
AsubjRes = Asubj - T_BCP.Apred';

%% Plot ratings and residuals after subtracting predictions
    % Note: these plots are sized to fit in one printed column. Sizes in
    % the plotting function should change if the figure is meant to be 
    % viewed as larger. 
figure (1)
set(gcf, 'Position', [1816 881 248 185]);

subplot(2,2,1)
    PlotBCP(HSsubj', 1, 'Happy/Sad Ratings', 'Mean Rating', -100, 100, 1)

subplot(2,2,3)
    PlotBCP(HSsubjRes', 1, 'Happy/Sad Residuals', 'Mean Residual', -100, 100, 1)

subplot(2,2,2)
    PlotBCP(Asubj', 1, 'Angry Ratings', 'Mean Rating', -100, 100, 1)

subplot(2,2,4)
    PlotBCP(AsubjRes', 1, 'Angry Residuals', 'Mean Residual', -100, 100, 1)



%% t-tests comparing SY and SB

%ttest comparing ratings
[h p chi stats] = ttest(T_EmoSubj.HS_SY, T_EmoSubj.HS_SB);
    d_rate = computeCohen_d(T_EmoSubj.HS_SY, T_EmoSubj.HS_SB, 'paired');

%ttest comparing residuals 
SY = 9;
SB = 25;

[h p chi stats] = ttest(HSsubjRes(:,SB), HSsubjRes(:,SY));
    d_res = computeCohen_d(HSsubjRes(:,SB), HSsubjRes(:,SY), 'paired');
