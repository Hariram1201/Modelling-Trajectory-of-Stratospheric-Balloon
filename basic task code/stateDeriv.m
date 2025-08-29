function dz = stateDeriv(t, z, n, massSand)
% Calculate the state derivative for the current balloon position.
% 
%     DZ = stateDeriv(t, z, n, massSand) computes the derivative DZ = [V; A] of the 
%     state vector Z = [X; V], where X is displacement, V is velocity,
%     and A is acceleration.

%Define thrust, mass, drag to pull out of data sets dependent on altitude. (y direction)
g = 9.81;       %Gravitational constant
R = 8.3145;      %Gas constant
altitude =  z(1); 

%Finds the temperature, pressure and density at the required altitude
[temp, pressure, density] = standardAtmosphere(altitude);

heliumMass = (n*4.0026)/1000;        %Mass of helium 

%Calculates the values of the forces acting on the balloon
thrust = (density * g * R * temp * n) / (pressure);
mass = massSand + heliumMass + 15;
drag = (density*(pi/8))*((3*n*R*temp)/(4*pi*(pressure)))^(2/3);

% Calculates the values of the derivatives
dz1 = z(2);

%Determines whether the balloon is to move up or down and uses the
%appropriate equation

dz2 = (1/mass)*(thrust-(mass * g) - (drag*(z(2))^2)*sign(z(2)));

dz = [dz1; dz2];

