
%%
clear all
load('C:\Users\Eathan\Documents\MATLAB\2012\12\2012_12_07\AllBirdsCVElementPhrase.mat')
load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\Lumsdaine2ElementMatrix.mat')
%%

Lumsdaine2.elements.original = Lumsdaine2IPIs.elements;
Lumsdaine2.phrases.original = Lumsdaine2IPIs.phrases;
Lumsdaine2IPIs = Lumsdaine2;%
%%
%
%
%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};


for i = 1:8
    
thisStruct = eval([cell2mat(birdNames(i)), 'IPIs']);

ele = thisStruct.elements.original.allDiffsNormalized;
phr = thisStruct.phrases.original.allDiffsNormalized;
allBirdsCVElementPhrase.original(1:2,i) = [std(ele)/mean(ele); std(phr)/mean(phr)];

end
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
%%

d1 = diff(allBirdsCVElementPhrase.original)
[h, p] =  signtest(diff(allBirdsCVElementPhrase.original))
%%
[h, p] =  signtest(d1(1:8))
%%

%% Here is the code for the example
%%
h = 2;
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
figure
plot(allBirdsCVElementPhrase.original - allBirdsCVElementPhrase.phraseRandom , '-o')

xlim([0,3])
set(gca,'xtick', [0:1:3])
set(gca,'xticklabel', {'','elements','phrases',''})

ylabel('CV')
legend(birdNames);
title(['Sign test, reject Null, p = ', num2str(h)])