function [t,z] = ivpSolver(t0, z0, dt, tend, alt_end, n, massSand)
% ivpSolver    Solve an initial value problem (IVP) and plot the result
% 
%     [T,Z] = ivpSolver(t0, z0, dt, tend, alt_end, n, massSand) computes the IVP solution using a step 
%     size DT, beginning at time T0 and initial state Z0 and ending at time 
%     TEND. The solution is output as a time vector T and a matrix of state 
%     vectors Z.

% Creates array to store time values and stores initial time
t(1) = t0;

%Creates array to store vertical displacement and velocity values and stores initial
%values
z(:,1) = z0;

% Continue stepping until vertical and horizontal displacements are
% obtained
x=1;
while (t(x) <= tend)
    % Increment the time vector by one time step
    t(x+1) = t(x) + dt;
    
    % Apply Runge Kutta's method for one time step
    z(:,x+1) = stepRungeKutta(t(x), z(:,x), dt, n, massSand);
    
    x = x+1;
end
