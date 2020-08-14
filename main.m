%% main
%
%% start clean
clear; close all; home

%% simulated function call inputs
user_input = ["saturn" "pluto"]; % user must use square brackets
dd = 187; % desired day; user must input integer

%% validate user input
theplanets = ["mercury" "venus" "earth" "mars" "jupiter" "saturn"...
    "neptune" "uranus" "pluto"];

input_size = size(user_input);
for i = 1:max(input_size)
   if ~contains(user_input(i), theplanets,'IgnoreCase',true)
       error('Select a planet from this solar system.')
   end
end

if dd < 1  
    error('Desired day must be >= 1')
end

%% load the data
load('orbits.mat'); 
% contents of orbits.mat is a matrix called 'data'
numPlanets = size(data,2)/2; % variable based on what's in orbits.mat
me = data(:,1:2); % mercury
v = data(:,3:4); % venus
e = data(:,5:6); % earth

%% plot the orbits and show where the planets are on a specific day
figure(1)
hold on
grid on

d = zeros(numPlanets,1); % create a vector to store "right sized" dd's
for i = 1:numPlanets
    
    period = sum(~isnan(data(:,i))); % sum up 1s for each non-nan
    d(i) = dd; % store desired day in the vector d for that planet
    
    % size desired day so it fits within the existing dataset
    while d(i) > period       % while the desired day is > period
        d(i) = d(i) - period; % decrease the desired day by the period
    end                       % now we can get actual values from data
    
    % plot the orbit
    plot(data(:,2*i-1), data(:, 2*i)) % 2i-1 means odd columns
                                      % 2i   means even columns
    
    % plot the planets based on user input
    if contains("mercury", user_input, 'IgnoreCase', true) && i == 1
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("venus", user_input, 'IgnoreCase', true) && i == 2
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("earth", user_input, 'IgnoreCase', true) && i == 3
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("mars", user_input, 'IgnoreCase', true) && i == 4
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("jupiter",user_input, 'IgnoreCase', true) && i == 5
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("saturn",user_input, 'IgnoreCase', true) && i == 6
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("uranus",user_input, 'IgnoreCase', true) && i == 7
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("neptune",user_input, 'IgnoreCase', true) && i == 8
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("pluto",user_input, 'IgnoreCase', true) && i == 9
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
    end
end

% place a textbox with the desired day on the upper left
% annotation('textbox', [0.15 0.85 0.07 0.05],...
%     'String',num2str(dd), 'FitBoxToText','off');

%% get parameters for each ellipse (major/minor axes & eccentricity)
params = zeros(9,3);
for i = 1:numPlanets
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
    
end

fprintf('Planet parameters:\n')
fprintf('  major(2a) minor(2b)    eccentricity(e)\n')
disp(params)


%% calculate distances
% get day to calculate distance between 2 planets
% d = sqrt( (y2-y1)^2 + (x2-x1)^2 )
% or
% get time span to calculate distance traveled for 1 planet
% make a for loop to add up all the distances between each of the
% points along the way
%% write test cases

