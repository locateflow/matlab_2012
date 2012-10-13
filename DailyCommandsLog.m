load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
BaylissRandomizedPhraseMarkovModel = randomizePhraseMarkovModel(BaylissPhraseBasedElementModel);
phraseModel = BaylissRandomizedPhraseMarkovModel;
originalElementStructure = BaylissPhraseBasedElementModel;
BaylissrandomizedMarkovPhraseModelwElementStructure = elementStructureFromPhraseModel(phraseModel, originalElementStructure)

