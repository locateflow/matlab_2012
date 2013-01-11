% Below is Lucas's code for attempting to understand how CV may change in
% elements vs phrases?
% N is the number of repititions of the model.
N=1000000;
clear cv
% is the different lengths
for K=1:30;
% s is a string of N random whole numbers numbers (1 <= x <= K)
% each number represents a phrase type.
x = ceil(rand(1,N)*(K-1))+1;
% Lucas used round, which I changed to ceil.
% below is to test my understanding
% plot(x(1:30));
% pause
% hist(x, 1:K)
% pause
% end of my test
for i=1:K,
  % each member of isi gives the set of difference values where the index
  % represents the phrase number being tracked.  But since all phrase types
  % are equally likely then the set of isis will be very similar for each
  % phrase number.
  isi{i} = diff(find(x==i));
  % normalize all isis so as to add them together.
  isi{i} = isi{i}/mean(isi{i});  
  
end
% put all the normalized isis together
allisi = [isi{:}];
hist(allisi, 0:.5:20);
xlim([0, 20])
ylim([0, 600000])
pause
% how do the cv values change if you are allowed more phrase types?
cv(K) = std(allisi)/mean(allisi);
end
plot(cv)
%%
% Below is Lucas's code for attempting to understand how CV may change in
% elements vs phrases?
% N is the number of repititions of the model.
N=100000;
clear cv
% is the different lengths
for K=1:5;
% x is a MATRIX of 5 x N random whole numbers numbers (1 <= x <= K)
% each number represents an ELEMENT type.
x = ceil(rand(5,N)*(K-1))+1;
% Lucas used round, which I changed to ceil.
% below is to test my understanding
% plot(x(1:30));
% pause
% hist(x, 1:K)
% pause
% end of my test
for i=1:K,
  % each member of isi gives the set of difference values where the index
  % represents the phrase number being tracked.  But since all phrase types
  % are equally likely then the set of isis will be very similar for each
  % phrase number.
  isi{i} = diff(find(x==i));
  % normalize all isis so as to add them together.
  isi{i} = isi{i}/mean(isi{i});  
  
end
% put all the normalized isis together
allisi = [isi{:}];
hist(allisi, 0:.5:20);
xlim([0, 20])
ylim([0, 600000])
pause
% how do the cv values change if you are allowed more phrase types?
cv(K) = std(allisi)/mean(allisi);
end
plot(cv)

%%
K = 3
N = 10;
clear isi_phr;
X = ceil(rand(N,2)*(K-1))+1;
skips = [];

for j = 1:length(X(:,1))
k=1;
inds = [];
for i = j+1:length(X(:,1))
%     if ~ismember(i, skips) & ~ismember(j, skips)
        if isequal(X(j,:), X(i,:))
            inds = [inds; i]
        end
%     end

end

if length(inds) > 1
        isi_phr{k} = diff(inds)
        % normalize all isis so as to add them together.
        isi_phr{k} = isi_phr{k}/mean(isi_phr{k})
        k = k+1;
end
end