Data{185} = 21;
%%
for i = 1:255
    
phraseNumRow(i) = cell2mat(Data(i));
end
%%
[c, lags] = xcorr(phraseNumRow, phraseNumRow);
%%
imagesc(phraseNumRow);
% Looks cool!
%%
phrase1 = find(phraseNumRow==1);
set = [2:6];
notPhrase1 = find(ismember(phraseNumRow, set)==1);
%%
plot(phrase1(2:end), diff(phrase1));
hold on
plot(notPhrase1(2:end), diff(notPhrase1),'r');
%%
plot(phrase1(2:end), (10-diff(phrase1))./10);
hold on
plot(notPhrase1(2:end), (10-diff(notPhrase1))./10,'r');
%%
plot(diff(phrase_type_is_1));
%%
span = 24
phrase1 = phraseNumRow==1;
notPhrase1 = ismember(phraseNumRow,set);
for i = 1:length(phrase1)-span-1
    freqPhrase1(i) = sum(phrase1(i:i+span));
end
for i = 1:length(notPhrase1)-span-1
    freqOthers(i) = sum(notPhrase1(i:i+span));
end
figure
plot(freqPhrase1)
hold on
plot(freqOthers, 'r')

legend('Phrase type 1', 'Phrase type 2-6')
ylabel('Frequency (occurences in 25 phrases')
xlabel('Phrase number (chronological order)')
title('Frequency of 6 song types biginning with F1 subtype as performance progresses.')
%%
figure
scatter(freqPhrase1-mean(freqPhrase1)+.5*randn(1,245),...
    freqOthers-mean(freqOthers)+.5*randn(1,245), '.')
axis square

xlabel(['Type 1 (mean ', num2str(mean(freqPhrase1)),')'])
ylabel(['Type 2-6 (mean ', num2str(mean(freqOthers)),')'])
title('Change in frequency (per 25, relative to mean) of different phrase types sharing F1.')

