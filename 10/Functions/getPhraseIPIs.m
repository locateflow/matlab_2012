function s = getPhraseIPIs(elementMat)
s = struct;
s.eachDiffs = struct;
s.eachDiffsNormalized = struct;


subMat = elementMat(:,1);
u = unique(subMat);
numPhrases = length(u(~isnan(u)));
allDiffs = [];
allDiffsNormalized = [];

for i = 1:numPhrases   
    selectElements = find(subMat == u(i));
    diffs = diff(selectElements);
    
    allDiffs = [allDiffs; diffs];
    eval(['s.eachDiffs.a', num2str(i), ' = diffs;']);
    
    diffs = diffs/mean(diffs);
    eval(['s.eachDiffsNormalized.a', num2str(i), ' = diffs;']);
    
    allDiffsNormalized = [allDiffsNormalized; diffs];

end
s.allDiffs = allDiffs;
s.allDiffsNormalized = allDiffsNormalized;



