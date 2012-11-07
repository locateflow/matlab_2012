
load 2012\09\PhraseBasedElementMarkovModelForAllSixBirds_Shuffled
%%
% Do find and "replace all" for all six birds...
PowysPhraselModel_shuffledElementIPIs = getElementIPIs(PowysRandomizedPhraseMarkovModel);
PowysPhraselModel_shuffledPhraseIPIs = getPhraseIPIs(PowysRandomizedPhraseMarkovModel);

PowysIPIs.elements.phraseMarkovModel_shuffled = PowysPhraselModel_shuffledElementIPIs;
PowysIPIs.phrases.phraseMarkovModel_shuffled = PowysPhraselModel_shuffledPhraseIPIs;
%%
% delete all intermediate's and save only BirdNameIPIs
save C:\Users\Eathan\Documents\MATLAB\2012\09\allIPIsAllSixBirds.mat
%%

