% load('C:\Users\Eathan\Documents\MATLAB\2013\02\reloadForJustElementMats.mat')
load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
for j = 1:length(birdNames)

mat = eval(cell2mat(birdNames(j)));
% mat = Bayliss;
len = length(mat(:, 1));


for i = 1:100

r = rand(len, 1);    
shuffled = [r, mat];  shuffled = sortrows(shuffled, 1); shuffled = shuffled(:, 2:end);
elementIPIs = getElementIPIs(shuffled);
phraseIPIs = getPhraseIPIs(shuffled);
ele = elementIPIs.allDiffsNormalized;
phr = phraseIPIs.allDiffsNormalized;
CVs(i,1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)]

end
mnCVs = mean(CVs);


elementIPIs = getElementIPIs(mat);
phraseIPIs = getPhraseIPIs(mat);
ele = elementIPIs.allDiffsNormalized;
phr = phraseIPIs.allDiffsNormalized;
CVsOrig(1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)];
eval([cell2mat(birdNames(j)), 'ShuffledOrigCVs = [mean(CVs); CVsOrig]'])
elementDiffs(j) = mnCVs(1)-CVsOrig(1);
phraseDiffs(j) = mnCVs(2)-CVsOrig(2);



end
%%
[hEle, pEle]=ttest(elementDiffs)
[hPhr, pPhr]=ttest(phraseDiffs)
% save '2013\02\2013_02_13\shuffledCVcompareOrig'

%%



