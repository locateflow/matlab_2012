diffScores = zeros(6,1);
birdNames = {'Bayliss', 'Beasley', 'HT77', 'HT99', 'Lumsdaine', 'Powys'};
for i = 1:length(birdNames)
figure
% birdName = 'Beasley';
birdName = (cell2mat(birdNames(i)))
subplot(211)
data1 = eval([birdName, 'IPIs.elements.original.allDiffsNormalized;'])
m1 = mode(data1)
% sum(BeasleyIPIs.elements.original.allDiffsNormalized==m1)
hist(data1, 0:0.5:5)
title([birdName, char(10), 'element IPI distribution'])

subplot(212)
data2 = eval([birdName, 'IPIs.phrases.original.allDiffsNormalized;'])
m2 = mode(data2)
% sum(BeasleyIPIs.phrases.original.allDiffsNormalized==m2)
hist(data2, 0:0.5:5)
d = m1-m2;
title(['phrase IPI distribution ', 'm1 - m2 = ', num2str(d)])
diffScores(i) = d;
end
%%
MeanDiff = sum(diffScores)/6
SS = sum((MeanDiff - diffScores).^2);
s = (SS/5)^.5;
t = MeanDiff/(s/(6^.5))
[h, p] = ttest(diffScores, 0, .05, 'right')

% for medians, the p value is .0479
% for medians, fail to reject.  the p value is 0.6741
