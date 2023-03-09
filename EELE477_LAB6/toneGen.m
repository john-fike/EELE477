function tone = toneGen(keynum,dur)

tone = [key2note(1, 42, noteDur) zeros(1,500)];
tone = zeros(1,length(tone));

bottomNote = keynum - 12*4;
topNote = keynum + 12*4;

for i = bottomNote:12:topNote
    tone = tone + key2note(1, i, noteDur)
end
