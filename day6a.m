function steps = day6a(input_file)

file = fopen(input_file);
current = textscan(file,'%d');
current = current{1}';
fclose(file);

steps = 0;
history = [];
n = length(current);

history = zeros(100,16);

while (true)
    [x,ix] = max(current);
    
    current(ix) = 0;
    steps = steps + 1;
    
    for ii=0:x-1
        current(mod(ix+ii,n)+1) = current(mod(ix+ii,n)+1) + 1;
    end
    
    for ii=1:steps-1
        if all(history(ii,:) == current)
            return
        end
    end
    
    if steps > size(history,1)
        history = increase_size(history);
    end
    
    history(steps,:) = current;
end

end

function out = increase_size(in)
    out = zeros(size(in,1)*2,size(in,2));
    out(1:size(in,1),:) = in;
end