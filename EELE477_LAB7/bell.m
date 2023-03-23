function xx = bell(ff, Io, tau, dur, fsamp)
%BELL produce a bell sound
%
% usage: xx = bell(ff, Io, tau, dur, fsamp)
%
% where: ff = frequency vector (containing fc and fm)
% Io = scale factor for modulation index
% tau = decay parameter for A(t) and I(t)
% dur = duration (in sec.) of the output signal
% fsamp = sampling r

t = 1:1/fsamp:dur;
env = bellenv(tau, dur, fsamp)

xx = env.*cos(2*pi*ff(1).*t + Io.*env.* cos(2*pi*ff(2).*t));
