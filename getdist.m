function dist = getdist(days, planetA, planetB)
	% GETDIST(days, planetA, planetB) returns the average distance from
	%   'planetA' to 'planetB' during all specified 'days'
	%       
	%      'planetA' and 'planetB' are strings that specify which planet
	%        i.e. "pluto" or "mars". If only one string is passed, meaning
	%        only 'planetA' is specified, than the distance is calculated
	%        between 'planetA' and the sun. If 'planetA' is equal to 
	%        'planetB', than the distance 'planetA' travels on its orbit
	%        during 'days' is calculated.
	%        
	%      'days' is a single-dimension array of positive whole number(s)
	%        that specify the day(s) this distance is calculated.

if user_input(1) == user_input(2)
    L = C(i)*day/period;
    fprintf('Length along orbit (AU): %g\n', L);
end

end
