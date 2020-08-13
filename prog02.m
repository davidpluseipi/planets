orbits = readmatrix('orbits.csv');
mercuryx = orbits(1,1:88);
mercuryy = orbits(2,1:88);
venusx = orbits(3,1:225);
venusy = orbits(4,1:225);
earthx = orbits(6,1:365);
earthy = orbits(6,1:365);
marsx = orbits(8,1:687);
marsy = orbits(8,1:687);
jupiterx = orbits(10,1:4380);
jupitery = orbits(10,1:4380);
saturnx = orbits(11,1:10593);
saturny = orbits(12,1:10593);
uranusx = orbits(13,1:30668);
uranusy = orbits(14,1:30668);
neptunex = orbits(16,1:59862);
neptuney = orbits(16,1:59862);
plutox = orbits(17,:);
plutoy = orbits(18,:);
scatter(0,0,'d')
hold on
scatter(mercuryx,mercuryy,'.')
hold on 
scatter(venusx,venusy,'.')
hold on
scatter(earthx,earthy,'.')
hold on
scatter(marsx,marsy,'.')
hold on
scatter(jupiterx,jupitery,'.')
hold on
scatter(saturnx,saturny,'.')
hold on
scatter(uranusx,uranusy,'.')
hold on
scatter(neptunex,neptuney,'.')
hold on
scatter(plutox,plutoy,'.')
hold off
