input = xlsread('day2input.xlsx');

total = 0;

for ii=1:size(input,1)
    total = total + max(input(ii,:)) - min(input(ii,:));
end

total