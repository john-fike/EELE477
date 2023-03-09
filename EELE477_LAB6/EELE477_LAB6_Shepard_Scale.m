clc;
clear;

noteDur = .5
cScale = [key2note(1, 42, noteDur) zeros(1,500)];
cScale = zeros(1,length(cScale))
note = 49;
bottomNote = note - 12*4;
topNote = note + 12*4;


%     cScale = cScale + [key2note(1, 49, 2) zeros(1,500)];
%     cScale = cScale + key2note(1, 55, 2);


for i = 1:12:97
    cScale = cScale + [key2note(1, i, noteDur) zeros(1,500)];
end

for i = 1:8
    cScale = [cScale cScale];
end


soundsc(cScale);
