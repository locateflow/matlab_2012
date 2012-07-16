% looked for ht99 hand sorted in google desktop search, no luck.
% look at the data as sorted by the algorithm.
load 2011/10/10_13_2011 HT99 HT993
%%

imageButcherbird(HT99,'subsorting');title('HT99');set(gca,'clim',[800,2000])
imageButcherbird(HT993,'subsorting');title('HT993');set(gca,'clim',[800,2000])
%%
rearrange_image_rows