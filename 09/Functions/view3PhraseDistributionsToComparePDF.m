function view3PhraseDistributionsToComparePDF(elementMat1, elementMat2, elementMat3, tit1, tit2, tit3, filename)
subMat1 = elementMat1(:,1);
subMat2 = elementMat2(:,1);
subMat3 = elementMat3(:,1);
u = unique(subMat1);
numPhrases = length(u(~isnan(u)))

for i = 1:numPhrases  
    subplot(131)
    viewElements1 = subMat1 == u(i);
    imagesc(viewElements1*-1);colormap(bone); 
    title([tit1, ' - Phrase (', num2str(u(i)), ') - ', num2str(i), '/', num2str(numPhrases)]);

    subplot(132)
    viewElements2 = subMat2 == u(i);
    imagesc(viewElements2*-1);colormap(bone); 
    title(tit2)    
    subplot(133)
    viewElements3 = subMat3 == u(i);
    imagesc(viewElements3*-1);colormap(bone); 
    title(tit3)
%     filename = ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\', title, 'Phrase', num2str(i), 'of', num2str(numPhrases), '.bmp'];
%     saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\PDF\', tit, 'Phrase', sprintf('%02d',i), 'of', num2str(numPhrases), '.pdf']) 
    saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\ComparePhraseDistributionModels\', filename, 'Phrase', sprintf('%02d',i), 'of', num2str(numPhrases), '.pdf']) 

% pause
end



