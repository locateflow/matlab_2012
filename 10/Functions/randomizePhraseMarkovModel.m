function randomizedPhraseMarkovModel = randomizePhraseMarkovModel(inputModel);

phraseColumn = inputModel(:,1);
u = unique(phraseColumn);
r = rand(size(u));
ur = [u r];
ur = sortrows(ur, 2);
newU = ur(:, 1);
for i = 1:length(u);
    f = find(phraseColumn == u(i));
    findNewU = find(phraseColumn == newU(i));
    replacementPhrase = inputModel(findNewU(1),:);
    for j = 1:length(f)
        
randomizedPhraseMarkovModel(f(j), :) = replacementPhrase;
    end
end