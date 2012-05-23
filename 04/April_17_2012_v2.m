load '2012/01/2012_01_31/January_31_2012.mat'
%%
data2 = data(1:254,:);
%%
strmatch(data2(8,5),data2(8,5))
%%
data2(:,1)={'start'};
%%
unique(data2);
ismember(data2(1,:),'Q')
%%
data2(ismember(data2,'S1 '))={'S1'};
%%
xout = unique(data2);
xout = xout(6)
data2(ismember(data2,xout))={'F1'};
%%
% I copied and pasted row 6 of data2 to row 7.  Then...
data2(:,7)={'end'};
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
        
        
    
   
%     pause
% %     for j = 1:6
% %         if ~iscellstr(data2(i,j))
% %             data2(i,j)={'end'};
% %         end
% %     end
% end
%%
load 'April_18_2012' data2
%%
save 'April_18_2012' data2
%%
for i = 1:length(data(:,1))
    for j = 1:6
        if j==2
            