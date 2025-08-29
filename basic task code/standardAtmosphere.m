function [temperature, pressure, density] = standardAtmosphere(altitude,varargin)
%% standardAtmosphere  Standard atmospheric profile model
%
% [TEMPERATURE, PRESSURE, DENSITY] = standardAtmosphere(ALTITUDE) outputs 
% vectors TEMPERATURE, PRESSURE, and DENSITY of dry air at the corresponding 
% altitude(s) specified in m in the input vector ALTITUDE. Output values 
% are in K, Pa, and kg/m^3.
% 
% [TEMPERATURE, PRESSURE, DENSITY] = standardAtmosphere(ALTITUDE,MOLAR_MASS)
% computes the density using a non-default MOLAR_MASS for a different gas.
% 
% This function implements the ISO 2533-1975 standard and uses values
% obtained from R. Stull, "Meteorology for Scientists & Engineers", 3rd 
% Edition, University of British Columbia. ISBN 978-0-88865-178-5.
% 
% Alan Hunter & Jack Saunders, University of Bath, Oct 2023.


%% Constants

ideal_gas_constant = 8.3145; % J/mol/K
molar_mass = 28.965e-3; % Default: use molar mass of dry air, kg/mol

% Option to use molar mass of a different gas
if length(varargin) > 0
    molar_mass = varargin{1};
end


%% Look-up table

% Altitude, m
y = [
-1
0
1
2
3
4
5
6
7
8
9
10
11
13
15
17
20
25
30
32
35
40
45
47
50
51
60
70
71
80
84.9
89.7
100.4
105
110] * 1e3;

% Temperature, K
T = [
21.5
15.0
8.5
2.0
-4.5
-11.0
-17.5
-24.0
-30.5
-37.0
-43.5
-50.0
-56.5
-56.5
-56.5
-56.5
-56.5
-51.5
-46.5
-44.5
-36.1
-22.1
-8.1
-2.5
-2.5
-2.5
-27.7
-55.7
-58.5
-76.5
-86.3
-86.3
-73.6
-55.5
-9.2] + 273.15;

% Pressure, kPa
P = [
113.920
101.325
89.874
79.495
70.108
61.640
54.019
47.181
41.060
35.599
30.742
26.436
22.632
16.510
12.044
8.787
5.475
2.511
1.172
0.868
0.559
0.278
0.143
0.111
0.076
0.067
0.02031
0.00463
0.00396
0.00089
0.00037
0.00015
0.00002
0.00001
0.00001] * 1e3;

% Density, kg/m^3
specific_gas_constant = ideal_gas_constant / molar_mass;
rho = P ./ (specific_gas_constant * T);


%% Interpolate data at requested altitude(s)

temperature = interp1(y, T, altitude, 'linear');
pressure = interp1(y, P, altitude, 'linear');
density = interp1(y, rho, altitude, 'linear');