clc; clear; close all;

% bellenv(tau, dur, fsamp)
fc = 750
fm = 350
ff = [fc fm]
Io = 500
tau = 30
dur = 20
fs = 11025

t = 1:1/fs:dur

xx = bell(ff, Io, tau, dur, fs)
soundsc(xx,fs)
figure();
spectrogram(xx,512,[],512,8000); 
figure(); 
subplot(211); hold on;
plot(t,xx); title('x(t)'); xlabel('Time (s)'); ylabel('Amplitude');
hold off;
subplot(212); hold on;
plot(instfreq(xx,fs));  title('x(t)'); xlabel('Time Sample'); ylabel('Frequency');
hold off;
