load C:\Users\Eathan\Documents\MATLAB\2011\10\10_13_2011.mat HT99

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
%% fields: original, amplitude, frequency.
structr = HT99;
for i = 1:length(namesList)
structr(i).fileLoc = [filesFolder,'\',cell2mat(namesList(i))];
wv = wavread(structr(i).fileLoc);
% Regularize the data so that the vector's range extends from -1 to 1.
wv = wavesc(wv);
structr(i).original = (wv(:,1));
end
%%
imageButcherbird(structr,'subsorting');title('HT99 new');set(gca,'clim',[800,2000]); 
imageButcherbird(HT99,'subsorting');title('HT99 old');set(gca,'clim',[800,2000]); 
imageButcherbird(structr,'raw');title('HT99 new');set(gca,'clim',[800,2000]); 
imageButcherbird(HT99,'raw');title('HT99 old');set(gca,'clim',[800,2000]);
%%
% A comes from using "Paste to Workspace" command from Edit menu while
% workspace is active window.  Looking at HT99 data from Markov Matrix
% google spreadsheet.
B = A(~isnan(A));
u = unique(B);
for i = 1:length(u)
    thisElement = A == u(i);
    imagesc(thisElement);
    colormap('bone');
    title(num2str(i));
    pause
end

