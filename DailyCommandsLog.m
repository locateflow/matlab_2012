load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
%%
addpath('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\Functions')
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};


for i = 1:8
    eval([cell2mat(birdNames(i)), 'PM =  makeMarkovPhraseModelFromElementMat(', cell2mat(birdNames(i)), ');'])
end
%%
save('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_01\MarkovPhraseModel')

