load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
BaylissRandomizedPhraseMarkovModel = randomizePhraseMarkovModel(BaylissPhraseBasedElementModel);
phraseModel = BaylissRandomizedPhraseMarkovModel;
originalElementStructure = BaylissPhraseBasedElementModel;
%%
figure
allDiffs = viewPhraseDistributionHistograms(Powys, 'title');
figure
allDiffs2 = viewPhraseDistributionHistograms(PowysPhraseBasedElementModel, 'title');

figure
[h,p,k] = kstest2(allDiffs,allDiffs2)
x = allDiffs;
y = allDiffs2;
F1 = cdfplot(x);
hold on
F2 = cdfplot(y)
set(F1,'LineWidth',2,'Color','r')
set(F2,'LineWidth',2)
legend([F1 F2],'F1(x)','F2(x)','Location','NW')
