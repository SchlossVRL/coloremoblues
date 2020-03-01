function [Y] = PlotEmoApp(Data, plotTitle, Clrs, mSize, e, yMi, yMa)


textSize = 7;

Emo = mean(Data,2);

Y = reshape(Emo, 8,4);

if e == 1
    SEM = std(Data')/sqrt(size(Data,2));
    Ebar = reshape(SEM',8,4);
end


Mark = {'^', '^', 's', 's'};
Lines = {'-', '-', '-', '-'};
SizeDiff = [0 0 .5 .5];

Lightness = { [.7 .7 .7]; [.7 .7 .7]; [.2 .2 .2]; [.2 .2 .2]};

i = 1;
hold on 
for col = 1:4
    plot(Y(:,col), 'Color', Lightness{col}, 'LineStyle', Lines{col})
    for row = 1:8
    if e ==1
          plot([row, row], [Y(row,col)- Ebar(row,col), Y(row,col)+ Ebar(row,col)],'k')
          plot([row-.1, row+.1], [Y(row,col)- Ebar(row,col), Y(row,col)- Ebar(row,col)],'k')
          plot([row-.1, row+.1], [Y(row,col)+ Ebar(row,col), Y(row,col)+ Ebar(row,col)],'k')
    end
    
    %For colored markers
    if col == 1 || col == 3
        plot(row, Y(row,col), 'MarkerFaceColor', [1 1 1],'MarkerEdgeColor', Clrs(i,:), 'MarkerSize', mSize+SizeDiff(col), 'Marker', Mark{col}, 'LineWidth', .5)
    end

    if col == 2 || col == 4
        plot(row, Y(row,col), 'MarkerFaceColor', Clrs(i,:),'MarkerEdgeColor', Clrs(i,:), 'MarkerSize', mSize+SizeDiff(col), 'Marker', Mark{col}, 'LineWidth', .5)
    end

%     %For b/w markers
%     if col == 1 || col == 3
%         plot(row, Y(row,col), 'MarkerFaceColor', [1 1 1],'MarkerEdgeColor', Lightness{col}, 'MarkerSize', mSize+SizeDiff(col), 'Marker', Mark{col}, 'LineWidth', .5)
%     end
% 
%     if col == 2 || col == 4
%         plot(row, Y(row,col), 'MarkerFaceColor', Lightness{col},'MarkerEdgeColor', Lightness{col}, 'MarkerSize', mSize+SizeDiff(col), 'Marker', Mark{col}, 'LineWidth', .5)
%     end
    
        i = i +1;
        
    end
end

xlim([0 9])
set(gca,'XTickLabel',{'R';'O'; 'Y'; 'H'; 'G'; 'C'; 'B'; 'P'}, 'FontSize', textSize)
set(gca,'XTick',[ 1,2,3, 4, 5, 6, 7, 8]);
% set(gca,'Color',[96/255 96/255 96/255]);
set(gca,'YTick',[-100:50:100]);

xlabel('Hue')
ylabel(' Mean Rating')


title(plotTitle)
ylim([yMi yMa])





















