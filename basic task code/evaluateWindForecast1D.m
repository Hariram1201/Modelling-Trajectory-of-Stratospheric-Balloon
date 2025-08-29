function [v] = evaluateWindForecast1D(z,altitudes,velocities)
%% evaluateWindForecast1D  Evaluate forecast of 1D wind profile
% 
% [V] = evaluateWindForecast1D(Z,ALTITUDES,VELOCITIES) outputs a vector V 
% of forecasted wind velocities at the corresponding altitudes specified in 
% the input vector Z. The altitudes and velocities are in m and m/s.
% 
% Use the function loadWindForecast1D to create the inputs ALTITUDES and 
% VELOCITIES for this function.
% 
% Alan Hunter & Jack Saunders, University of Bath, Oct 2023.


% Interpolate wind velocity at the requested altitude(s)
v = interp1(altitudes, velocities, z, 'linear');