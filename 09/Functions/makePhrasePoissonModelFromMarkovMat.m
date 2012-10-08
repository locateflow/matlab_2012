function phraseModel = makePhrasePoissonModelFromMarkovMat(elementMat)


phraseVector = elementMat(:,1);
phraseModel = zeros(size(phraseVector));
u = unique(phraseVector);
numPhrases = length(u)
uProbs = zeros(size(u));

for i = 1:numPhrases
    phraseCount = sum(phraseVector == u(i));
    uProbs(i) = phraseCount/length(phraseVector);
end
    


for i = 1:length(phraseModel)
    r = rand(1);
    choiceIndex = min(find(r <= cumsum(uProbs)))
    PhraseModel(i) = u(choiceIndex);
end

    