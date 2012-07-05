struct = HT77;
all = [];
for i = 1:length(struct)
orig = struct(i).original;
p.minf0 = 800;			% Hz - minimum frequency
p.maxf0 = 3000;			% Hz - maximum frequency
p.hop = 44;             % samples - interval between estimates
p.sr=44100;				% sampling rate

yn = yin(orig, p);

s.Hz = yn.Hz;
s.amp = sqrt(yn.pwr);
s = s.Hz(s.Hz>800);
% hist(s.Hz(s.Hz>800),1000)
all = [all, s];
end