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
xx = key2note(1, 16, 2)*exp((-(log2(440*2.^((16-49)/12))-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,28,2)*exp((-(log2(440*2.^((28-49)/12))-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,36,2)*exp((-(log2(440*2.^((36-49)/12))-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,40,2)*exp((-(log2(440*2.^((40-49)/12))-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,52,2)*exp((-(log2(440*2.^((52-49)/12))-log2(fc)).^2)/(2*variance^2));
xx = xx + key2note(1,64,2)*exp((-(log2(440*2.^((64-49)/12))-log2(fc)).^2)/(2*variance^2));
soundsc(xx)

figure()
spectrogram(xx,2048,[],2048,8000); 
