function [row_of_minor_axis, row_of_major_axis, planet_2a, planet_2b]...
    = helper(period,planet_data)


for i = 1:period/2
    pointA = planet_data(i,:);
    pointB = planet_data(floor(period/2) + (i-1), :);
    dist(i) = sqrt( (((pointB(2)) - (pointA(2)))^2) + (((pointB(1)) - (pointA(1)))^2) );
end

dist = dist';
planet_2b = min(dist);
row_of_minor_axis = find(dist==planet_2b);
if size(row_of_minor_axis,1) > 1
    row_of_minor_axis = row_of_minor_axis(1);
end

planet_2a = max(dist);
row_of_major_axis = find(dist==planet_2a);
if size(row_of_major_axis,1) > 1
    row_of_major_axis = row_of_major_axis(1);
end

end