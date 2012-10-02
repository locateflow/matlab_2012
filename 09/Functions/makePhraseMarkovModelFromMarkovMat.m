function phraseModel = makePhraseMarkovModelFromMarkovMat(inputMarkovMat, elementMat)


phraseVector = elementMat(:,1);
phraseModel = zeros(size(phraseVector));
u = unique(phraseVector);
numPhrases = length(u)
r = ceil(numPhrases*rand(1));
startPhrase = u(r);
phraseModel(1) = startPhrase;


for i = 1:length(phraseModel)
    r = rand(1);
    current_element = phraseModel(i); 
    f = find(ismember(u, current_element));
        current_element_check = u(f)
        
        
        nextChoicesChancesAll = inputMarkovMat(f,:)
        nonZeroProbs = find(nextChoicesChancesAll > 0 )
        nextChoicesAll = u(nonZeroProbs)
        nextChoicesChancesAll = nextChoicesChancesAll(nonZeroProbs)
        
         choiceIndex = min(find(r <= cumsum(nextChoicesChancesAll)))
         current_element = nextChoicesAll(choiceIndex)
        
         phraseModel(i)
         current_element
         phraseModel(i+1) = current_element;
end
    