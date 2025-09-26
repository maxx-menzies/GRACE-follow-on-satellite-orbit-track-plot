%% ASEN 1320 Aerospace Computing Final Project Part B
%Maxx Menzies
%Main.m
close all;
clear;
clc;

%% Function Calls

%ReadGFO_Orbit call
[t_dy,r1, v1] = ReadGFO_Orbit('GNV1B_2024-02-22_C_04.txt');
[~,r2, v2] = ReadGFO_Orbit('GNV1B_2024-02-22_D_04.txt');

%GFO_Range call
Rho = GFO_Range(r1,r2);

%GFO_RangeRate call
Rho_dot = GFO_RangeRate(r1,r2,v1,v2);

%GFO_NumDiff call
dt = 1; %time interval in seconds
[Rho_dot_diff,Rho_dot_ND] = GFO_NumDiff(dt,Rho,Rho_dot);

%SatVisibility call
rG = [1130714.219, -4831369.903, 3994085.962];
[el,index_vis] = SatVisibility(rG,r1);

%writeGFO_CSV call
fileName = 'GFO_file.csv';
writeGFO_CSV(fileName, t_dy, Rho, Rho_dot);

%% Problem 7 A

%Get the time since the start in hours
t_hr = (t_dy - t_dy(1)) * 365.25 * 24;

%Subplots
figure;

%Rho plot
subplot(3,1,1);
grid on;
plot(t_hr, Rho./1000, 'b');
xlabel('time [hours in 22 Feb. 2024]');
ylabel('range [km]');

%Rho_dot plot
subplot(3,1,2);
grid on;
plot(t_hr, Rho_dot, 'b');
xlabel('time [hours in 22 Feb. 2024]');
ylabel('rate-range [m/s]');

%el plot
subplot(3,1,3);
grid on;
hold on;
plot(t_hr, el, 'b', 'LineWidth', 1);
plot(t_hr(index_vis), el(index_vis), '.r', 'MarkerSize', 0.75);
xlabel('time [hours in 22 Feb. 2024]');
ylabel('elevation angle [deg]');
hold off;

%% Problem 7 B

%Convert to Curvilinear coordinates
Lat_Long_Alt = ecef2lla(r1);

%Exctract lat and lon 
Latitude = Lat_Long_Alt(:,1);
Longitude = Lat_Long_Alt(:,2);

%Station Location
SLR_latitude = 39.0;
SLR_longitude = -76.9;

%Indicies above 10 degrees
Latitude_vis = Latitude(index_vis);
Longitude_vis = Longitude(index_vis);

%plot onto earth
figure;
geoplot(Latitude, Longitude, '-b');
hold on;
geoplot(Latitude_vis, Longitude_vis, '.r');
geoplot(SLR_latitude, SLR_longitude, '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 7);
geobasemap topographic;
hold off;