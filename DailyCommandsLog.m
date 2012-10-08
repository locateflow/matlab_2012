elementMat = Bayliss;
tit = 'Bayliss';

filename = [tit, 'OriginalPhraseDistribution'];
suffix = ' Original Element Distribution';
tit = [tit, suffix];
viewElementDistributionsPDF(elementMat, tit, filename)
%%
inputMarkovMat = BaylissPhraseMarkov;   
elementMat = Bayliss;
BaylissPhraseBasedElemntModel = makePhraseMarkovElementModelFromMarkovMat(inputMarkovMat, elementMat)
%%
compareElementDistributions(Bayliss, phraseModel, 'test', 'Bayliss', 'PhraseBasedMarkovModel')
