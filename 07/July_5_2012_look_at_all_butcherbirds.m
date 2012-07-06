load 2011/10/10_13_2011
%%
imageButcherbird(HT77,'subsorting');title('HT77');set(gca,'clim',[800,2000])
imageButcherbird(HT99,'subsorting');title('HT99');set(gca,'clim',[800,2000])
imageButcherbird(bayliss,'subsorting');title('bayliss');set(gca,'clim',[800,2000])
imageButcherbird(beasley,'subsorting');title('beasley');set(gca,'clim',[800,2000])
imageButcherbird(lumsdaine,'subsorting');title('lumsdaine');set(gca,'clim',[800,2000])
%%
rearrange_image_rows
%% for Beasley...hand sorted
set(gca,'clim',[800,1800])
set(gca,'clim',[1100,1800])

%%
A = HT77(1).consolidated.freq;
[r, c] = size(A);
A = reshape(A, r*c, 1);
figure
hist(A(A>0),1000)
ylim([800, 2000])
%%
A = HT99(1).consolidated.freq;
[r, c] = size(A);
A = reshape(A, r*c, 1);
figure
hist(A(A>0),1000)
%%
A = beasley(1).consolidated.freq;
[r, c] = size(A);
A = reshape(A, r*c, 1);
figure
hist(A(A>0),1000)
%%
A = bayliss(1).consolidated.freq;
[r, c] = size(A);
A = reshape(A, r*c, 1);
figure
hist(A(A>0),1000)
%%
A = lumsdaine(1).consolidated.freq;
[r, c] = size(A);
A = reshape(A, r*c, 1);
figure
hist(A(A>0),1000)
% problems with the data being displayed this way since it is heavily
% modified.
%%
struct = HT77;
orig = struct(1).original;

p.minf0 = 800;			% Hz - minimum frequency
p.maxf0 = 3000;			% Hz - maximum frequency
p.hop = 44;             % samples - interval between estimates
p.sr=44100;				% sampling rate

yn = yin(orig, p);

s.Hz = yn.Hz;
s.amp = sqrt(yn.pwr);
