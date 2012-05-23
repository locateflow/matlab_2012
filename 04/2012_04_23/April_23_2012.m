s=w(1:40000);
% s = (w(1:2:end));
%%
[ifdgram,sonogram]=ifdv(s,44100,1024,1020,10,1,10,10,100);
% [ifdgram,sonogram]=ifdv(s,44100/2,1024/2,1020/2,5,1,10,10,100);

colormap(hot)

lg = log(ifdgram+3);
% imagesc(lg(4500:5000,:));
imagesc(lg);

% function [ifdgram,sonogram]=ifdv(s,SAMPLING,N,OVERLAP,sigma,ZOOMT,ZOOMF,TL,FL)
