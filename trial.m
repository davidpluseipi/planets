orbits = readmatrix('orbits.csv');

xvals = [(orbits(1,1:90520));(orbits(3,1:90520));(orbits(5,1:90520));(orbits(7,1:90520));(orbits(9,1:90520));(orbits(11,1:90520));(orbits(13,1:90520));(orbits(15,1:90520));(orbits(17,1:90520))];
yvals = [(orbits(2,1:90520));(orbits(4,1:90520));(orbits(6,1:90520));(orbits(8,1:90520));(orbits(10,1:90520));(orbits(12,1:90520));(orbits(14,1:90520));(orbits(16,1:90520));(orbits(18,1:90520))];
t = plot(xvals,yvals);
disp(t);