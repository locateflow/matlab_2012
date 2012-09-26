function generative = markovModel(markov, elementMat)
data2 = elementMat;
data2(isnan(data2)) = 1000;
data2(:,1) = 100;
u = unique(data2);
% for mem_size = 1:15
mem_size = 1;
% The number '100' signifies the 'start' element.
current_element = 100;
% The generative model is constrained by the size of the original data.
generative = elementMat;
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
            generative(i,sequenc_num)
            current_element
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
generative = [zeros(size(generative(:,1))), generative];