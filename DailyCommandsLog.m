shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS = zeros(4, 8);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES = zeros(4, 8);
% markov data:
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\shuffledMarkovEtc.mat', 'allBirdsCVElementPhrase')
%%
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(3,:) = allBirdsCVElementPhrase.phraseMarkov(1,:);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(3,:) = allBirdsCVElementPhrase.phraseMarkov(2,:);
%%
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'BaylissShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'BeasleyShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'HT77ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'LumsdaineShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'PowysShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'Johnson1ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'Lumsdaine2ShuffledOrigCVs')
load('C:\Users\Eathan\Documents\MATLAB\2012\2013\02\2013_02_13\shuffledCVcompareOrig.mat', 'HT99ShuffledOrigCVs')
%%
% birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson2', 'Lumsdaine2'};
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],1) = BaylissShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],2) = BeasleyShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],3) = HT77ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],4) = HT99ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],5) = LumsdaineShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],6) = PowysShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],7) = Johnson1ShuffledOrigCVs(:, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([1,4],8) = Lumsdaine2ShuffledOrigCVs(:, 1);
%%
% shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS = shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([2,2,3,4], :);
%%
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],1) = BaylissShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],2) = BeasleyShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],3) = HT77ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],4) = HT99ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],5) = LumsdaineShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],6) = PowysShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],7) = Johnson1ShuffledOrigCVs(:, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES([1,4],8) = Lumsdaine2ShuffledOrigCVs(:, 2);
%% Run March_20_2013.m to get reinsert data
%save('C:\Users\Eathan\Documents\MATLAB\2013\03\2013_03_20\todaysDataWithReinsertRepeat.mat')
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,1) = BaylissShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,2) = BeasleyShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,3) = HT77ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,4) = HT99ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,5) = LumsdaineShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,6) = PowysShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,7) = Johnson1ShuffledOrigCVs(1, 1);
shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS(2,8) = Lumsdaine2ShuffledOrigCVs(1, 1);
%%
% shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS = shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS([2,2,3,4], :);
%%
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,1) = BaylissShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,2) = BeasleyShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,3) = HT77ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,4) = HT99ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,5) = LumsdaineShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,6) = PowysShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,7) = Johnson1ShuffledOrigCVs(1, 2);
shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES(2,8) = Lumsdaine2ShuffledOrigCVs(1, 2);
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson2', 'Lumsdaine2'};

plot(shuffled_AvoidRep_PhraseMarkov_Orig_ELEMENTS, '-o')
title('elements CV')
xlim([0, 5])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Original'})
legend(birdNames)
figure
plot(shuffled_AvoidRep_PhraseMarkov_Orig_PHRASES, '-o')
title('phrases CV')
xlim([0, 5])
set(gca, 'xticklabel', {'', 'Suffled', 'Avoid Repeat', 'Markov', 'Original'})
legend(birdNames)
%%






