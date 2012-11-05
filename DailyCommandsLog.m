Fs = 44100;
% t = 0:1/Fs:.3;
% x=cos(2*pi*t*200)+randn(size(t));
x = Bayliss(3).original
% Hs=spectrum.periodogram;
Hs=spectrum.eigenvector;

psd(Hs,x,'Fs',Fs)

%%
% Bayliss 1 (kHz) highest peak, second highest
% 1.38, 1.713
% 2 - 1.414, 2.21
% 3) 1.351, 1.55