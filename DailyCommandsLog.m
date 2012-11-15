
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
% Do find and "replace all" for all six birds...
%% Finding the coefficient of variance.

birdName = 'Powys'

std(PowysIPIs.elements.original.allDiffsNormalized)/mean(PowysIPIs.elements.original.allDiffsNormalized)
std(PowysIPIs.phrases.original.allDiffsNormalized)/mean(PowysIPIs.phrases.original.allDiffsNormalized)
% save 2012\10\AllBirdsCVElmentPhrase
%%
load C:\Users\Eathan\Documents\MATLAB\2012\09\allIPIsAllSixBirds.mat
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};

for i = 1:6
    
thisStruct = eval([cell2mat(birdNames(i)), 'IPIs']);

ele = thisStruct.elements.original.allDiffsNormalized;
phr = thisStruct.phrases.original.allDiffsNormalized;
allBirdsCVElementPhrase.original(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

ele = thisStruct.elements.phraseMarkovModel.allDiffsNormalized;
phr = thisStruct.phrases.phraseMarkovModel.allDiffsNormalized;
allBirdsCVElementPhrase.phraseMarkovModel(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

ele = thisStruct.elements.phraseMarkovModel_shuffled.allDiffsNormalized;
phr = thisStruct.phrases.phraseMarkovModel_shuffled.allDiffsNormalized;
allBirdsCVElementPhrase.phraseMarkovModel_shuffled(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

end
%%
d1 = diff(allBirdsCVElementPhrase.original)
[h, p] =  ttest(diff(allBirdsCVElementPhrase.original))
d2 = diff(allBirdsCVElementPhrase.phraseMarkovModel);
[h, p] =  ttest(diff(allBirdsCVElementPhrase.phraseMarkovModel))
d3 = diff(allBirdsCVElementPhrase.phraseMarkovModel_shuffled);
[h, p] =  ttest(diff(allBirdsCVElementPhrase.phraseMarkovModel_shuffled))
d_all = [d1; d2; d3];
[h, p] =  ttest(diff([diff(d_all([1,3],:));diff(d_all(1:2,:))]))