function out = day4a(input_file)

file = fopen(input_file);

out = 0;

while (true)
    line = fgetl(file);
    if line == -1
        fclose(file);
        return
    end
    
    list = textscan(line,'%s');
    list = list{1};
    
    ix = false(length(list),1);
    
    for jj=1:length(list)-1
        ix(jj) = any(strcmp(list{jj},list(jj+1:end)));
    end
    
    if ~any(ix)
        out = out + 1;
    end
    
end

end

