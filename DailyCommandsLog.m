load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
%%
for i = 1:length(birdNames)
    allElementFreqs = [allElementFreqs; findElementDistributionPatternHelper1(eval(cell2mat(birdNames(i))),birdNames(i))]
end

%%
commandString = 'inputMarkovMat = PowysPhraseMarkov; elementMat = Powys; PowysPhraseBasedElemntModel = makePhraseMarkovElementModelFromMarkovMat(inputMarkovMat, elementMat); compareElementDistributionsPDF(Powys, PowysPhraseBasedElemntModel, "Powys", "Phrase Based Markov Model", "PowysPhraseBasedMarkovModel");'
%%
eval(commandString);
%%
inputMarkovMat = PowysPhraseMarkov;   
elementMat = Powys;
PowysPhraseBasedElementModel = makePhraseMarkovElementModelFromMarkovMat(inputMarkovMat, elementMat);
compareElementDistributionsPDF(Powys, PowysPhraseBasedElementModel, 'Powys', 'Phrase Based Markov Model', 'PowysPhraseBasedMarkovModel');