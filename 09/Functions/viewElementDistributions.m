function viewElementDistributions(elementMat, tit)
subMat = elementMat(:,2:end);
u = unique(subMat);
cols = length(subMat(1,:));
numElements = length(u(~isnan(u)))

for i = 1:numElements
    subplot(1, cols + 1, 1:cols)
    viewElements = subMat == u(i);
    imagesc(viewElements*-1);colormap(bone);
    
    title([tit, ' - Element (', num2str(u(i)), ') Number ', num2str(i), ' out of ', num2str(numElements)]);
    subplot(1, cols + 1, cols + 1)
    imagesc(sum(viewElements, 2)*-1);
    
pause
end



