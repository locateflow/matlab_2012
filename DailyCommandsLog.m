load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat');
%%
% Next I modified viewElementDistributions function to
% viewPhraseDistributions function
%%
viewPhraseDistributions(Powys,'Powys')
%%
viewPhraseDistributions(Bayliss,'Bayliss')
%%
viewPhraseDistributions(Beasley,'Beasley')
%%
viewPhraseDistributions(HT77,'HT77')
%%
viewPhraseDistributions(HT99,'HT99')
%%
viewPhraseDistributions(Lumsdaine,'Lumsdaine')

%%

birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
allElementFreqs = [];
for i = 1:length(birdNames)
    doFunctionAddExtensionToOutput('makePhraseMarkovFromElementMat', cell2mat(birdNames(i)), 'nameExtension')
end
%%
%%
PowysPhraseMarkov = makePhraseMarkovFromElementMat(Powys);
%%
BaylissPhraseMarkov = makePhraseMarkovFromElementMat(Bayliss);
%%
BeasleyPhraseMarkov = makePhraseMarkovFromElementMat(Beasley);
%%
HT77PhraseMarkov = makePhraseMarkovFromElementMat(HT77);
%%
HT99PhraseMarkov = makePhraseMarkovFromElementMat(HT99);
%%
LumsdainePhraseMarkov = makePhraseMarkovFromElementMat(Lumsdaine);
%%
save 2012\09\PhraseMarkovMatsForAllSixBirds
%%

load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseMarkovMatsForAllSixBirds.mat')
%%
inputMarkovMat = BaylissPhraseMarkov;
elementMat = Bayliss;
testPhraseModel = makePhraseMarkovModelFromMarkovMat(inputMarkovMat, elementMat);







       
    





