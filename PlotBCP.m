function  PlotBCP(DataLoad, figNum, plotTitle, y_axis, ymin, ymax, ebar)

% Plotting color-emotion association data from 
% Palmer et al., (2013, PNAS)
% Written by Karen B. Schloss (2020)


%DataLoad holds the data (rows are colors, cols are subjects)
%figNum is the figure nuumber .
%plotTitle is the name of the plot (string)
%y_axis is the y-axis lable
%ymin and ymax are the min and max of the y-axis
%ebar = 1 if error bars are desired, ebar = 0 if error bars are undesired

%NOTE: this function is designed to make small figures for a paper. Changes
%to the size would be desired for larger figures (e.g., larger marks)


%% calculate error bars
if ebar == 1
    SEMcol = (std(DataLoad')/sqrt(size(DataLoad,2)))';
    
    % 32 chromatic colors
    SEM = reshape(SEMcol(1:32),4,8);
    
    % 5 achromatic  colors
    SEMach = SEMcol(33:37);
end

%% format data for plotting

%average over participants
DataAvg = mean(DataLoad,2); 

%shape the chromatic data to be for 4 (S,L,M,D) x 8 hues
ChromPlot = reshape(DataAvg(1:32),4,8);

%grab the achromatic data (black, A1, A2, A3, white)
AchPlot = DataAvg(33:37);

%% set design parameters for plot
textSize = 7;
LineClrs = {[.3, .3, .3]; [.5, .5, .5]; [.3, .3,.3]; [.1,.1,.1]};
Markers = {'o', '^', 'd', 's'};
MarkSizes = [3.5 3.5 3.5 3.5];

%these colors coordiantes are approximations
Colors37 ={[1.00 0.00 0.18]; [1.00 0.48	0.57]; [0.80 0.30	0.38]; [0.70	0.00 0.02];
         [1.00 0.40 0.00]; [1.00 0.69	0.46]; [0.89 0.52 0.26];      [0.55	0.32 0.00];
         [1.00 1.00 0.00]; [1.00 0.93	0.52]; [0.86 0.77	0.19]; [0.55  0.55 0.00];
         [0.57 1.00 0.00]; [0.79 1.00	0.51]; [0.62 0.87	0.29]; [0.40  0.55 0.00];
         [0.00 0.94 0.55]; [0.43 0.93	0.72]; [0.33 0.83	0.62]; [0.00	0.47 0.35];	
         [0.02 0.87 1.00]; [0.42 0.86	0.93]; [0.27 0.69	0.75]; [0.02	0.52 0.60];
         [0.24 0.49 1.00]; [0.61 0.66	1.00]; [0.46 0.52	0.88]; [0.06	0.26 0.66];
         [0.80 0.00 1.00]; [0.86 0.50	1.00]; [0.66 0.47	0.77]; [0.45	0.00 0.58];
         [0.00 0.00 0.00]; [0.40 0.40  0.40]; [0.63 0.63	0.63]; [0.79	0.79 0.79]; [0.90 0.90 0.90]};
     
%% Make figure

figure(figNum);
hold on

%plot lines on the graph
for i = 1:4
    plot(ChromPlot(i,:), 'Color', LineClrs{i,:}, 'LineWidth', .5)
        
end

% plot points and error bars for each chromatic color (c)
c = 1;
for hue = 1:8
    for i = 1:4
        %error bars
        if ebar == 1
            plot([hue hue], [ChromPlot(i,hue)-SEM(i,hue) ChromPlot(i,hue)+SEM(i,hue)], 'Color', LineClrs{i}, 'LineWidth', .5 );
            plot([hue-.1 hue+.1], [ChromPlot(i,hue)-SEM(i,hue) ChromPlot(i,hue)-SEM(i,hue)], 'Color', LineClrs{i}, 'LineWidth', .5 );
            plot([hue-.1 hue+.1], [ChromPlot(i,hue)+SEM(i,hue) ChromPlot(i,hue)+SEM(i,hue)], 'Color', LineClrs{i}, 'LineWidth', .5 );
        end
        %data points
        plot(hue, ChromPlot(i,hue), 'LineWidth', .25,  'Marker', Markers{i},'MarkerSize',MarkSizes(i),'MarkerFaceColor',Colors37{c,:},'MarkerEdgeColor',[.3 .3 .3])
        c = c + 1;
    end
end   


% plot points and error bars for each achromatic color (i)
for i = 1:5
 
    %error bars
    plot([10 10],       [AchPlot(i)-SEMach(i) AchPlot(i)+SEMach(i)], 'Color', [.3 .3 .3], 'LineWidth', .5 );
  	plot([10-.1 10+.1], [AchPlot(i)-SEMach(i) AchPlot(i)-SEMach(i)], 'Color', [.3 .3 .3], 'LineWidth', .5 );
  	plot([10-.1 10+.1], [AchPlot(i)+SEMach(i) AchPlot(i)+SEMach(i)], 'Color', [.3 .3 .3], 'LineWidth', .5 );
    
    %data points
    plot(10,  AchPlot(i), 'v', 'MarkerFaceColor',Colors37{i+32,:}, 'MarkerEdgeColor',[.3 .3 .3], 'MarkerSize',4, 'LineWidth', .3)
    
end
    
% axis scales
xlim([0 11]);
ylim([ymin ymax])

% axis labels and tick marks
xlabel('Hue','FontSize',textSize);
ylabel(y_axis, 'FontSize',textSize);

set(gca,'XTickLabel',{'R';'O'; 'Y'; 'H'; 'G'; 'C'; 'B'; 'P'; 'Ach'},'LineWidth',.5)
set(gca,'XTick',[ 1,2,3, 4, 5, 6, 7, 8,10],'FontSize',textSize);
set(gca,'YTick',[-100:50:100],'FontSize',textSize);

% plot title
title(plotTitle, 'FontSize', 7);

end

    
    
    
    
    
    