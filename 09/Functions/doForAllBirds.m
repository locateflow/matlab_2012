function [varargout]= doForAllBirds(functionName, nameExtension);
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
varargout = {};
allElementFreqs = [];
for i = 1:length(birdNames)
    varargout(i) = 
    allElementFreqs = [allElementFreqs; findElementDistributionPatternHelper1(eval(cell2mat(birdNames(i))),birdNames(i))]
end

% 
% eval([birdNames(i), nameExtension, ' =  