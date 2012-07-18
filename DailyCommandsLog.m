wav = wavread('Media\HT99_small_sample.wav');
%%
load C:\Users\Eathan\Documents\MATLAB\2011\10\10_13_2011.mat HT99
structr = HT99;
%%
amp = structr(1).consolidated.ampAligned;
freq = structr(1).consolidated.freqAligned;
combo = zeros(size(amp));
%%
% Go through the file and see where certain amp/freq combos recur.
for i = 1:length(amp(1,:))
    for j = 1:length(amp(:,1))
        fq = freq(i,j);
f = (abs(amp - amp(i,j)) < .1 & abs(freq - fq) < 10);

imagesc(f);
colormap('bone')

title([i, ' ', j])
pause
    end
    
end
%%
am = reshape(amp, 1, 161*2500);
fre = reshape(freq, 1, 161*2500);

scatter(am, fre, '.');



