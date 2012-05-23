load '2012/01/2012_01_31/January_31_2012.mat'
%%
data2 = data(1:254,:);
strmatch(data2(8,5),data2(8,5))
%%
data2(:,1)={'start'};
%%
unique(data2);
dismember(data2(1,:),'Q')
%%
for i = 1:length(data2(:,1))
    for j = 1:6
        if ~iscellstr(data2(i,j))
            data2(i,j)={'end'};
        end
    end
end
%%
for i = 1:length(data(:,1))
    for j = 2:5
        if j==2
            