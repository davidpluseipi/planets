function [a, b] = getaxes(orbit, option)
	%
	% GETAXES(planet, option) returns the scalars 'a' and 'b' that 
	%   corresponds to the major and minor axes of the 'orbit'
	%
	%     'orbit' is a string that represents a name of a planet (9 possible):
	%       "jupiter" or "mercury" or "saturn" ...
	%     'option' is an optional argument that (if used) is the string "semi"
	%       that sets the GETAXES return to be semi-major and semi-minor axes
	%
	%   examples:
	%     GETAXES("earth","semi") == 1  (that is one AU)
	%     [a, b] = GETAXES("jupiter");
	%       where 'a' and 'b' are the major and minor axes of jupiter's orbit

    
end
