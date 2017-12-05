input = xlsread('day2input.xlsx');

total = 0;

for ii=1:size(input,1)
    for jj=1:length(input(ii,:))
        ix = find(mod(input(ii,:),input(ii,jj)) == 0 & 1:length(input(ii,:)) ~= jj);
        if ~isempty(ix)
            total = total + input(ii,ix)/input(ii,jj);
        end
    end
end

total