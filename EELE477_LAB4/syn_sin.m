function [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
%SYN_SIN Function to synthesize a sum of cosine waves
% usage:
% [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
% fk = vector of frequencies
% (these could be negative or positive)
% Xk = vector of complex amplitudes: Amp*eˆ(j*phase)
% fs = the number of samples per second for the time axis
% dur = total time duration of the signal
% tstart = starting time (default is zero, if you make this input optional)
% xx = vector of sinusoidal values
% tt = vector of times, for the time axis
%
% Note: fk and Xk must be the same length.
% Xk(1) corresponds to frequency fk(1),
% Xk(2) corresponds to frequency fk(2), etc.

if length(fk) ~= length(Xk) 
    error('fk and Xk must be the same length');
end
if nargin<5, tstart=0, end

j = 1i;
xx = 0;
tt = tstart:1/fs:dur;

for N = 1:length(fk)
    xx = xx + (Xk(N).*exp(j.*2.*pi.*fk(N).*tt));
end

xx = real(xx);




