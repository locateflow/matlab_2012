% loaded C:\Users\Eathan\Documents\MATLAB\2012\09\ElementStructureForAllSixBirds.mat
load('C:\Users\Eathan\Documents\MATLAB\2012\04\April_18_2012.mat')
%%
intermediateA = data2(:,1);
intermediateB = data2(:, 2:end);
sz = size(intermediateB)
Bayliss = zeros(sz);
for i = 1:length(u)
    Bayliss(ismember(intermediateB, u(i))) = i;
end
%%
s2n = cell2mat(intermediateA);
for i = 1:length(intermediateA)
    intermediateA(i) = str2num(intermediateA(i));
end
%%
Bayliss(Bayliss == 25) = NaN;
% copying and pasting data from google sheet
%%
Bayliss = [Bayliss(:,end), Bayliss(:,1:end-1)];
