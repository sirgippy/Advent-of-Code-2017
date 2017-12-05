function out = day4b(input_file)

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
    
    for ii=1:length(list)-1
        for jj=ii+1:length(list)
            ix(ii) = ix(ii) | is_anagram(list{ii},list{jj});
        end
    end
    
    if ~any(ix)
        out = out + 1;
    end
    
end

end

function tf = is_anagram(s1,s2)
    
tf = false;
if length(s1) ~= length(s2)
    return
end

for ii=1:length(s1)
    ix = find(s1(ii) == s2,1);
    if isempty(ix)
        return
    else
        s2 = s2([1:(ix-1),(ix+1):end]);
    end
end

tf = true;

end