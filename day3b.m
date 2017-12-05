function out = day3b(input)

grid = zeros(101,101);

grid(51,51) = 1;
grid(51,52) = 1;

ii=51;
jj=52;

while(true)
    if grid(ii-1,jj) ~= 0 && grid(ii,jj+1) ~= 0
        jj = jj - 1;
    elseif grid(ii+1,jj) ~= 0 && grid(ii,jj+1) ~= 0
        ii = ii - 1;
    elseif grid(ii+1,jj) ~= 0 && grid(ii,jj-1) ~= 0 
        jj = jj + 1;
    elseif grid(ii-1,jj) ~= 0 && grid(ii,jj-1) ~= 0
        ii = ii + 1;
    elseif grid(ii,jj-1) ~= 0
        ii = ii + 1;
    elseif grid(ii-1,jj) ~= 0
        jj = jj - 1;
    elseif grid(ii,jj+1) ~= 0
        ii = ii - 1;
    else
        jj = jj + 1;
    end
    
    grid(ii,jj) = sum(sum(grid((ii-1):(ii+1),(jj-1):(jj+1))));
    
    if grid(ii,jj) > input
        out = grid(ii,jj);
        return
    end
end