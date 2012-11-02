load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
BaylissRandomizedPhraseMarkovModel = randomizePhraseMarkovModel(BaylissPhraseBasedElementModel);
% phraseModel = BaylissRandomizedPhraseMarkovModel;
% originalElementStructure = BaylissPhraseBasedElementModel;
% BaylissrandomizedMarkovPhraseModelwElementStructure = elementStructureFromPhraseModel(phraseModel, originalElementStructure)
%%
figure
imagesc(BaylissRandomizedPhraseMarkovModel)
figure
imagesc(BaylissPhraseBasedElementModel)
figure
Bayliss
%%
modelElementMat = BaylissRandomizedPhraseMarkovModel;
originalElementMat = BaylissPhraseBasedElementModel;
birdName = 'Bayliss';
altTitle = 'From Randomized Markov';
filename = 'BaylissCompareRandomizedMarkov';

compareElementDistributionsPDF(modelElementMat, originalElementMat, birdName, altTitle, filename)