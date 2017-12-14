function out = day7b(input_name)

process_list = ProcessList();

file = fopen(input_name);
line = fgetl(file);

while (line ~= -1)
    arrow = strfind(line,'->');
    if isempty(arrow)
        out = textscan(line,'%s (%d)');
        process_name = out{1}{1};
        weight = out{2};
        process_list.addInformation(process_name,weight);
    else
        left = textscan(line(1:arrow-1),'%s (%d)');
        process_name = left{1}{1};
        weight = left{2};
        right = textscan(line(arrow+2:end),'%s','delimiter',',');
        child_names = right{1};
        process_list.addInformation(process_name,weight,child_names);
    end
    line = fgetl(file);
end

fclose(file);

out = process_list.getAdjustedWeight();

end
