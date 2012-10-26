load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
% Do find and "replace all" for all six birds...
PowysElementIPIs = getElementIPIs(Powys);
PowysPhraselModelElementIPIs = getElementIPIs(PowysPhraseBasedElementModel);
%%
save 2012\09\ElementIPIsAllSixBirds
%%
BaylissIPIs.elements.original = BaylissElementIPIs;
BaylissIPIs.elements.phraseMarkovModel = BaylissElementIPIs;
BaylissIPIs.phrases.original = BaylissElementIPIs;
BaylissIPIs.phrases.phraseMarkovModel = BaylissPhraselModelElementIPIs;