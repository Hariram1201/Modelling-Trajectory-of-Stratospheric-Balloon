function [altitudes,velocities] = importWindForecast1D(filename)
%% importWindForecast1D  Load forecast of 1D wind profile
%
% [ALTITUDES,VELOCITIES] = importWindForecast1D(FILENAME) outputs vectors 
% ALTITUDES and VELOCITIES of the forecasted wind velocities at the 
% corresponding altitudes. These are loaded from the CSV (comma separated 
% values) file FILENAME.
% 
% The CSV file must have the altitudes in the first column and wind
% velocities in the second column. These values must be in m/s and m.
% 
% Alan Hunter & Jack Saunders, University of Bath, Oct 2023.


% Load CSV file
data = csvread(filename);

% First column: altitudes in m
altitudes = data(:,1);

% Second column: wind velocities in m/s
velocities = data(:,2);