clear;
clc;
close all;

cd ../

%% Planet and Atmosphere options
dz = .5;
zmax = 110;
lat = 0;
long = 0;
venusRadius = 6052;
F=[8.4;200];
SO2base = 75e-6;
CF = pi/180;

alt = linspace(0,zmax,(zmax)/dz+1);

[ atmosphereLow ] = Atmosphere( alt,lat,F,SO2base );
[ atmosphereHigh ] = Atmosphere( alt,60,F,SO2base );

figure;

plot(atmosphereLow.T,alt,'--k',atmosphereHigh.T,alt,'-k');

hXLabel = xlabel('Temperature (K)');
hYLabel = ylabel('Altitude (km)');
%hTitle = title({'Total Absorption';['Temperature = ',num2str(data.temperature),' K      SO2 = ',num2str(SO2_pressure*1000),' mb'];
%    ['Total Pressure = ',num2str(Nonideal_pressure/1000),' bar'];''});
hLegend = legend('Pioneer Venus Sounder Probe','Pioneer Venus North Probe','Location','NorthEast');
saveas(gcf,strcat('./Plots/','alt-temp.eps'),'epsc');

figure;

plot(atmosphereLow.P,alt,'--k',atmosphereHigh.P,alt,'-k');

hXLabel = xlabel('Pressure (bar)');
hYLabel = ylabel('Altitude (km)');
%hTitle = title({'Total Absorption';['Temperature = ',num2str(data.temperature),' K      SO2 = ',num2str(SO2_pressure*1000),' mb'];
%    ['Total Pressure = ',num2str(Nonideal_pressure/1000),' bar'];''});
hLegend = legend('Pioneer Venus Sounder Probe','Pioneer Venus North Probe','Location','NorthEast');
saveas(gcf,strcat('./Plots/','alt-pres.eps'),'epsc');




cd ./Plots