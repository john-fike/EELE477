function tone = toneGen(keynum,dur,variance,fc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate a tone that is the sum of 9 octave spaced keys
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tone = key2note(1, 42, dur);
tone = zeros(1,length(tone));

bottomNote = keynum - 12*4;
topNote = keynum + 12*4;


for i = bottomNote:12:topNote
    tone = tone + key2note(1, i, dur);
end
tone = tone.*exp((-(log2(440*2.^((keynum-49)/12))-log2(fc)).^2)/(2*variance^2));
