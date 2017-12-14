function out = day8a(input_name)

register_list = RegisterList();

file = fopen(input_name);
line = fgetl(file);

while (line ~= -1)
    register_list.process_next_line(line);
    line = fgetl(file);
end

fclose(file);

out = register_list.get_max_value();

end
