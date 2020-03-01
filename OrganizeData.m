
%% ORGANIZE EXPERIMENT 1 DATA

%number of subjects
n1 = size(EmoLoad,3);
%Subjects
SubjCol = reshape(repmat([1:20], 32,1), 32*n1,1);

%Start making the table
T_Exp1Data = table(SubjCol, 'VariableNames', { 'Subj'});

%average over block and scale data to range from -100 to 100
Emo = squeeze(mean(EmoLoad,2))/2;
ClrApp = squeeze(mean(ColorAppLoad,2))/2; 
 
%separate datasets by dimension rated
HS = Emo(1:32,:);     
A = Emo(33:64,:);

Sat = ClrApp(1:32,:);
LD = ClrApp(33:64,:);
YB = ClrApp(65:96,:);
RG = ClrApp(97:128,:);

  

% happy/sad data in wide format
HueLabel = repmat(['R'; 'O'; 'Y'; 'H'; 'G'; 'C'; 'B'; 'P'],4,1);
LightLabel = [repmat(['Lt'],16,1); repmat(['Dk'],16,1)];
ChromaLabel = [repmat(['Lo'],8,1); repmat(['Hi'],8,1); repmat(['Lo'],8,1); repmat(['Hi'],8,1)];

Labels = strcat(LightLabel, '_', ChromaLabel, '_', HueLabel);

T_HS1 = table;

for i = 1:32
    T_HS1.(Labels(i,:)) = HS(i,:)';
end

writetable(T_HS1, 'T_HSexp1.csv')


%Make log format output for R 
T_Exp1Data.HappySad = HS(:);
T_Exp1Data.Angry = A(:);

T_Exp1Data.Sat = Sat(:);
T_Exp1Data.LD = LD(:);
T_Exp1Data.YB = YB(:);  
T_Exp1Data.RG = RG(:);  

%CIELAB coordinates
T_Exp1Data.C = repmat(out32.Cab, n1,1);
T_Exp1Data.L = repmat(out32.L, n1,1);
T_Exp1Data.a = repmat(out32.a, n1,1);
T_Exp1Data.b = repmat(out32.b, n1,1);

%Write out the table in long format
writetable(T_Exp1Data, 'T_Exp1Data.csv')




%% ORGANIZE EXPERIMENT 2 DATA

%number of subjects (%subj is 2nd dim because no repetitions)
n2 = size(Emo2Load,2); 

%Subjects
Subj2Col = reshape(repmat([1:n2], 32,1), 32*n2,1);

%Start making the table
T_Exp2Data = table(Subj2Col, 'VariableNames', { 'Subj'});

%Task Oder: 1st 20 subjs did emo first, 2nd 23 subjs did emo 2nd
T_Exp2Data.TaskOrd = reshape(repmat([ones(1,20), ones(1,23)*(-1)],32,1),32*n2,1); 

%Scale data to range from -100 to 100
Emo2 = Emo2Load/2;
ClrApp2 = ColorApp2Load/2; 

