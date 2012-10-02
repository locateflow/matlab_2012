function viewPhraseDistributionsToCompare(elementMat1, elementMat2, tit)
subMat1 = elementMat1(:,1);
subMat2 = elementMat2(:,1);
u = unique(subMat1);
numPhrases = length(u(~isnan(u)))

for i = 1:numPhrases  
    subplot(121)
    viewElements1 = subMat1 == u(i);
    imagesc(viewElements1*-1);colormap(bone);   
    subplot(122)
    viewElements2 = subMat2 == u(i);
    imagesc(viewElements2*-1);colormap(bone); 
    title([tit, ' - Phrase (', num2str(u(i)), ') Number ', num2str(i), ' out of ', num2str(numPhrases)]);
%     filename = ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\', title, 'Phrase', num2str(i), 'of', num2str(numPhrases), '.bmp'];
%     saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\BarcodesForPhrases\PDF\', tit, 'Phrase', sprintf('%02d',i), 'of', num2str(numPhrases), '.pdf']) 
pause
end



