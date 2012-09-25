function findElementDistributionPatternHelper2(elementMat)
arrayFromMat = elementMat(:,2:end);
arrayFromMat = arrayFromMat(~isnan(arrayFromMat));
TABLE1 = tabulate(arrayFromMat);
freqs = TABLE1(:,3);
myElemntInd = min(freqs > 5);
TABLE1(myElemntInd, 2)
imagesc(elementMat(elementMat == TABLE1(myElemntInd, 2)));



