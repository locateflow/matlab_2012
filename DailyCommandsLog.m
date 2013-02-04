% Did find and replace for all birds...
addpath('C:\Users\Eathan\Documents\MATLAB\2012\10\Functions')
% Have to add 2012\10 to the pathf
PowysMarkovPhraseIPIs.elements.phraseMarkov = getElementIPIs(PowysPM);
PowysMarkovPhraseIPIs.phrases.phraseMarkov = getPhraseIPIs(PowysPM);
%%
% after doing for all bids, saved the workspace
% save 'C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_01\RandomizedPhrasesData_8_birds'
%%
%%
%
%
%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};


for i = 1:8
    
thisStruct = eval([cell2mat(birdNames(i)), 'MarkovPhraseIPIs']);

ele = thisStruct.elements.phraseMarkov.allDiffsNormalized;
phr = thisStruct.phrases.phraseMarkov.allDiffsNormalized;
% I don't have to rest of the data right now but kept the format below the
% same.
allBirdsCVElementPhrase.phraseMarkov(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

end
%%
%%
d1 = diff(allBirdsCVElementPhrase.phraseMarkov)
[h, p] =  signtest(diff(allBirdsCVElementPhrase.phraseMarkov))
%%
[h, p] =  signtest(d1(1:8))
%%

%% Here is the code for the example
plot(allBirdsCVElementPhrase.phraseMarkov, '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','elements','phrases',''})

ylabel('CV')
legend(birdNames);
title(['Sign test, reject Null, p = ', num2str(h)])
ylim([0 1])