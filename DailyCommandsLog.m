% Below is Lucas's code for attempting to understand how CV may change in
% elements vs phrases?
% N is the number of repititions of the model.
N=1000000;
clear cv
% is the different lengths
for K=1:30;
% s is a string of N random whole numbers numbers (1 <= x <= K)
% each number represents a phrase type.
x = round(rand(1,N)*(K-1))+1;
% below is to test my understanding
plot(x(1:30));
pause
hist(x)
pause
% end of my test
for i=1:K,
  isi{i} = diff(find(x==i));
  isi{i} = isi{i}/mean(isi{i});
end
allisi = [isi{:}];
cv(K) = std(allisi)/mean(allisi);
end
plot(cv)