load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
%%
addpath('2012\10\Functions')
addpath('2013\01\2013_01_21\Functions')

birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
for j = 1:length(birdNames)
    mat = eval(cell2mat(birdNames(j)));
    len = length(mat(:, 1));  
    
        inputModel = mat;
        inputModel(isnan(inputModel)) = -77;
        uPhrase = unique(inputModel, 'rows');
%         permutations = perms(1:length(uPhrase(:, 1)));
        permutations = rand(100, length(uPhrase(:, 1)));
for jj = 1:length(permutations(:, 1))
        thisPerm = permutations(jj, :)';
        thisPermU = [thisPerm, uPhrase];
        thisPermU = sortrows(thisPermU, 1);
        newPhrase = thisPermU(:,2:end);
       
for i = 1:100   
%     r = rand(len, 1); 
    markovModel = makeMarkovPhraseModelFromElementMat(mat);
%     elementIPIs = getElementIPIs(markovModel);
%     phraseIPIs = getPhraseIPIs(markovModel);
%     ele = elementIPIs.allDiffsNormalized;
%     phr = phraseIPIs.allDiffsNormalized;
%     CVs(i,1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)];
        
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
%     mnCVs = mean(CVs);
%     meanCVsElePhrMarkovModel(j,:) = mnCVs;
    mnPermuteMarkovCVs = mean(permuteMarkovCVs);
    meanCVsElePhrPermuteMarkov(j,:,jj) = mnPermuteMarkovCVs;
    clear randomizedPhraseMarkovModel
end
end
%%
clear all
load('C:\Users\Eathan\Documents\MATLAB\2013\04\2013_04_04\distributionOfPermutedMarkovs.mat')
load('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_29\CVsElePhrMarkovAndPermute.mat', 'meanCVsElePhrMarkovModel')

%%


% for i = 1:8
figure
subplot(131)
    plot(1:100, sort(squeeze(meanCVsElePhrPermuteMarkov(:, 1, :))'));
    ylim([.3 .9])
    title('Phrase Markov Permutation (Elements)')
    ylabel('CV')
subplot(132)
    plot(meanCVsElePhrMarkovModel', '-o')
    ylim([.3 .9])
    xlim([0 3])
    title('"Chosen" Markov Model')
subplot(133)
    plot(1:100, sort(squeeze(meanCVsElePhrPermuteMarkov(:, 2, :))'));
    ylim([.3 .9])
    title('Phrase Markov Permutation (phrases)')

%     plot(load('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_29\CVsElePhrMarkovAndPermute.mat')

% end
