function compareElementDistributions(modelElementMat, originalElementMat, birdName, altTitle)
subMatModel = modelElementMat(:,2:end);
subMatOrig = originalElementMat(:,2:end);
u = unique(subMatModel);
cols = length(subMatModel(1,:));
numElements = length(u(~isnan(u)))

for i = 1:numElements
    subplot(1, 10, 1:4)
    viewElementsOrig = subMatOrig == u(i);
    imagesc(viewElementsOrig*-1);colormap(bone);

    
    title([birdName, 'Original Data - Element (', num2str(u(i)), ') Number ', num2str(i), ' out of ', num2str(numElements)]);
    subplot(1, 10, 5)
    imagesc(sum(viewElementsOrig, 2)*-1);
    set(gca,'ytick',[],'xtick',[])
    
    subplot(1, 10, 7:10)
    viewElementsModel = subMatModel == u(i);
    imagesc(viewElementsModel*-1);colormap(bone);
    set(gca,'ytick',[])

    
    title(altTitle);
    subplot(1, 10, 6)
        imagesc(sum(viewElementsModel, 2)*-1);
    set(gca,'ytick',[],'xtick',[])
    filename = 'test';
    saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\09\Figures\OriginalElementDistributions\', filename, 'Element', sprintf('%02d',i), 'of', num2str(numElements), '.pdf']) 

    
pause
end



