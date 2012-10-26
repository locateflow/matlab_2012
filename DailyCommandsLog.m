load('C:\Users\Eathan\Documents\MATLAB\2012\09\PhraseBasedElementMarkovModelForAllSixBirds.mat')
load('C:\Users\Eathan\Documents\MATLAB\2012\09\ElmentStructureForAllSixBirds.mat')
%%
% Do find and "replace all" for all six birds...
PowysElementIPIs = getElementIPIs(Powys);
PowysPhraselModelElementIPIs = getElementIPIs(PowysPhraseBasedElementModel);
%%
save 2012\09\ElementIPIsAllSixBirds
%%
% Do find and "replace all" for all six birds...
LumsdaineIPIs.elements.original = LumsdaineElementIPIs;
LumsdaineIPIs.elements.phraseMarkovModel = LumsdainePhraselModelElementIPIs;
LumsdaineIPIs.phrases.original = LumsdainePhraseIPIs;
LumsdaineIPIs.phrases.phraseMarkovModel = LumsdainePhraselModelPhraseIPIs;
%%
save 2012\09\allIPIsAllSixBirds
%%
% Do find and "replace all" for all six birds...
thisStruct = BaylissIPIs;
birdName = 'Bayliss';
figure
subplot(4,1,1:2)
a = thisStruct.elements.original.allDiffsNormalized;
b = thisStruct.elements.phraseMarkovModel.allDiffsNormalized;
[h,p,k] = kstest2(a, b);
t = ['h = ', num2str(h), char(10), 'p = ', num2str(p), char(10), 'k = ', num2str(k)];

hist(a);
title([birdName, char(10) ' IPI distribution (elements, original data)'])
axisLim = get(gca, 'xlim');
set(gca, 'xtick', []);

text(max(xlim)*0.5, max(ylim)*0.8, t)
subplot(4,1,3:4)
hist(b);
title([birdName, char(10) ' IPI distribution (elements, phrase markov)'])

set(gca, 'xlim', axisLim);
saveas(gcf, ['C:\Users\Eathan\Documents\MATLAB\2012\10\Figures\kstests\', birdName, 'OrigVsPhraseMarkov_elements.pdf']) 


