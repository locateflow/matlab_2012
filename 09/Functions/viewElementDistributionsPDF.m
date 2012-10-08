function viewElementDistributionsPDF(elementMat, tit, filename)
subMat = elementMat(:,2:end);
u = unique(subMat);
cols = length(subMat(1,:));
numElements = length(u(~isnan(u)))

for i = 1:numElements
    subplot(1, 10, 1:8)
    viewElements = subMat == u(i);
    imagesc(viewElements*-1);colormap(bone);
    
    title([tit, ' - Element (', num2str(u(i)), ') Number ', num2str(i), ' out of ', num2str(numElements)]);
    subplot(1, 10, 9:10)
    imagesc(sum(viewElements, 2)*-1);
    
    saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\OriginalElementDistributions\', filename, 'Element', sprintf('%02d',i), 'of', num2str(numElements), '.pdf']) 

% pause
end



