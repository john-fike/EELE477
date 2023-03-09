function tone = toneGen(keynum,dur)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate a tone that is the sum of 9 octave spaced keys
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tone = key2note(1, 42, dur);
tone = zeros(1,length(tone));

bottomNote = keynum - 12*4;
topNote = keynum + 12*4;

ff=2.^(5.78:1/12:10.7814);
fc=440;
variance = .5;
Wf = exp((-(log2(ff)-log2(fc)).^2)/(2*variance^2));

for i = bottomNote:12:topNote
    tone = tone + key2note(1, i, dur)
end
% tone = tone.*exp((-(log2(440*2.^((keynum-49)/12))-log2(fc)).^2)/(2*variance^2))
