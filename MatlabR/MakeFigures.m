



% Sizes for for small version of figures for paper
ImgPos = [1751         754         262         274];
mE = 3.5;  %mark sizes 
mA = 3.5;  %mark sizes 

% Sizes for bigger versions of the figures
% ImgPos = [171   796   453   520]
% mE = 6; %mark sizes 
% mA = 6; %mark sizes

Clrs = rgb;
%% EXPERIMENT 2

figure (10)  
set(gcf, 'Position', ImgPos)

% Color-emotion associations 
subplot(3,2,1)
    PlotEmoApp(HS, 'Happy/Sad', Clrs, mE, 1, -100, 100);   
    
subplot(3,2,2)
    PlotEmoApp(A, 'Angry/Not-Angry', Clrs, mE, 1, -100, 100);

% Color-apperance ratings 
subplot(3,2,5)
	PlotEmoApp(Sat, 'Saturation', Clrs, mA,1, -100, 100);
    
subplot(3,2,6)
	PlotEmoApp(LD, 'Light/Dark', Clrs, mA,1, -100, 100);
 
subplot(3,2,3)
    PlotEmoApp(YB, 'Yellow/Blue', Clrs,  mA,1, -100, 100);
    
subplot(3,2,4)
    PlotEmoApp(RG, 'Red/Green',  Clrs, mA,1, -100, 100);
    
       
    
%% SUPPLEMENTARY EXP - REPLICATION DATASET
figure (11)
set(gcf, 'Position', ImgPos)

% Color-emotion  
subplot(3,2,1)
    PlotEmoApp(HSr, 'Happy/Sad', Clrs, mE, 1, -100, 100); %15 vs 30
    
subplot(3,2,2)
    PlotEmoApp(Ar, 'Angry/Not-Angry',  Clrs, mE, 1, -100, 100); %15 vs 30

  
% Color-apperance  
subplot(3,2,5)
   PlotEmoApp(Satr, 'Saturation', Clrs, mA, 1, -100, 100); %15 vs 30
   
subplot(3,2,6)
    PlotEmoApp(LDr, 'Light/Dark', Clrs, mA, 1, -100, 100); %15 vs 30
    
subplot(3,2,3)
    PlotEmoApp(YBr, 'Yellow/Blue',  Clrs, mA, 1, -100, 100); %15 vs 30
  
subplot(3,2,4)
    PlotEmoApp(RGr, 'Red/Green', Clrs, mA, 1, -100, 100); %15 vs 30

    

%% SUPPLEMENTARY EXP - MATCHED DATASET
figure(12)
set(gcf, 'Position', ImgPos)

%color-emotion
subplot(3,2,1)
    PlotEmoApp(HSm, 'Happy/Sad' ,  Clrs, mE, 1, -100, 100); 

subplot(3,2,2)
	PlotEmoApp(Am, 'Angry/Not-Angry',  Clrs, mE,1, -100, 100); 
    
%color appearance
subplot(3,2,5)
    PlotEmoApp(Satm, 'Saturation', Clrs, mA, 1, -100, 100); 
    
subplot(3,2,6)
    PlotEmoApp(LDm, 'Light/Dark',  Clrs, mA, 1, -100, 100); 

subplot(3,2,3)
    PlotEmoApp(YBm, 'Yellow/Blue',  Clrs, mA, 1, -100, 100); 
    
subplot(3,2,4)
    PlotEmoApp(RGm, 'Red/Green',  Clrs, mA, 1, -100, 100); 

  