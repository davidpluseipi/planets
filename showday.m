function showday(varargin)
%     showday(["neptune" "saturn" "pluto"], 895)
numPlanets = 9;

%% validate user input
if nargin ~= 2
    error('this function requires 2 input arguments')
end


theplanets = ["mercury" "venus" "earth" "mars" "jupiter" "saturn"...
    "neptune" "uranus" "pluto"];

input_size = size(varargin{1});
for i = 1:max(input_size)
   if ~contains(varargin{1}(i), theplanets,'IgnoreCase',true)
       error('Select a planet from this solar system.')
   end
end

if varargin{2} < 1  
    error('Desired day must be >= 1')
end

user_input = varargin{1};
day = varargin{2};

%% load data
data = helper2_load();

%% plot the orbits and show where the planets are on a specific day
figure(1)
hold on
grid on

d = zeros(numPlanets,1); % create a vector to store "right sized" dd's
for i = 1:numPlanets
    period = sum(~isnan(data(:,i))); % sum up 1s for each non-nan
    d(i) = day; % store desired day in the vector d for that planet
    while d(i) > period       % while the desired day is > period
        d(i) = d(i) - period; % decrease the desired day by the period
    end                       % now we can get actual values from data
    plot(data(:,2*i-1), data(:, 2*i)) % plot the orbit
                                      % 2i-1 means odd columns
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
        
    elseif contains("jupiter", user_input, 'IgnoreCase', true) && i == 5
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("saturn", user_input, 'IgnoreCase', true) && i == 6
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("uranus", user_input, 'IgnoreCase', true) && i == 7
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("neptune", user_input, 'IgnoreCase', true) && i == 8
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
        
    elseif contains("pluto", user_input, 'IgnoreCase', true) && i == 9
        plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*') % plot the planet
    end
end

end

% EOF