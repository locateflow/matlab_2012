load 2012\07\2012_07_31\July_31_2012.mat
%%
%%
for mem_size = 1:15
% The number '100' signifies the 'start' element.
current_element = 100;
% The generative model is constrained by the size of the original data.
generative = data2;
% The number '1000' signifies the 'end' element.
generative(:) = 1000;
memory = u(1:mem_size);
memory(:) = NaN;

memory(:) = NaN;
current_element = 100;
for i = 1:length(data2(:,1))
    current_element = 100;
    i
    sequence_num = 1;
    current_element
    while ~ismember(current_element, 1000) & sequence_num ~= length(data2(1,:))
        f = find(ismember(u, current_element));
        current_element_check = u(f)
        
        
        nextChoicesChancesAll = markov(f,:);
        nonZeroProbs = find(nextChoicesChancesAll > 0 )
        nextChoicesAll = u(nonZeroProbs)
        nextChoicesChancesAll = nextChoicesChancesAll(nonZeroProbs)

        choicesLeft = ~ismember(nextChoicesAll, memory)
        r = rand(1);
        if sum(choicesLeft) == 0
            memory(:) = NaN;
            cumsum(nextChoicesChancesAll)
            choiceIndex = find(r <= cumsum(nextChoicesChancesAll));
            current_element = nextChoicesAll(choiceIndex);
            generative(i,sequence_num) = current_element;
            sequence_num = sequence_num+1;
                        if ~isequal(1000, nextChoices(choiceIndex)) & ~isequal(100,nextChoices(choiceIndex))
                            memory(1:mem_size-1)=memory(2:mem_size); memory(1) = current_element;
                        end
        else
        nextChoices = nextChoicesAll(choicesLeft)
        nextChoicesChances = nextChoicesChancesAll(choicesLeft)
        nextChoicesChances = nextChoicesChances/sum(nextChoicesChances)
        choiceIndex = min(find(r <= cumsum(nextChoicesChances)))
        current_element = nextChoices(choiceIndex)
        generative(i,sequence_num) = current_element;
        sequence_num = sequence_num+1;
                        if ~isequal(1000, nextChoices(choiceIndex)) & ~isequal(100,nextChoices(choiceIndex))
                            memory(1:mem_size-1)=memory(2:mem_size); memory(1) = current_element;
                        end
        end
        
    end
end
figure('windowst','docked');
generative(generative == 1000) = -1;
generative(generative == 100) = -1;
imagesc(generative)
title(['memory size = ', num2str(mem_size)])
pause
end

%%
% Use this to make a markov matrix:
% opened June_25_2012_make_markov.m
%%
data2 = Beasley;
data2(isnan(data2)) = 1000;
data2(:,1) = 100;
u = unique(data2);
markov = zeros(length(u));
%%
for i = 1:length(u)
    % Choose the ith element of u;

    u(i)
    transpose = data2';
    % Find which slots this element occupies within the performance.
    element_indices = ismember(transpose,u(i));
    f = find(element_indices==1);
    % Get the dimensions of the matrix.
    [height, width] = size(data2);
    % Make special considerations for the final element.
    if(max(f)== height * width)
        f(end) = height * width - 1;
    end
    % Next holds all of the elements following u(i).
    next = transpose(f+1)
    % There may be one or several of them, and they may be used multiple times.
    u_next = unique(next)
    % Go through each unique element.
    for j = 1:length(u_next)
        % Choose the jth element.
        u_next(j)
        % How of the jth element follow the u(i)?
        numerator = sum(ismember(next,u_next(j)))
        % How many times is u(i) used?
        denominator = length(next)
        % 'element_p' is the probability that the jth element follows u(i).
        element_p = numerator/denominator;
        % Find which column of the markov matrix represents the jth
        % element.
        markov_col = find(ismember(u,u_next(j)));
        % Row i, column markov_col is the probability that the jth element
        % comes after u(i).
        markov(i,markov_col) = element_p;
        
    end
end
%%
save 2012\09\2012_09_17\September_19_2012.mat
%%

            
            
            
           