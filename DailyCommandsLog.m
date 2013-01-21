load 2011/10/10_13_2011
%%
% check to see if new lumsdaine file is the same.
% it is not!
imageButcherbird(lumsdaine, 'raw')
%%
Lumsdaine2 = getDataFromWav('C:\Users\Eathan\Music\Butcherbird\Lumsdaine2')
%%
load('C:\Users\Eathan\Documents\MATLAB\2013\01\LumsdaineStruct.mat')

imageButcherbird(Lumsdaine2, 'raw')
set(gca, 'clim', [800 2500])
%%
imageButcherbird(Lumsdaine2, 'subsorting')
set(gca, 'clim', [800 2500])
%%
set(gca, 'clim', [800 2500])
%%
imageButcherbird(lumsdaine, 'subsorting')
set(gca, 'clim', [800 2500])


