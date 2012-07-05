PowysData = cell2mat(PowysData);
%%
PowysData(isnan(PowysData)) = 'end';
%%
u = unique(PowysData);
for i = 1:length(u)
    imagesc(PowysData==u(i))
    title(u(i));
    pause
    imagesc(sum(PowysData==u(i), 2));
    title(u(i));
    pause
    
end