%separate datasets by dimension rated and by whether the color sets of
%chroma = 15 and 30 (labeld as 'r' for replicaiton) and chroma = 20 and matches to 20
%('labed as 'm' for match)

HSr = Emo2(1:32,:);     
HSm = Emo2(33:64,:);   

Ar = Emo2(65:96,:);
Am = Emo2(97:128,:);

Satr = ClrApp2(1:32,:);
Satm = ClrApp2(33:64,:);

LDr = ClrApp2(65:96,:);
LDm = ClrApp2(97:128,:);

YBr = ClrApp2(129:160,:);
YBm = ClrApp2(161:192,:);

RGr = ClrApp2(193:224,:);
RGm = ClrApp2(225:256,:);



% happy/sad data in wide format
T_HS2 = table;
    % replicaiton dataset
   
    for i = 1:32
        T_HS2.(strcat('Rep_', Labels(i,:))) = HSr(i,:)';
    end

	%matched datast (chroma is = 20 or matched)
    ChromaMLabel = [repmat(['20'],8,1); repmat(['Mc'],8,1); repmat(['20'],8,1); repmat(['Mc'],8,1)];
    LabelsM = strcat(LightLabel, '_', ChromaMLabel, '_', HueLabel);

    for i = 1:32
        T_HS2.(strcat('Match_', LabelsM(i,:))) = HSm(i,:)';
    end
writetable(T_HS2, 'T_HSexp2.csv')


%Make log format output for R 

%Color-emotion association
T_Exp2Data.HappySad_r = HSr(:);
T_Exp2Data.HappySad_m = HSm(:);
T_Exp2Data.Angry_r = Ar(:);
T_Exp2Data.Angry_m = Am(:);

%Color appearance
T_Exp2Data.Sat_r = Satr(:);
T_Exp2Data.Sat_m = Satm(:);
T_Exp2Data.LD_r = LDr(:);
T_Exp2Data.LD_m = LDm(:);
T_Exp2Data.YB_r = YBr(:);
T_Exp2Data.YB_m = YBm(:);
T_Exp2Data.RG_r = RGr(:);
T_Exp2Data.RG_m = RGm(:);

%CIELAB coordinates
T_Exp2Data.L_r = repmat(out32.L, n2,1);
T_Exp2Data.L_m = repmat(outM.L, n2,1);
T_Exp2Data.a_r = repmat(out32.a, n2,1);
T_Exp2Data.a_m = repmat(outM.a, n2,1);
T_Exp2Data.b_r = repmat(out32.b, n2,1);
T_Exp2Data.b_m = repmat(outM.b, n2,1);
T_Exp2Data.C_r = repmat(out32.Cab, n2,1);

%coding -1 and 1 for this condition
Chroma2 = [ones(8,1)*(-1); ones(8,1); ones(8,1)*(-1); ones(8,1)];
T_Exp2Data.C_m = repmat(Chroma2, n2,1);

%Write out the table
writetable(T_Exp2Data, 'T_Exp2Data.csv')



%% Table of averages and color coordinates 
 
T_avgs = table;


T_avgs.hue = HueLabel;
T_avgs.lightness = LightLabel;
T_avgs.chroma = ChromaLabel;


%Exp 1
T_avgs.HS1 = mean(HS,2);
T_avgs.A1 = mean(A,2);

T_avgs.Sat1 = mean(Sat,2);
T_avgs.LD1 = mean(LD,2);
T_avgs.YB1 = mean(YB,2);
T_avgs.RG1 = mean(RG,2);

    
%Exp 2 replicaiton dataset (colors from Exp 1)
T_avgs.HSr = mean(HSr,2);
T_avgs.Ar = mean(Ar,2);

T_avgs.Satr = mean(Satr,2);
T_avgs.LDr = mean(LDr,2);
T_avgs.YBr = mean(YBr,2);
T_avgs.RGr = mean(RGr,2);


T_avgs.L = out32.L;
T_avgs.a = out32.a;
T_avgs.b = out32.b;
T_avgs.C = out32.Cab;



writetable(T_avgs, 'T_Exp1+2avgs.csv')

%% CORRELATIONS ACROSS DATASETS


DarkHiInd = 25:32;

%Exp 1 HS with Sat ratings, only the dark high chroma colors
[r p] = corrcoef(T_avgs.HS1(DarkHiInd), T_avgs.Sat1(DarkHiInd));

%Exp 1 YB ratings with b* 
[r p] = corrcoef(T_avgs.YB1, T_avgs.b);

%Exp 1 RG ratings with a* 
[r p] = corrcoef(T_avgs.RG1, T_avgs.a);

%Exp 1 LD ratings with sat
[r p] = corrcoef(T_avgs.LD1, T_avgs.Sat1);


%Exp 1 with Exp 2 replicaiton (r) dataset
[r p] = corrcoef(T_avgs.HS1, T_avgs.HSr);
[r p] = corrcoef(T_avgs.A1, T_avgs.Ar);
[r p] = corrcoef(T_avgs.LD1, T_avgs.LDr);
[r p] = corrcoef(T_avgs.YB1, T_avgs.YBr);
[r p] = corrcoef(T_avgs.RG1, T_avgs.RGr);
[r p] = corrcoef(T_avgs.Sat1, T_avgs.Satr);


%     Sat20m = Sat20s(:,[2,4]);
%     HS20m = HS20s(:,[2,4]);
%     [r , p ] = corrcoef(Sat20m(:), HS20m(:));
%     YB20m = YB20s(:,[2,4]);
%     [r , p ] = corrcoef(YB20m(:), HS20m(:));
%      RG20m = RG20s(:,[2,4]);
%      [r , p ] = corrcoef(RG20m(:), HS20m(:))
% dlmwrite('Exp1_HS.csv', HS')



