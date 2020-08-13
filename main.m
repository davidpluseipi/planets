%% main

%% start clean
clear
close all
home

%% load the data
load('orbits.mat'); % first 3 planets
% contents of orbits.mat is a matrix called 'data'

% organize the data

% mercury
mx = data(:,1);
my = data(:,2);

m = data(:,1:2);

% venus
vx = data(:,3);
vy = data(:,4);

v = data(:,3:4);

% earth
ex = data(:,5);
ey = data(:,6);

e = data(:,5:6);

%% plot the data (planets)

% % mercury
% figure(1)
% plot(mx,my)
% grid on
% title('mercury');
% 
% % venus
% figure(2)
% plot(vx,vy)
% grid on
% title('venus');
% 
% % earth
% figure(3)
% plot(ex,ey)
% grid on
% title('earth')

% loop the inner planets
m_period = sum(~isnan(m(:,1)));
iterations = floor(length(e)/m_period);
extra = rem(length(e),m_period);
append_this = m(1:m_period, :);
m2 = zeros(size(e));
for i = 1:iterations
    m2 = [ m(1:i*m_period, :); append_this];
end
m2 = [m; m(1:extra,:)];
clear m
m = m2;

%% show where the planets are or will be

% dd = input('Enter day to show (integer): '); % desired day
dd = 127

%% single plot
figure(12)
hold on
grid on
d = zeros(9,1);
for i = 1:3
    period = sum(~isnan(data(:,i)));
    d(i) = dd;
    while d(i) > period
        d(i) = d(i) - period;
    end
    plot(data(:,2*i-1), data(:, 2*i))
    plot(data(d(i),2*i-1), data(d(i), 2*i), 'm*')
end
% % venus
% plot(vx,vy)
% plot(v(dd,1), v(dd,2), 'm*')
% 
% % earth
% plot(ex,ey)
% plot(e(dd,1), e(dd,2), 'm*')

annotation('textbox', [0.15 0.85 0.07 0.05],...
    'String',num2str(dd), 'FitBoxToText','off');

%% get parameters for each ellipse (major and minor axes, and eccentricity)

for i = [1 3 5]
    period = sum(~isnan(data(:,i)));
    
    [row_of_minor_axis, row_of_major_axis] = helper(period, data(:,i:i+1));
    
    figure(i)
    %minor
    B(1,1) = m(row_of_minor_axis,1);
    B(1,2) = m(row_of_minor_axis,2);
    B(2,1) = m(row_of_minor_axis + period/2,1);
    B(2,2) = m(row_of_minor_axis + period/2,2);
    plot(B(:,1), B(:,2))
    
    %major
    A(1,1) = m(row_of_major_axis,1);
    A(1,2) = m(row_of_major_axis,2);
    A(2,1) = m(row_of_minor_axis + period/2,1);
    A(2,2) = m(row_of_minor_axis + period/2,2);
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