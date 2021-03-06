function [output] = getParams(varargin)
% table = getParams("mars")
% returns the same table of data regardless of planet you put in
%% validate user input
if nargin > 1
   error('Too many input arguments')
end

if nargin >= 1
    orbit = varargin{1};
end

theplanets = ["mercury" "venus" "earth" "mars" "jupiter" "saturn"...
    "neptune" "uranus" "pluto"];

if ~contains(orbit, theplanets,'IgnoreCase',true)
    error('Select a planet from this solar system.')
end



%% load data
data = helper2_load();

%% get parameters for each ellipse (major/minor axes & eccentricity)
params = zeros(9,4);

for i = 1:numel(theplanets)
        
    period = sum(~isnan(data(:,2*i-1)));
    
    [row_b, row_a, params(i,1), params(i,2)] = helper(period,...
        data(:,2*i-1:2*i));
    
    % minor
    B(1,1) = data(row_b,2*i-1); % x-value of the 1st point
    B(1,2) = data(row_b,2*i); % y-value of the 2nd point
    B(2,1) = data(row_b + floor(period/2),2*i-1);
    B(2,2) = data(row_b + floor(period/2),2*i);
    plot(B(:,1), B(:,2))
    
    % major
    A(1,1) = data(row_a,2*i-1);
    A(1,2) = data(row_a,2*i);
    A(2,1) = data(row_a + floor(period/2),2*i-1);
    A(2,2) = data(row_a + floor(period/2),2*i);
    plot(A(:,1), A(:,2))
    
    a = params(i,1)/2;
    b = params(i,2)/2;
    params(i,3) = 2*pi * sqrt( (a^2 + b^2)/2 ); % circumference
    params(i,4) = data(row_a,2*i-1); % x coord of end of major axis point 1
    params(i,5) = data(row_a,2*i); % y coord of end of major axis point 1
    params(i,6) = sqrt( 1 - b^2/a^2 ); % eccentricity
    params(i,7) = data(row_a + floor(period/2), 2*i-1); % x coord of end of major axis point 2
    params(i,8) = data(row_a + floor(period/2), 2*i); % y coord of end of major axis point 2
    
end

varNames = {'2a' '2b' 'C' 'x1' 'y1' 'e' 'x2' 'y2'};
rowNames = theplanets;
T = table(params(:,1), params(:,2), params(:,3), params(:,4),...
    params(:,5), params(:,6), params(:,7), params(:,8),...
    'VariableNames', varNames,...
    'RowNames', rowNames);
output = T;

end
