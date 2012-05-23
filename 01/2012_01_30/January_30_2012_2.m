data = {};
for i = 1:255
    for j = 2:length(Data(1,:))
        if ~isempty(cell2mat(Data(i,j)))
            data = {data;cell2mat(Data(i,j))};
            %data(i,j) = cell2mat(Data(i,j));
        else
            
        end
    end
end
%%
for i = 1:255
    
Col_1(i) = cell2mat(Data(i,2));
Col_2(i) = cell2mat(Data(i,3));
Col_3(i) = cell2mat(Data(i,4));
Col_4(i) = cell2mat(Data(i,5));
Col_5(i) = cell2mat(Data(i,6));
end

cols = Col_1, Col_2
%%
data = Data;
subunits = {};
counter = 0;
for j = 2:length(data(1,:))
    for i = 1:255

            
        this = Data(i,j);
        i
        j
                if sum(ismember(subunits, this))<1;
            subunits(counter+1) = this;
            counter = counter+1;
        others = Data(i+1:end,j);
        same = strcmp(Data,this);
        same = same+same;
        same(i,j)=4;
       
        imagesc(same);
        title(['row ', num2str(i),' col ', num2str(j), ' ', this])
        pause
        end
    end
end
    