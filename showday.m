function showday(planets, day)
	%
	% SHOWDAY(planets, day) displays all of the 'planets' in their orbital
	%   position(s) on for the specific 'day'
	%
	%     'planets' is a single-dimension string array that contains any
	%       of the planets: "mars" and/or "jupiter" and/or ...
	%     'day' is a positive whole number that specifies what day/state 
	%       of all of the planets are positioned
	%
	%   example:
	%     showday(["neptune" "saturn" "pluto"], 1500)
	%
	%   NOTE: you only need to plot the planets' position(s) on that 'day'
order = ["mercury" "venus" "earth" "mars" "jupiter" "saturn" "uranus" "neptune" "pluto"];
index = find
for p = 1:numel(planets)
    yRow = 2*find(planets(p) == order);
    xRow = yRow-1;
    
end
end
