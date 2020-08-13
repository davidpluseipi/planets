%% main
%
% variables
% e = earth data
% ma = mars data
% me = mercury data
% v = venus data
% 
%% start clean
clear
close all
home

%% load the data
load('orbits.mat'); % first 3 planets
% contents of orbits.mat is a matrix called 'data'
numPlanets = size(data,2)/2;
% organize the data
me = data(:,1:2); % mercury
v = data(:,3:4); % venus
e = data(:,5:6); % earth

%% plot the orbits and show where the planets are on a specific day
dd = 127; % desired day

figure(1)
hold on
grid on

d = zeros(numPlanets,1); % create a vector to store "right sized" dd's
for i = 1:numPlanets
    
    period = sum(~isnan(data(:,i))); % sum up 1s for each non-nan
    d(i) = dd; % store desired day in the vector d for that planet
    
    while d(i) > period       % while the desired day is > period
        d(i) = d(i) - period; % decrease the desired day by the period
    end                       % now we can get actual values from data
    
    plot(data(:,2*i-1), data(:, 2*i)) % plot the orbit 
                                      % 2i-1 means odd columns
                                      % 2i   means even columns
    plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
    
end

% place a textbox with the desired day on the upper left
annotation('textbox', [0.15 0.85 0.07 0.05],...
    'String',num2str(dd), 'FitBoxToText','off');

%% get parameters for each ellipse (major/minor axes & eccentricity)

for i = [1 3 5]
    period = sum(~isnan(data(:,i)));
    
    [row_of_minor_axis, row_of_major_axis] = helper(period, data(:,i:i+1));
    
    figure(i)
    % minor
    B(1,1) = me(row_of_minor_axis,1);
    B(1,2) = me(row_of_minor_axis,2);
    B(2,1) = me(row_of_minor_axis + period/2,1);
    B(2,2) = me(row_of_minor_axis + period/2,2);
    plot(B(:,1), B(:,2))
    
    % major
    A(1,1) = me(row_of_major_axis,1);
    A(1,2) = me(row_of_major_axis,2);
    A(2,1) = me(row_of_major_axis + period/2,1);
    A(2,2) = me(row_of_major_axis + period/2,2);
    plot(A(:,1), A(:,2))
    
end


%% calculate distances
% get day to calculate distance between 2 planets
% d = sqrt( (y2-y1)^2 + (x2-x1)^2 )
% or
% get time span to calculate distance traveled for 1 planet
% make a for loop to add up all the distances between each of the
% points along the way
%% write test cases