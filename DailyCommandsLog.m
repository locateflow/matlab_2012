load C:\Users\Eathan\Documents\MATLAB\2011\10\10_13_2011.mat HT99

% I also used C:\Users\Eathan\Documents\MATLAB\2012\07\2012_07_13\July_13_2012_change_struct_orig.m
%%
imageButcherbird(structr,'subsorting');title('HT99 new');set(gca,'clim',[800,2000]); 
%%
imageButcherbird(HT99,'subsorting');title('HT99 old');set(gca,'clim',[800,2000]); 
%%
imageButcherbird(structr,'raw');title('HT99');set(gca,'clim',[800,2000]); 
