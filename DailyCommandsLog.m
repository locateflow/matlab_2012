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
%%
load('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_29\allData.mat')
% save('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_29\CVsElePhrMarkovAndPermute.mat')

%% REVIEW PROCEDURE FROM LAST MEETING, AND MAKE SOME CHANGES TO INSERT NEW DATA.

%%
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS = zeros(5, 8);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES = zeros(5, 8);
% markov data:
load('C:\Users\Eathan\Documents\MATLAB\2013\02\shuffledMarkovEtc.mat', 'allBirdsCVElementPhrase')
%%
% shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(3,:) = allBirdsCVElementPhrase.phraseMarkov(1,:);
% shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(3,:) = allBirdsCVElementPhrase.phraseMarkov(2,:);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(3,:) = meanCVsElePhrMarkovModel(:,1)';
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(3,:) = meanCVsElePhrMarkovModel(:,2)';
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(4,:) = meanCVsElePhrPermuteMarkov(:,1)';
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(4,:) = meanCVsElePhrPermuteMarkov(:,2)';

%%
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'BaylissShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'BeasleyShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'HT77ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'LumsdaineShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'PowysShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'Johnson1ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'Lumsdaine2ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'HT99ShuffledOrigCVs')
%%
% birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson2', 'Lumsdaine2'};
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],1) = BaylissShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],2) = BeasleyShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],3) = HT77ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],4) = HT99ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],5) = LumsdaineShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],6) = PowysShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],7) = Johnson1ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([1,5],8) = Lumsdaine2ShuffledOrigCVs(:, 1);
%%
% shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS = shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([2,2,3,4], :);
%%
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],1) = BaylissShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],2) = BeasleyShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],3) = HT77ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],4) = HT99ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],5) = LumsdaineShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],6) = PowysShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],7) = Johnson1ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES([1,5],8) = Lumsdaine2ShuffledOrigCVs(:, 2);
%% Run March_20_2013.m to get reinsert data
%save('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_20\todaysDataWithReinsertRepeat.mat')
load('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_20\todaysDataWithReinsertRepeat.mat')

shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,1) = BaylissShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,2) = BeasleyShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,3) = HT77ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,4) = HT99ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,5) = LumsdaineShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,6) = PowysShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,7) = Johnson1ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,8) = Lumsdaine2ShuffledOrigCVs(1, 1);
%%
% shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS = shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS([2,2,3,4], :);
%%
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,1) = BaylissShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,2) = BeasleyShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,3) = HT77ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,4) = HT99ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,5) = LumsdaineShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,6) = PowysShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,7) = Johnson1ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,8) = Lumsdaine2ShuffledOrigCVs(1, 2);
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson2', 'Lumsdaine2'};
figure
plot(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS, '-o')
title('elements CV')
xlim([0, 6])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Permute Markov', 'Original'})
legend(birdNames)
figure
plot(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES, '-o')
title('phrases CV')
xlim([0, 6])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Permute Markov', 'Original'})
legend(birdNames)
%%
euclidianDistancesElements = bsxfun(@minus, shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(1:4,:),...
                             repmat(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(5,:), 4, 1))
euclidianDistancesElements = euclidianDistancesElements.^2;
                         
euclidianDistancesPhrases = bsxfun(@minus, shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(1:4,:),...
                             repmat(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(5,:), 4, 1))
euclidianDistancesPhrases = euclidianDistancesPhrases.^2;
%%
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson2', 'Lumsdaine2'};
figure
plot(euclidianDistancesElements.^.5, '-o')
title('elements EUCLID DIST FROM ORIG')
xlim([0, 5])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Permute Markov'})
legend(birdNames)
set(gca, 'xtick', 0:5)
figure
plot(euclidianDistancesPhrases.^.5, '-o')
title('phrases EUCLID DIST FROM ORIG')
xlim([0, 5])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Permute Markov'})
legend(birdNames)
set(gca, 'xtick', 0:5)
%%
[h, p] = ttest(euclidianDistancesElements(2,:).^.5, euclidianDistancesElements(3,:).^.5)
[h, p] = ttest(euclidianDistancesPhrases(2,:).^.5, euclidianDistancesPhrases(3,:).^.5)
%%
[h, p] = ttest(euclidianDistancesElements(4,:).^.5, euclidianDistancesElements(3,:).^.5)
[h, p] = ttest(euclidianDistancesPhrases(4,:).^.5, euclidianDistancesPhrases(3.,:).^.5)
%%
[h, p] = ttest(euclidianDistancesElements(4,:), euclidianDistancesElements(3,:))
[h, p] = ttest(euclidianDistancesPhrases(4,:), euclidianDistancesPhrases(3.,:))
%%
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(1,:))
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(1,:))
%%    
%%
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(2,:))
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(2,:))
    
%%
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(3,:))
[h, p] = ttest(shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(5,:), shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(3,:))
%%
figure
plot([shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(5,:); shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_ELEMENTS(3,:)],'o-')
title('elements Markov v Orig')
xlim([0 3])
figure

plot([shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(5,:); shuffled_AvoidRep_PhraseMarkov_PermuteMarkov_Orig_PHRASES(3,:)],'o-')
xlim([0 3])
title('phrases Markov v Orig')