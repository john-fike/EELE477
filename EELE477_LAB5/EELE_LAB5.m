close all; 
clear;
clc;

load('bach_fugue.mat');
% load('bach_fugue_short.mat');

bpm = 240;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 4;
fs = 11025;


voiceEndTime = (theVoices(1).startPulses(length(theVoices(1).startPulses)) ... 
+ theVoices(1).durations(length(theVoices(1).durations))) * seconds_per_pulse;              %End time in seconds

%holds value of every sample generated by key2note
% voiceEndTime*fs*2 --> take end time in seconds and convert to number of
% samples, then double to make sure nothing goes out of bounds (might
% happen becuase of rounding or if first voice is shorter than the other
% voices
xx = zeros(1,ceil(voiceEndTime*fs*2));

%calculate number of voices in theVoices
sizeVoices = size(theVoices);
numVoices = sizeVoices(2);

%go thru every voice in theVoices and create a sinusoid of the song
for j = 1 : numVoices
    for i = 1:length(theVoices(j).noteNumbers)
        startSample = floor(theVoices(j).startPulses(i) * seconds_per_pulse * fs);      %start index in xx 
        sampleLength    = (theVoices(j).durations(i) * seconds_per_pulse * fs) + 1;               %length of note in samples
        endSample   = ceil(startSample + sampleLength);                                          %end time = start index + length
        key       = theVoices(j).noteNumbers(i);
   
%         create note using key2note
        tone = key2note(1,key,sampleLength/fs);
        toneLength = length(tone);
         
%         create envelope 
        A = linspace(0, 0.8, ceil(toneLength*.30));     %attack (35% of signal)
        D = linspace(0.8, 0.5,ceil(toneLength*0.05));    %delay (5% of signal)
        S = linspace(0.5, 0.4,ceil(toneLength*0.40));    %sustain of (40% of note)
        R = linspace(0.4, 0,ceil(toneLength*0.20));      %release  (25% of note)
        ADSR = [A D S R] ;
        
%         apply envelope to note
        tone(1 : length(ADSR)) = tone(1 : length(ADSR)) .* ADSR;
        
%         add tone to final song signal 
        xx(startSample:endSample-1) = xx(startSample:endSample-1) + tone;    
    end
end
soundsc(xx);

