function August_2_2011_Butcherbird(extract,list)

string = 1:1000;
% fileLocation = 'C:\sap\sounds\HT77_2Split\JustStart\'
% fileLocation = 'C:\sap\sounds\Baylo\'
% fileLocation = 'C:\sap\sounds\Beasley09\'
fileLocation = 'C:\sap\sounds\Baylis_9_7_2011\splits\Songs'
% fileLocation = 'C:\sap\sounds\HT99Split\SongsOnly\'
% fileLocation = 'C:\sap\sounds\LumsdaineGrouped\Grouped\'

% fileList = dir(fileLocation);
% fileList = fileList(3:end);
fileList = list;
flippedExtract = extract(:,1);

        

n = get(gca,'Children');
set(n,'ButtonDownFcn', @playHandel);

 set(gcf,'WindowButtonUpFcn',    '',...
         'WindowButtonMotionFcn',      ''     );

    function playHandel(varargin)
        
        pt1 = round(get(gca, 'CurrentPoint'));
        pt1 = pt1(3)
        y = sin(pt1*string/10);
        
        fileNum = flippedExtract(pt1)
%        fileNum = pt1;
%         soundsc(y)

% sound( wavread([fileLocation,fileList(fileNum).name]),44100);
sound( wavread([fileLocation,fileList{fileNum}]),22050);

% 'C:\sap\sounds\HT99Split\SongsOnly\'
% C:\sap\sounds\HT77_2Split\JustStart\'
    end

end

        


