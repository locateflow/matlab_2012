
load 2012\07\2012_07_31\July_31_2012.mat
%%

mem_size = 0;
kstat_only = [];
ind = 1;
j=0;
%%

% MODEL 3: This model uses a memory of the last few elements that were
% used. begin with the 'start' element. forLooking = [];

for mem_size = 4:6%0:15
    current_element = 100; % current_element = {'start'};
    
    % s will be used to keep track of the sum of possible transition
    % probability values.
    s = 0;
    % generative holds the same values as the original data.
    generative = data2;
    % fill genertive with a placeholder
    generative(:) = 1000; % generative(:) = {'end'};
    % the four most recent elements are kept in 'memory' mem_size = 12; if
    % mem_size = 0, then memory = ['','']
    memory = u(1:mem_size+3);
    % the array is empty to start with.
    memory(:) = NaN; % memory(:) = {''};
    
    for i = 1:length(data2(:,1));
        % i changes when the current row is filled with elements.
        i
       
        % sequence number keeps track of the current column number in
        % generative.
        sequence_num = 1;
        % we need to start somewhere.  Start with 'start' on each new i.
        current_element = 100; % current_element = {'start'};
        % we can fill the row until the next probabalistically determined
        % element is 'end' aka '1000'
       
        while ~ismember(current_element, 1000) & sequence_num ~= length(data2(1,:))% as long as you haven't reached 'end'=1000
            % f gives you the index of the current element within u.
            f = find(ismember(u, current_element));
            output = u(f)% tells you the current element
            
%              pause
            % 's' will be used to keep track of the sum of possible
            % transition probability values. if r lies between s and s2
            % then we pick the next element according to
            s = 0; s2 = 0;
            j=1;
            % roll the dice.
            r = rand(1)
            % j grows until we go through each unique element, or until we
            % choose an element.
            
            nextChoicesChances = markov(f,:);
            nextChoices = u(find(nextChoicesChances > 0)) 
            choicesLeft = ~ismember(nextChoices, memory);
            
            nextChoicesChances = nextChoicesChances(find(nextChoicesChances > 0))
            nextChoices = nextChoices(choicesLeft);
            if norm(nextChoicesChances(choicesLeft)) ~= 1;
            nextChoicesChances = nextChoicesChances(choicesLeft);
            nextChoicesChances = nextChoicesChances/norm(nextChoicesChances);
            end
            if nextChoicesChances == 1
                generative(i,sequence_num) = nextChoices;
                sequence_num = sequence_num+1;
            else

            
%             while j < length(u) % while j <= length(u)
            while j <= length(nextChoicesChances)

                
                % s2 checks the probability of the next element of u (u
                % contains unique elements) markov(f,j) holds the
                % probability that u(f) will be followed by u(j).
%                 s2 = s + markov(f, j)
                s2 = s + nextChoicesChances(j)
                % if r is between s and s2 then u(j) could be the next
                % element unless....
                if r >= s & r < s2 & j<length(u)+1% why noy j<= without +1?
                    % check if u(j), the currently selected element, is in
                    % the memory. if not continue and current element =
                    % u(j) ...unless it was used too recently. Check to see
                    % if u(j) is in the memory buffer. if not then
                    % continue. Or if the probability of u(f) going to u(j)
                    % is certain then don't stress out, just use u(j).
%                     if sum(ismember(memory(1:mem_size+1), u(j)))<1 | markov(f,j)==1
                    if sum(ismember(memory(1:mem_size+1), nextChoices(j)))<1 | nextChoicesChances(j)==1

                        current_element = nextChoices(j);
                        
                        %                 pause m = markov; m(f,j+1)=2;
                        %                 imagesc(m) pause
                        % put the selected element in the next slot.
                        generative(i,sequence_num) = current_element;
                        % prepare to fill the following slot.
                        sequence_num = sequence_num+1;
                        if sequence_num == length(data2(1,:))
                            generative(i,sequence_num) = 1000;
                        end
                        % if you haven't just drawn an 'end' element or a
                        % 'start' element...
                        if ~isequal(1000,current_element) & ~isequal(100,current_element)
                            % insert a new element into the memory bank and
                            % shift the existing elements within the bank.
                            % if mem_size = 3
                            memory(3:mem_size+3)=memory(2:mem_size+2); memory(2) = current_element;
                        end
                        % if you added the element, then current_element,
                        % tracking which row you are in , increases and you
                        % are ready do decide on what that element should
                        % be.
                        j = length(u)+1;
                    else
                        % I think this happens when you picked an element
                        % that was in the memory buffer already, so try
                        % picking another one?
                        j = length(u)+1;
                    end
                end
                
                j = j+1; % try the next u(j).  So this means we are checking
                % if its worth using elements that have zero probability of
                % being next?  kind of a waste.  fix this?
                if j<=length(u)
                    s = s + markov(f,j-1);
                    %             if j<26
                    s2 = s + markov(f, j);
                end
            end
            end
        end
    end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% now that you have filled the generative modeling for that memory size...
