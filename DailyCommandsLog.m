addpath('ButcherbirdFunctions')
BB095_1 = getDataFromWav('C:\Users\Eathan\Music\Butcherbird\095.1');
%%
imageButcherbird(BB095_1, 'subsorting')
set(gca, 'clim', [800, 2500])
%%
saveas(gca, 'C:\Users\Eathan\Documents\MATLAB\2013\06\2013_06_06\BB095_1_sorted.fig')
%%
save('C:\Users\Eathan\Documents\MATLAB\2013\06\2013_06_06\BB095_1struct')
%%
saveas(gca, 'C:\Users\Eathan\Documents\MATLAB\2013\06\2013_06_06\BB095_1_handsorted.fig')
%%
uicontrol('Style', 'popup',...
           'String', 'rearrange|listen',...
           'Position', [20 340 100 50],...
           'Callback', @setmap);
    function setmap(hObj,event) %#ok<INUSD>
        % Called when user activates popup menu 
        val = get(hObj,'Value');
        if val ==1
            colormap(jet)
        elseif val == 2
            colormap(hsv)
        elseif val == 3
            colormap(hot)
        elseif val == 4
            colormap(cool)
        elseif val == 5
            colormap(gray)
        end
    end
