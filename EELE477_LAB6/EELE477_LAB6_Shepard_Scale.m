clc;
clear;

cScale = key2note(1, 42, 2);
cScale = zeros(1,length(cScale))
note = 49;
bottomNote = note - 12*4;
topNote = note + 12*4;

for i = 1:12:97
    cScale = cScale + key2note(1, i, 2);
    cScale = [cScale zeros(1,500)];
end

% for i = 1:8
%     cScale = [cScale cScale];
% end


soundsc(cScale);
