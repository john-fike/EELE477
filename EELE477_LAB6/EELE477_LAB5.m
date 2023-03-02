close all; 
clear;
clc;


ff=2.^(5.78:1/12:10.7814);
fc=440;
variance = .5;
Wf = exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));

figure()
semilogx(ff,Wf);
figure()
plot(Wf);



% xx = key2note (X, keynum, dur)
xx = key2note(1, 16, 2)*exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,28,2);
xx = xx + key2note(1,36,2);
xx = xx + key2note(1,40,2);
xx = xx + key2note(1,52,2);
xx = xx + key2note(1,64,2);
soundsc(xx)

figure()
spectrogram(xx,2048,[],2048,8000); colormap(1-gray(256));
