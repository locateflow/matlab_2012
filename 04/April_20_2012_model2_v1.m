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
    for j = 1:length(u_next)
        u_next(j)
        numerator = sum(ismember(next,u_next(j)))
        denominator = length(next)
        element_p = numerator/denominator
        markov_col = find(ismember(u,u_next(j)));
        markov(i,markov_col) = element_p;
        s
    end
end
markov(25,25:26)=[0,1];
%% MODEL 2
current_element = {'start'};
s = 0;
generative = data2;
generative(:) = {'end'};


for i = 1:254
    % sequence number keeps track of the current column number in
    % generative.
    sequence_num = 1;
    % we need to start somewhere.  Start with 'start' on each new i.
    current_element = {'start'};
    while ~ismember(current_element,{'end'})
        % f gives you the index of the current element within u.
        f = find(ismember(u,current_element));
%         pause
        % roll the dice.
        
        s = 0; s2 = 0;
        j=1;
        r = rand(1);
        while j <= length(u)
            
            s = s + markov(f,j);
            if j<26
            s2 = s + markov(f, j+1);
            end
            
            if r >= s & r < s2
                
                current_element = u(j+1);
                markov(f, j+1) = markov(f, j+1)*0.5;
                mkv = markov(f,:)~=0;
                markov(f,mkv) = markov(f,mkv)/sum(markov(f,mkv));
                 markov(f,mkv);
%                 pause
%                 m = markov;
%                 m(f,j+1)=2;
%                 imagesc(m)
%                 pause
                
                generative(i,sequence_num) = current_element;
                sequence_num = sequence_num+1;
                j = length(u)+1;
            end
            j = j+1;
        end
    end
end
            
            
%%
%%

%%
load 'April_18_2012' 
%%
% save 'April_18_2012' data2
save 'April_18_2012' markov u -append

%%

%%
% Data = data2;

Data = generative(:,1:6);
data = Data;
subunits = {};
counter = 0;
for j = 2:length(data(1,:))
    for i = 1:254

            
        this = Data(i,j);
        i
        j
                % Make sure you haven't already seen this distribution.
                if sum(ismember(subunits, this))<1;
            % Add this element to the list of already seen.
            subunits(counter+1) = this;
            counter = counter+1;
%         others = Data(i+1:end,j);
        same = ismember(Data,this);
        same = same+same;
        same(i,j)=4;
        subplot(1,10,2:5)

        imagesc(same);
        title(['row ', num2str(i),' col ', num2str(j), ' ', this])
        subplot(1,10,1)
        imagesc(sum(same,2))
%         title(['row ', num2str(i),' col ', num2str(j), ' ', this])
subplot(1,10,6:9)
ismem = ismember(data2(:,2:7),this);
imagesc(ismem);
subplot(1,10,10)
imagesc(sum(ismem,2))
        pause
        end
    end
end
    
            