% start and end elements 100, and 1000 should not be in the generative mat.
% Hmm... what happens if you reach the last column and it says there's
% still room for more elements?
    % Make sure the size of the model data matrix is the same size as the
    % original data.
    Data = generative(:,1:length(data2(1,:)));
    data = Data;
    subunits = [];
    counter = 0; 
    for j = 2:length(data(1,:))
        for i = 1:length(data(:,1))
            this = Data(i,j);
            i;
            j;
            % Make sure you haven't already seen how this element is distributed.
            if sum(ismember(subunits, this))<1;
                % Add this element to the list of already seen.
                subunits(counter+1) = this;
                counter = counter+1;
                % 'same' gives you a logical where the 1's show where the
                % element occured.
                same = ismember(Data,this);
                % twos replace the ones.
                same = same+same;
                % show the first occurance of the element a bit darker.
                same(i,j)=4;
                        subplot(2,10,2:5)
                
                        imagesc(same); title(['row ', num2str(i),' col ',...
                        num2str(j), ' ', this]); subplot(2,10,1);
                        imagesc(sum(same,2))
                        
                ss = sum(same,2); fn1 = find(ss~=0);
                        subplot(2,10,11:15) 
                        hist(diff(fn1),10) 
                        ylim([0 30]); xlim([0 25]) 
                        title(['row ', num2str(i),' col', num2str(j), ' ', this])
                       
                subplot(2,10,6:9)
                ismem = ismember(data2,this);
                imagesc(ismem); subplot(2,10,10); imagesc(sum(ismem,2))
                ss = sum(ismem,2); fn2 = find(ss~=0);
                        subplot(2,10,16:20); hist(diff(fn2),10); ylim([0 ...
                        30]); xlim([0 25])
                if(length(fn1)>1)

%                             figure(fig2); A = cdfplot(diff(fn1)); set(A,...
%                             'color', 'r');hold on;
%                             cdfplot(diff(fn2));hold off
                            pause
                end
                %         pause
            end
        end
    end
    mem_size;

end

%%
figure
plot(kstat_only)
% legend('sum h','avg p value','avg k stat');

kstat_only_all(ind, :) = kstat_only';

ind = ind+1;
kstat_only_avg = mean(kstat_only_all);
figure
plot(kstat_only_avg)

xlim([0 17])
set(gca,'xtick', 1:16, 'xtickla', 0:16)
% plot(norm_avg) legend('sum h','avg p value','avg k stat');
title('Average K Statistic v. Memory Size')
ylabel('K Statistic')
xlabel('Memory Size')
% pause
%%
elementsInOrder = data2(data2 ~= 100)';
elementsInOrder = elementsInOrder(elementsInOrder ~= 1000);
d_all = [];
for i = 1:length(u)-2
    d = diff(find(elementsInOrder == u(i)));
    d_all = [d_all, d];
    hist(d,1000);
    title([num2str(u(i)), ' - ', num2str(mean(d))])
    xlim([0 25])
  
    pause
end
%%
    hist(d_all, 10000);
    title([num2str(u(i)), ' - ', num2str(mean(d))])
    xlim([0 100])
%%  
    uniq = unique(d_all);
    u_size = length(uniq);
    N = length(d_all);
    
    for i = 1:u_size
    p_vals(i) = sum(d_all == uniq(i))/N;
    end
%%
plot(uniq,p_vals, '.-');
    
    





