load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseMarkovMatsForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')

%%
% used find and replace for all six birds then saved data file.
inputMarkovMat = BaylissPhraseMarkov;   
elementMat = Bayliss;
BaylissPhraseBasedElementModel = makePhraseMarkovElementModelFromMarkovMat(inputMarkovMat, elementMat);