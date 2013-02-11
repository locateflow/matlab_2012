% load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_06\markovShuffle')
addpath('2012\10')
% Have to add 2012\10 to the pathf
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
for i = 1:8
    
eval([cell2mat(birdNames(i)), 'PoissonIPIs.elements.phraseRandom = getElementIPIs(', cell2mat(birdNames(i)), 'PMshuffle)']);
eval([cell2mat(birdNames(i)), 'PoissonIPIs.phrases.phraseRandom = getPhraseIPIs(', cell2mat(birdNames(i)), 'PMshuffle)']);

end
%%
% after doing for all bids, saved the workspace
% save 'C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\RandomizedPhrasesData_8_birds'
%%
%%
%
%
%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};


for i = 1:8
    
thisStruct = eval([cell2mat(birdNames(i)), 'PoissonIPIs']);

ele = thisStruct.elements.phraseRandom.allDiffsNormalized;
phr = thisStruct.phrases.phraseRandom.allDiffsNormalized;
% I don't have to rest of the data right now but kept the format below the
% same.
allBirdsCVElementPhrase.phraseRandom(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

end
%%
%%
d1 = diff(allBirdsCVElementPhrase.phraseRandom)
[h, p] =  signtest(diff(allBirdsCVElementPhrase.phraseRandom))
%%
[h, p] =  signtest(d1(1:8))
%%

%% Here is the code for the example
figure
plot(allBirdsCVElementPhrase.phraseRandom, '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','elements','phrases',''})

ylabel('CV')
legend(birdNames);
title(['Sign test, reject Null, p = ', num2str(h)])
ylim([0 1])
title('Shuffled Markov Phrase Order')

%%
load('C:\Users\Eathan\Documents\MATLAB\2013\02\reloadForJustElementMats.mat')
%%
thisBird = Bayliss;
r = random(size(Bayliss(:,1)));
shuffled = sortrows(
