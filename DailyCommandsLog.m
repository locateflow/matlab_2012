%%
% Do find and "replace all" for all six birds...
birdNames = {'BaylissIPIs', 'BeasleyIPIs', 'HT77IPIs', 'HT99IPIs', 'LumsdaineIPIs', 'PowysIPIs'};
for i = 1:length(birdNames)

eval(['thisStruct = ', (cell2mat(birdNames(i))), ';'])
birdName = cell2mat(birdNames(i));
figure
subplot(4,1,1:2)
a = thisStruct.phrases.original.allDiffsNormalized;
b = thisStruct.elements.original.allDiffsNormalized;
[h,p,k] = kstest2(a, b);
t = ['h = ', num2str(h), char(10), 'p = ', num2str(p), char(10), 'k = ', num2str(k)];

hist(a);
title([birdName, char(10) ' IPI distribution (phrases, original data)'])
axisLim = get(gca, 'xlim');
set(gca, 'xtick', []);

text(max(xlim)*0.5, max(ylim)*0.8, t)
subplot(4,1,3:4)
hist(b);
title([birdName, char(10) ' IPI distribution (elements, original data)'])

set(gca, 'xlim', axisLim);
saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\10\Figures\kstests\', birdName, 'PhraseVsElement.pdf']) 
end