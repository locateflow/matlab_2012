addpath('ButcherbirdFunctions')
%%
imageButcherbird(BB095_1, 'subsorting')
set(gca, 'clim', [800, 2500])
%%
G = get(gca, 'Children');
CD = get(G, 'CData');
rule = CD(:,1);
figure
imagesc(CD)
playButcherbirdRows(BB095_1, rule)
%%
ylim([1 50])
saveas(gca, 'section1.pdf')
ylim([51 100])
saveas(gca, 'section2.pdf')
ylim([101 150])
saveas(gca, 'section3.pdf')
ylim([151 200])
saveas(gca, 'section4.pdf')
ylim([201 250])
saveas(gca, 'section5.pdf')
ylim([251 300])
saveas(gca, 'section6.pdf')
ylim([301 350])
saveas(gca, 'section7.pdf')
%%
chil = get(gca, 'Children');
cdat = get(chil, 'CData')
empt = [];
doublespace = 1:length(cdat(:,1));
doublespace = doublespace*2-1;
empty(:,doublespace)=cdat;
%%
imagesc(cdat)


