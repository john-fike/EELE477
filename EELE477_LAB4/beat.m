function [xx, tt] = beat(A, B, fc, delf, fsamp, dur)
%BEAT compute samples of the sum of two cosine waves
% usage:
% [xx, tt] = beat(A, B, fc, delf, fsamp, dur)
%
% A = amplitude of lower frequency cosine
% B = amplitude of higher frequency cosine
% fc = center frequency
% delf = frequency difference
% fsamp = sampling rate
% dur = total time duration in seconds
% xx = output vector of samples
%--Second Output:
% tt = time vector corresponding to xx
% tt = 0:1/(fsamp):dur;


Xk = [A B];
fk = [(fc-delf) (fc+delf)];
[xx,tt] = syn_sin(fk, Xk, fsamp, dur, 0);

xx = A.*cos(2*pi*(fc-delf).*tt) + B.*cos(2*pi*(fc+delf).*tt);