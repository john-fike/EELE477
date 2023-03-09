clc;
clear;
close all; 

noteDur = .5;
cScale = key2note(1, 42, noteDur);
cScale = zeros(1,length(cScale));


ff=2.^(5.78:1/12:10.7814);
fc=440;
variance = .5;
Wf = exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));

% figure()
% semilogx(ff,Wf);
% figure()
% plot(Wf);


for i = 1:12:97
    cScale = [cScale toneGen(i,.5) zeros(1,10)];
end


cScale = [cScale cScale cScale cScale cScale];
figure();
plot(cScale)
figure();
spectrogram(cScale,2048,[],2048,8000); 


soundsc(cScale);
