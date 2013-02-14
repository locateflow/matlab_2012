% load('C:\Users\Eathan\Documents\MATLAB\2013\02\reloadForJustElementMats.mat')
load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
addpath('2012\10\Functions')
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
for j = 1:length(birdNames)

mat = eval(cell2mat(birdNames(j)));
% needed to ignore the fist row.  didn't do that before.
% mat = mat(:,2:end);
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
elementCVs(j,:) = [mnCVs(1), CVsOrig(1)];
phraseCVs(j,:) = [mnCVs(2), CVsOrig(2)];
elementDiffs(j) = mnCVs(1)-CVsOrig(1);
phraseDiffs(j) = mnCVs(2)-CVsOrig(2);

figure('windowst', 'dock'); 
subplot(121); imagesc(shuffled(:,2:end)); title([birdNames(j), ' Shuffled']);
% saveas(gcf, ['2013\02\2013_02_13\', mat2str(cell2mat(birdNames(j))), 'Shuffled'], 'pdf') 
% saveas(gcf, [birdNames(j), 'a'], 'pdf')

% figure('windowst', 'dock'); 
subplot(122); imagesc(mat(:,2:end)); title([birdNames(j), ' Original']);
% saveas(gcf, ['2013\02\2013_02_13\', mat2str(cell2mat(birdNames(j))), 'Original'], 'pdf') 
saveas(gcf, ['2013\02\2013_02_13\', mat2str(cell2mat(birdNames(j))), 'ShuffleOriginal'], 'pdf') 



end
%%
[hEle, pEle]=ttest(elementDiffs)
[hPhr, pPhr]=ttest(phraseDiffs)
% save '2013\02\2013_02_13\shuffledCVcompareOrig'

%%
figure
plot(elementCVs', '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','Bootstrap Shuffle','Original',''})

ylabel('CV')
legend(birdNames);
% title(['Sign test, reject Null, p = ', num2str(h)])
ylim([0 1])
title('Element CV Comparison')


figure
plot(phraseCVs', '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','Bootstrap Shuffle','Original',''})

ylabel('CV')
legend(birdNames);
% title(['Sign test, reject Null, p = ', num2str(h)])
ylim([0 1])
title('Phrase CV Comparison')

%%

figure
newEleCVs = elementCVs(:,[1, 1]);
newEleCVs = elementCVs - newEleCVs;
plot(newEleCVs', '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','Bootstrap Shuffle','Original',''})

ylabel('CV')
legend(birdNames);
% title(['Sign test, reject Null, p = ', num2str(h)])
ylim([-0.5 0.5])
title('Element CV Comparison')


figure
newPhrCVs = phraseCVs(:,[1, 1]);
newPhrCVs = phraseCVs - newPhrCVs;
plot(newPhrCVs', '-o')


xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','Bootstrap Shuffle','Original',''})

ylabel('CV')
legend(birdNames);
% title(['Sign test, reject Null, p = ', num2str(h)])
ylim([-0.5 0.5])
title('Phrase CV Comparison')
%%
% working on reshuffling repeats.
subMat = p;
u = unique(subMat);
numPhrases = length(u(~isnan(u)));

for i = 1:numPhrases   
    selectElements = find(subMat == u(i));
    diffs = diff(selectElements);
    
    allDiffs = [allDiffs; diffs];
    eval(['s.eachDiffs.a', num2str(i), ' = diffs;']);
    
    diffs = diffs/mean(diffs);
    eval(['s.eachDiffsNormalized.a', num2str(i), ' = diffs;']);
    
    allDiffsNormalized = [allDiffsNormalized; diffs];

end



