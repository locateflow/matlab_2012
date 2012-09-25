load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%

% Assign the matrix you want to analyze.
elementMat = Powys;

% Get an idea of the total number of elements.
allElementCount = sum(~isnan(elementMat));
% Get a list of all the elements used, including repetitions.
arrayFromMat = elementMat(:,2:end);
arrayFromMat = arrayFromMat(~isnan(arrayFromMat));
% Find the frequency of each element.
[M F] = mode(arrayFromMat);
% Pick the one used closest to 5 percent of the time.
TABLE1 = tabulate(arrayFromMat);
hist(TABLE1(:,3))
%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
allElementFreqs = [];
for i = 1:length(birdNames)
    allElementFreqs = [allElementFreqs; findElementDistributionPatternHelper1(eval(cell2mat(birdNames(i))),birdNames(i))]
end

%%
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
for i = 1:length(birdNames)
    findElementDistributionPatternHelper2(eval(cell2mat(birdNames(i))))
    pause
end

%%
viewElementDistributions(Powys,'Powys (Original Data)')
%%
viewElementDistributions(Bayliss,'Bayliss (Original Data)')
%%
viewElementDistributions(Beasley,'Beasley (Original Data)')
%%
viewElementDistributions(HT77,'HT77 (Original Data)')
%%
viewElementDistributions(HT99,'HT99 (Original Data)')
%%
viewElementDistributions(Lumsdaine,'Lumsdaine (Original Data)')




       
    





