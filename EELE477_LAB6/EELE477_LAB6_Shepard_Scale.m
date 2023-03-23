clc;
clear;
close all; 

noteDur = .5;
% cScale = key2note(1, 42, noteDur);
cScale = zeros(1,1);


ff=2.^(2.78:1/12:13.7814);
fc=340;
variance = 1.7;
Wf = exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));

figure()
semilogx(ff,Wf);



for i = 1:12:97
    cScale = [cScale toneGen(i,.5,variance,fc)];
end


cScale = [cScale cScale cScale];
figure();
plot(cScale)
figure();
spectrogram(cScale,2048,[],2048,8000); 


soundsc(cScale,22050);
figure()
plotspec(cScale,22050);