% copied commands log from apr 4 2013 to work on adding another
% butcherbird's data
load('C:\Users\Eathan\Documents\MATLAB\2013\01\2013_01_21\ElementStructureAllBirds_8.mat')
%%
addpath('2012\10\Functions')
addpath('2013\01\2013_01_21\Functions')

% birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2'};
birdNames = {'BB095'};

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

%%
% opened handsorted_in-process_newFunctions2 from 2013_06_17
open('C:\Users\Eathan\Documents\MATLAB\2013\06\2013_06_17\handsorted_in-process_newFunctions2.fig')
%%
figChildren = get(gca, 'Children')
%%
cData = get(figChildren, 'cdata');
sortedOrder = cData(:,1);
sortedOrder(:,2) = 1:length(sortedOrder);
% this was copied and pasted into the spreadsheet of sorted data, then it
% was sorted based on the column the cdata was pasted into.
%save('C:\Users\Eathan\Documents\MATLAB\2013\07\tempVars')
%% after running multiple models (apx 25 min.)
% save('C:\Users\Eathan\Documents\MATLAB\2013\07\tempVars2')
% load('C:\Users\Eathan\Documents\MATLAB\2013\07\tempVars2')
save('C:\Users\Eathan\Documents\MATLAB\2013\07\BBO95_finalSpreadsheetData')

%%
        elementIPIs = getElementIPIs(BB095);
        phraseIPIs = getPhraseIPIs(BB095);
        ele = elementIPIs.allDiffsNormalized;
        phr = phraseIPIs.allDiffsNormalized;
        permuteMarkovCVs(101,1:2) = [std(ele)/mean(ele), std(phr)/mean(phr)]; 
        
    mnPermuteMarkovCVs = [std(ele)/mean(ele), std(phr)/mean(phr)];
    meanCVsElePhrPermuteMarkov(1,:,101) = mnPermuteMarkovCVs;
%%
    figure
    sorted = sort(squeeze(meanCVsElePhrPermuteMarkov(:, 1, :))');
    plot(1:101, sorted);
    hold on
    Y = meanCVsElePhrPermuteMarkov(:, 1, 101);
    X = find(sorted==Y);
    scatter(X, Y, 'o', 'linewidth', 5)
    ylim([.3 .9])
    title('Phrase Markov Permutation (Elements)')
    ylabel('CV')
    %%
meanCVsElePhrPermuteMarkov(:,:,101) = meanCVsElePhrMarkovModel;
sorted = sort(squeeze(meanCVsElePhrPermuteMarkov(:, 1, :))');
[a, b] = sort(squeeze(meanCVsElePhrPermuteMarkov(:, 1, :))');
X = find(b==101)-[0:101:707];
Y = meanCVsElePhrPermuteMarkov(:, 1, 101);
%%
    clf
    plot(1:101, sort(squeeze(meanCVsElePhrPermuteMarkov(:, 1, :))'));
    ylim([.3 .9])
    title('Phrase Markov Permutation (Elements)')
    ylabel('CV')
    hold on
    scatter(X,Y, 40)
    xlim([0 102])
%%
meanCVsElePhrPermuteMarkov_(9, :, :) = meanCVsElePhrPermuteMarkov;
    %% do after adding 9th bird

sorted = sort(squeeze(meanCVsElePhrPermuteMarkov_(:, 1, :))');
[a, b] = sort(squeeze(meanCVsElePhrPermuteMarkov_(:, 1, :))');
X = find(b==101)-[0:101:808]';
Y = meanCVsElePhrPermuteMarkov_(:, 1, 101);
%%
    clf
    plot(1:101, sort(squeeze(meanCVsElePhrPermuteMarkov_(:, 1, :))'));
    ylim([.3 .9])
    title('Phrase Markov Permutation (Elements)')
    ylabel('CV')
    hold on
     scatter(X,Y, 60, 'ok')
     gscatter(X,Y, [1:9], 'bgrcmyk', '.')
    xlim([0 102])
   %%
    save('C:\Users\Eathan\Documents\MATLAB\2013\09\combinedDataWithFinished#9')
    %%
    birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys', 'Johnson1', 'Lumsdaine2', 'BB095'};
legend(birdNames)
%%
meanSorted = mean(sorted)
figure('windowst', 'do')
scatter(meanSorted, Y' - meanSorted)
title('9/10 of subjects exhibit a CV below average CV.  The distance below average increases as average CV increases.')
xlabel('Average CV if Subject"s permuted Markov matrices')
ylabel('Subject"s CV')
%%
p = polyfit(meanSorted, Y' - meanSorted, 1)
yfit = polyval(p, meanSorted);
hold on
plot(meanSorted, yfit)
%%
yresid = (Y' - meanSorted) - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(Y)-1) * var(Y' - meanSorted);
rsq = 1 - SSresid/SStotal;
% rsq = 0.7203
% with df n-2=7, critical value for p < 0.05 is 0.666
%%
figure('windowst', 'do');
scatter(meanSorted, X)
title('As average CV for permuted models increases, the chosen model"s percentile rank decreases')
xlabel('Average CV if Subject"s permuted Markov matrices')
ylabel('Percentile rank of subject"s CV among distribution of CVs for permuted markov models')

p = polyfit(meanSorted, X', 1)
yfit = polyval(p, meanSorted);
hold on
plot(meanSorted, yfit)
yresid = X' - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(X)-1) * var(X);
rsq = 1 - SSresid/SStotal;
% rsq = 0.668,
% with df n-2 - 7, critical value for p < .05 = 0.666

% does this show up on my computer?

   
