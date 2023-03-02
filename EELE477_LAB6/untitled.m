close all; 
clear;
clc;


ff=2.^(5.78:1/12:10.7814);
fc=440;
variance = .5;
Wf = exp( (-(log2(ff)-log2(fc)).^2) / (2*variance^2) );

figure()
semilogx(ff,Wf);
figure()
plot(Wf);




