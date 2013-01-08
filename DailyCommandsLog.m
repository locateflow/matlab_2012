% added Johnson Data by cut and paste to workspace.
load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
save('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\PhraseBasedElementMarkovModelForAllSevenBirds.mat')
%%

Johnson1PhraselModel_ElementIPIs = getElementIPIs(Johnson1PrhaseBasedElementModel);
Johnson1PhraselModel_PhraseIPIs = getPhraseIPIs(Johnson1PrhaseBasedElementModel);
%%

JohnsonIPIs.elements = Johnson1PhraselModel_ElementIPIs;
JohnsonIPIs.phrases = Johnson1PhraselModel_PhraseIPIs;

load('C:\Users\Eathan\Documents\MATLAB\2012\09\allIPIsAllSixBirds.mat')
%%
save('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\PhraseBasedElementMarkovModelForAllSevenBirds.mat')
% just original data added.  Need model and shuffled model to be the same
% as others.
%%
clear all
load('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\PhraseBasedElementMarkovModelForAllSevenBirds.mat', 'JohnsonIPIs')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\StructuresForAllSixBirds.mat')
%%
save('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\StructuresForAllSevenBirds.mat')
%%
Johnson1.elements.original = JohnsonIPIs.elements;
Johnson1.phrases.original = JohnsonIPIs.phrases;
Johnson1IPIs = Johnson1;
save ('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\PhraseBasedElementMarkovModelForAllSevenBirds.mat', 'Johnson1IPIs', '-append')

%%



birdNames = {'Johnson1'};
load('C:\Users\Eathan\Documents\MATLAB\2012\10\AllBirdsCVElmentPhrase.mat', 'AllBirdsCVElementPhrase')
%%
save('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\AllBirdsCVElementPhrase.mat')
%%
load('C:\Users\Eathan\Documents\MATLAB\2012\10\AllBirdsCVElmentPhrase.mat')

birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1'};


for i = 1:7
    
thisStruct = eval([cell2mat(birdNames(i)), 'IPIs']);

ele = thisStruct.elements.original.allDiffsNormalized;
phr = thisStruct.phrases.original.allDiffsNormalized;
allBirdsCVElementPhrase.original(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

end
%%
d1 = diff(allBirdsCVElementPhrase.original)
[h, p] =  signtest(diff(allBirdsCVElementPhrase.original))
%%
[h, p] =  signtest(d1(1:5))

%% Here is the code for the example
plot(allBirdsCVElementPhrase.original, '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','elements','phrases',''})

ylabel('CV')
legend(birdNames);
title('Sign test, reject Null, p = .0156')
%%
d1 = diff(allBirdsCVElementPhrase.original)
[h, p] =  ttest(diff(allBirdsCVElementPhrase.original))
d2 = diff(allBirdsCVElementPhrase.phraseMarkovModel);
[h, p] =  ttest(diff(allBirdsCVElementPhrase.phraseMarkovModel))
d3 = diff(allBirdsCVElementPhrase.phraseMarkovModel_shuffled);
[h, p] =  ttest(diff(allBirdsCVElementPhrase.phraseMarkovModel_shuffled))
d_all = [d1; d2; d3];
[h, p] =  ttest(diff([diff(d_all([1,3],:));diff(d_all(1:2,:))]))

%%
% From Dec 6 Commit.
load 2012\10\AllBirdsCVElmentPhrase

plot(allBirdsCVElementPhrase.phraseMarkovModel_shuffled, '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','elements','phrases',''})

ylabel('CV')
%%
save('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\DataToday.mat')
%%
load('C:\Users\Eathan\Documents\MATLAB\2012\12\Johnson1_data.mat', 'Johnson1')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\StructuresForAllSixBirds.mat')
%%
save('C:\Users\Eathan\Documents\MATLAB\2012\12\StructuresForAllSixBirds2.mat')
%%
load('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\DataToday.mat')


