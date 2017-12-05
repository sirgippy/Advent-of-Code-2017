function steps = day5b(input_file)

file = fopen(input_file);
inst = textscan(file,'%d');
inst = inst{1};
fclose(file);

steps = 0;
current_loc = 1;
upper_bound = length(inst);
lower_bound = 1;

while (true)
    next_loc = current_loc + inst(current_loc);
    if inst(current_loc) >= 3
        inst(current_loc) = inst(current_loc) - 1;
    else
        inst(current_loc) = inst(current_loc) + 1;
    end 
    steps = steps + 1;
    
    if next_loc > upper_bound || next_loc < lower_bound
        return
    end
    
    current_loc = next_loc;
end

end

