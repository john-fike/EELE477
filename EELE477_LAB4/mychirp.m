function [xx,tt] = mychirp( f1, f2, dur, fsamp )
%MYCHIRP generate a linear-FM chirp signal
%
% usage: xx = mychirp( f1, f2, dur, fsamp )
%
% f1 = starting frequency
% f2 = ending frequency
% dur = total time duration
% fsamp = sampling frequency (OPTIONAL: default is 11025)
% xx = (vector of) samples of the chirp signal
% tt = vector of time instants for t=0 to t=dur
%
if( nargin < 4 ) %-- Allow optional input argument
    fsamp = 11025;
end
u = (f2-f1)/(2*dur);
tt = 0 : 1/fsamp : dur;
psi = 2*pi*((u.*tt.*tt) + (f1.*tt));
xx = real( 7.7*exp(j*psi) );
