close all;
clear;

A = 10;
B = 10;
delf = 32;
fc = 2000;
fsamp = 11025;
dur = 1;

[xx, tt] = beat(A, B, fc, delf, fsamp, dur);
figure();
spectrogram(xx,2048,[],2048,fsamp); colormap(1-gray(256));
figure();
spectrogram(xx,16,[],16,fsamp); colormap(1-gray(256));


f1 = 3000;
f2 = -2000;
dur = 3;


[xx,tt] = mychirp( f1, f2, dur, fsamp );
soundsc( xx, fsamp );
NFFT = 128;
f_vec = [-floor(NFFT/2) : ceil(NFFT/2)-1] * fsamp/NFFT;
% spectrogram(xx,hamming(128),64,f_vec,fsamp);
spectrogram(xx,2048,[],2048,fsamp); colormap(1-gray(256));
