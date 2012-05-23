%%
load 'April_18_2012' 
%%

for mem_size = 1:15
%% MODEL 3:  
% This model uses a memory of the last few elements that were used.
% begin with the 'start' element.
current_element = {'start'};
% s will be used to keep track of the sum of possible transition
% probability values.
s = 0;
% generative holds the same values as the original data.
generative = data2;
% fill genertive with a placeholder
generative(:) = {'end'};
% the four most recent elements are kept in 'memory'
% mem_size = 12;
memory = u(1:mem_size);
% the array is empty to start with.
memory(:) = {''};


for i = 1:254
    % i changes when the current row is filled with elements.
    i
    % sequence number keeps track of the current column number in
    % generative.
    sequence_num = 1;
    % we need to start somewhere.  Start with 'start' on each new i.
    current_element = {'start'};
    % we can fill the row until the next probabalistically determined
    % element is 'end'
    while ~ismember(current_element,{'end'})
        % f gives you the index of the current element within u.
        f = find(ismember(u,current_element));
        
        
        % s will be used to keep track of the sum of possible transition
        % probability values. if r lies between s and s2 then we pick the
        % next element according to 
        s = 0; s2 = 0;
        j=1;
        % roll the dice.
        r = rand(1);
        % j grows until we go through each unique elements.
        while j <= length(u)
            

%             s = s + markov(f,j);
           
            % s2 checks the probability of the next element of u
            s2 = s + markov(f, j);
%             end
            
               
            
            if r >= s & r < s2 & j<26
                if sum(ismember(memory, u(j)))<1 | markov(f,j)==1              
                current_element = u(j);

%                 pause
%                 m = markov;
%                 m(f,j+1)=2;
%                 imagesc(m)
%                 pause
                
                generative(i,sequence_num) = current_element;
                sequence_num = sequence_num+1;
                if ~isequal({'end'},current_element) & ~isequal({'start'},current_element)
                memory(2:mem_size)=memory(1:mem_size-1); memory(1) = current_element
                end
                j = length(u)+1;
                else
                    j = length(u)+1;
                end
            end
            
            j = j+1;
            if j<=26
            s = s + markov(f,j-1);
%             if j<26
            s2 = s + markov(f, j);
            end
            
            
        end
    end
end
            
            

fig1 = figure;
fig2 = figure;
% Data = data2;

Data = generative(:,1:6);
data = Data;
subunits = {};
counter = 0;
for j = 2:length(data(1,:))
    for i = 1:254
        figure(fig1)

            
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
        subplot(2,10,2:5)

        imagesc(same);
        title(['row ', num2str(i),' col ', num2str(j), ' ', this])
        subplot(2,10,1)
        imagesc(sum(same,2))
        ss = sum(same,2); fn1 = find(ss~=0)
        subplot(2,10,11:15)
        hist(diff(fn1),10)
        ylim([0 30])
        xlim([0 25])        
%         title(['row ', num2str(i),' col ', num2str(j), ' ', this])
subplot(2,10,6:9)
ismem = ismember(data2(:,2:7),this);
imagesc(ismem);
subplot(2,10,10)
imagesc(sum(ismem,2))
        ss = sum(ismem,2); fn2 = find(ss~=0)
        subplot(2,10,16:20)
        hist(diff(fn2),10)
        ylim([0 30])
        xlim([0 25])
        [h,p,ks2stat] = kstest2(diff(fn1),diff(fn2))
        figure(fig2);
        A = cdfplot(diff(fn1)); set(A, 'color', 'r');hold on; cdfplot(diff(fn2));hold off
        pause
        end
    end
end
    
end
            