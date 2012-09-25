function freqs = findElementDistributionPatternHelper1(elementMat, stringIn)
% elementMat = eval(stringIn);


% % Assign the matrix you want to analyze.
% elementMat = Powys;

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
freqs = TABLE1(:,3);
