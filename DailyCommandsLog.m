
%%
% opened June_25_2012_make_markov.m
%%
data2 = A;
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
% markov(25,25:26)=[0,1];
% save 2012\07\2012_07_31\July_31_2012.mat A data2 markov u -append
load 2012\07\2012_07_31\July_31_2012.mat 

%%
current_element = 100;
s = 0;
generative = data2;
generative(:) = 10000;
%%
% Data = data2;

Data = generative;%(:,1:6);
data = Data;
subunits = [];
counter = 0;
for j = 2:length(data(1,:))
    for i = 1:length(data(:,1))

            
        this = Data(i,j);
        i
        j
                % Make sure you haven't already seen this distribution. WTF
                % do I mean by distribution????  aha, I mean distribution
                % of this element!  Don't show me an element's distribution
                % twice!
                % add up the number of times 'this' appears in the "array"
                % called 'subunits'
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
ismem = ismember(data2(:,2:length(data2(1,:))),this);
imagesc(ismem);
subplot(1,10,10)
imagesc(sum(ismem,2))
       
                end
         pause
    end
end
%temp

