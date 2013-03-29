load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
addpath('2012\10\Functions')
addpath('2013\01\2013_01_21\Functions')

birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
for j = 1:length(birdNames)
    mat = eval(cell2mat(birdNames(j)));
    len = length(mat(:, 1));  
    
        inputModel = mat;
        inputModel(isnan(inputModel)) = -77;
        uPhrase = unique(inputModel, 'rows');
        r = rand(length(uPhrase(:, 1)),1);
        ru = [r, uPhrase];
        ru = sortrows(ru, 1);
        newPhrase = ru(:,2:end);
       
for i = 1:100   
%     r = rand(len, 1); 
    markovModel = makeMarkovPhraseModelFromElementMat(mat);
    elementIPIs = getElementIPIs(markovModel);
    phraseIPIs = getPhraseIPIs(markovModel);
    ele = elementIPIs.allDiffsNormalized;
    phr = phraseIPIs.allDiffsNormalized;
    CVs(i,1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)];
        
        for ii = 1:length(uPhrase)
        inputModel = markovModel;
        inputModel(isnan(inputModel)) = -77;
        f = find(ismember(inputModel, uPhrase(ii, :), 'rows'));
        repmat(newPhrase(ii, :), length(f), 1);
        randomizedPhraseMarkovModel(f,:) = repmat(newPhrase(ii, :), length(f), 1);       
        end
        randomizedPhraseMarkovModel(randomizedPhraseMarkovModel == -77) = NaN;
        %        
        elementIPIs = getElementIPIs(randomizedPhraseMarkovModel);
        phraseIPIs = getPhraseIPIs(randomizedPhraseMarkovModel);
        ele = elementIPIs.allDiffsNormalized;
        phr = phraseIPIs.allDiffsNormalized;
        permuteMarkovCVs(i,1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)];        
       
end
    mnCVs = mean(CVs);
    meanCVsElePhrMarkovModel(j,:) = mnCVs;
    mnPermuteMarkovCVs = mean(permuteMarkovCVs);
    meanCVsElePhrPermuteMarkov(j,:) = mnPermuteMarkovCVs;
    clear randomizedPhraseMarkovModel
end

%% NEXT step: add permute markov models
figure
plot(meanCVsElePhrMarkovModel','o-')
xlim([0 3])
ylim([0 1])
title('markov')
figure
plot(meanCVsElePhrPermuteMarkov','o-')
xlim([0 3])
ylim([0 1])
title('permute')