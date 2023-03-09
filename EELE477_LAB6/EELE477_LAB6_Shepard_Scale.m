clc;
clear;
close all; 

noteDur = .5;
cScale = [key2note(1, 42, noteDur) zeros(1,500)];
cScale = zeros(1,length(cScale));
note = 40;
bottomNote = note - 12*4;
topNote = note + 12*4;


ff=2.^(5.78:1/12:10.7814);
fc=440;
variance = .5;
Wf = exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));

figure()
semilogx(ff,Wf);
figure()
plot(Wf);


% for i = 1:12:97
%     cScale = [cScale key2note(1, i, noteDur) zeros(1,500)];
%     freq = key2note(1, i, noteDur)
% end
% 
% cScale = [cScale cScale cScale cScale];
% figure();
% spectrogram(cScale,2048,[],2048,8000); 




soundsc(cScale);
