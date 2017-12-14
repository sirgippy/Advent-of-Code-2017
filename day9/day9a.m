function out = day9a(input_name)

file = fopen(input_name);
input = fgetl(file);
fclose(file);

out = score_group(input,1,0);

end

function [score,finish] = score_group(input,start,base_score)

in_garbage = false;
score = base_score;
finish = NaN;

current_loc = start;
while current_loc <= length(input)
    if in_garbage
        if input(current_loc) == '!'
            current_loc = current_loc + 1;
        elseif input(current_loc) == '>'
            in_garbage = false;
        end
    elseif input(current_loc) == '<'
        in_garbage = true;
    elseif input(current_loc) == '}'
        finish = current_loc;
        return
    elseif input(current_loc) == '{'
        [inner_score,inner_finish] = score_group(input,current_loc+1,base_score+1);
        score = score + inner_score;
        current_loc = inner_finish;
    end
    current_loc = current_loc + 1;
end

end

