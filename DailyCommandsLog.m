%%

birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
allElementFreqs = [];
for i = 1:length(birdNames)
    doFunctionAddExtensionToOutput('makePhrasePoissonModelFromElementMat', cell2mat(birdNames(i)), 'nameExtension')
end
%%
output = makePhrasePoissonModelFromElementMat(Bayliss);
%%
viewPhraseDistributionsToCompare(Bayliss, testPhraseModel, 'test');
%%
viewPhraseDistributionsToCompare(Bayliss, output, 'test');

%%
PowysPhrasePoisson = makePhrasePoissonModelFromElementMat(Powys);
%%
BaylissPhrasePoisson = makePhrasePoissonModelFromElementMat(Bayliss);
%%
BeasleyPhrasePoisson = makePhrasePoissonModelFromElementMat(Beasley);
%%
HT77PhrasePoisson = makePhrasePoissonModelFromElementMat(HT77);
%%
HT99PhrasePoisson = makePhrasePoissonModelFromElementMat(HT99);
%%
LumsdainePhrasePoisson = makePhrasePoissonModelFromElementMat(Lumsdaine);
%%
save 2012\09\PhrasePoissonModelsForAllSixBirds
%%
view3PhraseDistributionsToCompare(Bayliss, BaylissPhrasePoisson, BaylissPhraseMarkovModel, 'Bayliss Data', 'Bayliss Poisson Model', 'Bayliss Markov Model');
%%
inputMarkovMat = HT99PhraseMarkov;
elementMat = HT99;
HT99PhraseMarkovModel = makePhraseMarkovModelFromMarkovMat(inputMarkovMat, elementMat);
%done for all birds.
%%
save 2012\09\PhraseMarkovModelsForAllSixBirds
%%
view3PhraseDistributionsToComparePDF(Bayliss, BaylissPhrasePoisson, BaylissPhraseMarkovModel, 'Bayliss Original Data', 'Poisson Model', 'Markov Model', 'BaylissComparePhraseModels');
%% created another empty file and used find and replace repeatedly.
view3PhraseDistributionsToComparePDF(HT77, HT77PhrasePoisson, HT77PhraseMarkovModel, 'HT77 Data', 'HT77 Poisson Model', 'HT77 Markov Model', 'HT77ComparePhraseModels');


