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
%%
% Use April_17_2012_v2.m

data2 = A; 
save '2012/07/2012_07_31/July_31_2012' 

%%

%%
u = unique(data2);
markov = zeros(length(u));
%%
for i = 1:length(u)
    u(i)
    transpose = data2';
    element_indices = ismember(transpose,u(i));
    f = find(element_indices==1);
    if(max(f)==1778)
        f(f==1778)=1777;
    end
    next = transpose(f+1)
    u_next = unique(next)
    for j = length(u_next)
        element_p = sum(ismember(next,u_next(j)))/length(next);
        markov_col = find(ismember(u,u_next(j)));
        markov(i,markov_col) = element_p;
    end
end

%%
% opened June_25_2012_make_markov.m


