function out = day9b(input_name)

file = fopen(input_name);
input = fgetl(file);
fclose(file);

garbage_count = 0;

in_garbage = false;

current_loc = 1;
while current_loc <= length(input)
    if in_garbage
        if input(current_loc) == '!'
            current_loc = current_loc + 1;
        elseif input(current_loc) == '>'
            in_garbage = false;
        else
            garbage_count = garbage_count + 1;
        end
    elseif input(current_loc) == '<'
        in_garbage = true;
    end
    current_loc = current_loc + 1;
end

out = garbage_count;

end

