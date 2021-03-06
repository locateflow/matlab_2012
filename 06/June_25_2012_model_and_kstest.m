%%
load 2012\06\June_25_2012.mat data2 markov u%%
ind=1;
%%
% I need to reset the size of 'normalized' and 'norm_all' to account for
% zero memory.
normalized = [];
norm_all = [];
kstat_only = [];
ind = 1;
j=0;
%%



norm_avg = normalized;
% MODEL 3: This model uses a memory of the last few elements that were
% used. begin with the 'start' element.
h_p_k2stat_all = [];
% forLooking = [];
for mem_size = 0:15
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
        % element is 'end'
        while ~ismember(current_element, 1000)
            % f gives you the index of the current element within u.
            f = find(ismember(u, current_element));
            u(f)
            
            
            % s will be used to keep track of the sum of possible
            % transition probability values. if r lies between s and s2
            % then we pick the next element according to
            s = 0; s2 = 0;
            j=1;
            % roll the dice.
            r = rand(1);
            % j grows until we go through each unique element.
            while j < length(u) % while j <= length(u)
                
                
                %             s = s + markov(f,j);
                
                % s2 checks the probability of the next element of u (u
                % contains unique elements)
                s2 = s + markov(f, j);
                %             end
                
                
                
                if r >= s & r < s2 & j<length(u)+1
                    % check if u(j), the currently selected element, is in
                    % the memory. if not continue and current element =
                    % u(j)
                    if sum(ismember(memory(1:mem_size+1), u(j)))<1 | markov(f,j)==1
                        current_element = u(j);
                        
                        %                 pause m = markov; m(f,j+1)=2;
                        %                 imagesc(m) pause
                        % put the selected element in the next slot.
                        generative(i,sequence_num) = current_element;
                        % prepare to fill the following slot.
                        sequence_num = sequence_num+1;
                        % if you haven't just drawn an 'end' element or a
                        % 'start' element...
                        if ~isequal(1000,current_element) & ~isequal(100,current_element)
                            % insert a new element into the memory bank and
                            % move the shift the existing elements within
                            % the bank. if mem_size = 3
                            memory(3:mem_size+3)=memory(2:mem_size+2); memory(2) = current_element;
                            
                        end
                        j = length(u)+1;
                    else
                        j = length(u)+1;
                    end
                end
                
                j = j+1;
                if j<=length(u)
                    s = s + markov(f,j-1);
                    %             if j<26
                    s2 = s + markov(f, j);
                end
                
                
            end
        end
    end
    
%%    
    
    % fig1 = figure; fig2 = figure; Data = data2;
    
    Data = generative(:,1:6);
    data = Data;
    subunits = {};
    counter = 0;
    h_p_k2stat = [];
    
    
    for j = 2:length(data(1,:))
        for i = 1:254
            %         figure(fig1)
            
            
            this = Data(i,j);
            i;
            j;
            % Make sure you haven't already seen this distribution.
            if sum(ismember(subunits, this))<1;
                % Add this element to the list of already seen.
                subunits(counter+1) = this;
                counter = counter+1;
                %         others = Data(i+1:end,j);
                same = ismember(Data,this);
                same = same+same;
                same(i,j)=4;
                %         subplot(2,10,2:5)
                
                %         imagesc(same); title(['row ', num2str(i),' col ',
                %         num2str(j), ' ', this]) subplot(2,10,1)
                %         imagesc(sum(same,2))
                ss = sum(same,2); fn1 = find(ss~=0);
                %         subplot(2,10,11:15) hist(diff(fn1),10) ylim([0
                %         30]) xlim([0 25]) title(['row ', num2str(i),' col
                %         ', num2str(j), ' ', this])
                % subplot(2,10,6:9)
                ismem = ismember(data2(:,2:7),this);
                % imagesc(ismem); subplot(2,10,10) imagesc(sum(ismem,2))
                ss = sum(ismem,2); fn2 = find(ss~=0);
                %         subplot(2,10,16:20) hist(diff(fn2),10) ylim([0
                %         30]) xlim([0 25])
                if(length(fn1)>1)
                    [h,p,ks2stat] = kstest2(diff(fn1),diff(fn2));
                    h_p_k2stat = [h_p_k2stat;[h,p,ks2stat]];
                    %         figure(fig2); A = cdfplot(diff(fn1)); set(A,
                    %         'color', 'r');hold on;
                    %         cdfplot(diff(fn2));hold off
                end
                %         pause
            end
        end
    end
    mem_size;
%     h_p_k2stat;
    kstat_only(mem_size + 1, :) = mean(h_p_k2stat(:,3));
%     h_p_k2stat_all(mem_size + 1,:) = [sum(h_p_k2stat(:,1)),mean(h_p_k2stat(:,2)),mean(h_p_k2stat(:,3))];
    % forLooking(mem_size,:) =
    % [(h_p_k2stat(:,1)),(h_p_k2stat(:,2)),(h_p_k2stat(:,3))]
end

% hpk = h_p_k2stat_all;

% I need to keep track of the kstat without normalizing

% 
% normalized(:,1) = (hpk(:,1)-mean(hpk(:,1)))/std(hpk(:,1));
% normalized(:,2) = (hpk(:,2)-mean(hpk(:,2)))/std(hpk(:,2));
% normalized(:,3) = (hpk(:,3)-mean(hpk(:,3)))/std(hpk(:,3));
% normalized(:,3) = hpk(:,3);%(hpk(:,3)-mean(hpk(:,3)))/std(hpk(:,3));
mem_size
%%
figure
plot(kstat_only)
% legend('sum h','avg p value','avg k stat');

kstat_only_all(ind, :) = kstat_only';
% norm_all(:,:,ind) = normalized;
ind = ind+1;
% norm_avg = mean(norm_all,3);
kstat_only_avg = mean(kstat_only_all);
figure
plot(kstat_only_avg)

xlim([0 17])
set(gca,'xtick', 1:16, 'xtickla', 0:16)
% plot(norm_avg)
% legend('sum h','avg p value','avg k stat');
title('Average K Statistic v. Memory Size')
ylabel('K Statistic')
xlabel('Memory Size')
% pause
save '2012\05\2012_06_26\June_26_2012'
%%
load '2012\05\2012_06_26\June_26_2012'
%%
% save '2012\05\May_03_2012'
%%
load '2012\05\May_03_2012';% norm_all
%%
    r = ceil(20*rand(100000000,16));
%     r = kstat_only_all(
    for i = 1:16;
        kso = kstat_only_all(:,i);
        bootstrapped(:,i) = kso(r(:,i));
    end
    plot(mean(bootstrapped))
