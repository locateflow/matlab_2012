birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};


for i = 1:8
    eval([cell2mat(birdNames(i)), 'PM =  makeMarkovPhraseModelFromElementMat(', cell2mat(birdNames(i)), ');'])
end
%%
