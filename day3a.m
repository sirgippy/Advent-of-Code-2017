function out = day3a(input)

side = ceil(sqrt(input));

if mod(side,2) == 0
    side = side + 1;
end

max_dist = (side-1)/2;

start = (side-2)^2;

steps = input-start;

this_side = mod(steps,side-1);

out = max_dist + abs(this_side - max_dist);