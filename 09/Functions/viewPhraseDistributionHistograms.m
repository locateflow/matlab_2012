function allDiffs = viewPhraseDistributionHistograms(elementMat, tit)
subMat = elementMat(:,1);
u = unique(subMat);
numPhrases = length(u(~isnan(u)))
allDiffs = [];

for i = 1:numPhrases   
    viewElements = find(subMat == u(i));
    diffs = diff(viewElements);
%     diffs = diffs/mean(diffs);
    hist(diffs);
    allDiffs = [allDiffs; diffs];
%     imagesc(viewElements*-1);colormap(bone);   
    title([tit, ' - Phrase (', num2str(u(i)), ') Number ', num2str(i), ' out of ', num2str(numPhrases)]);
%     filename = ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\', title, 'Phrase', num2str(i), 'of', num2str(numPhrases), '.bmp'];
%     saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\PDF\', tit, 'Phrase', sprintf('%02d',i), 'of', num2str(numPhrases), '.pdf']) 

% pause
end
hist(allDiffs); title('all diffs')



