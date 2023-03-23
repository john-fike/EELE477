close all; clc; clear;

fs = 8000;
fi = 200:(1/8000):13000;
t = 1:(1/8000):2.5;
xx = chirp(t,13000,2.5,200)
% soundsc(xx,fs);
spectrogram(xx,512,[],512,8000); 

t = 1:1/8000:1.35;

xx = cos(2*pi*900.*t + 200.*(sin(2*pi*3.*t)));
soundsc(xx,fs);
spectrogram(xx,512,[],512,8000); 