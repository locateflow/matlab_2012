 %%
data2 = PowysData;
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
        element_p = numerator/denominator
        % Find which column of the markov matrix represents the jth
        % element.
        markov_col = find(ismember(u,u_next(j)));
        % Row i, column markov_col is the probability that the jth element
        % comes after u(i).
        markov(i,markov_col) = element_p;
        
    end
end
% markov(25,25:26)=[0,1];
save 2012\06\June_25_2012.mat PowysData data2 markov u