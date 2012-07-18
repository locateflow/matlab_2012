filesFolder = 'Media\Sound\HT99'
% Get the directory list of the input folder.
fileList = dir(filesFolder);
%%
% Skip the nonsense at the beginning.
fileList = fileList(3:end);
% Change the structure to a cell.
fileListCell = struct2cell(fileList);
% Nameslist only contains the wav file names.
namesList = fileListCell(1,:);
% namesList = fliplr(namesList);

%% fields: original, amplitude, frequency.
structr = HT99;
for i = 1:length(namesList)
structr(i).fileLoc = [filesFolder,'\',cell2mat(namesList(i))];
wv = wavread(structr(i).fileLoc);
% Regularize the data so that the vector's range extends from -1 to 1.
wv = wavesc(wv);
structr(i).original = (wv(:,1));
end
%%stru
imageButcherbird(structr,'raw');title('HT99');set(gca,'clim',[800,2000]); ylim([0 50])
%%
imageButcherbird(HT99,'raw');title('HT99');set(gca,'clim',[800,2000]); ylim([0 50])
