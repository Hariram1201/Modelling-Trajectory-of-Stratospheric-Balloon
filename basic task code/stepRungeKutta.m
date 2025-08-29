function znext = stepRungeKutta(t, z, dt, n, massSand)
% stepRungeKutta    Compute one step using the RungeKutta method
% 
%     ZNEXT = stepEuler(t, z, dt, n, massSand) computes the state vector ZNEXT at the next
%     time step T+DT

% Calculate the state derivative from the current state
A = dt * stateDeriv(t,z, n, massSand);
B = dt * stateDeriv(t + dt/2, z + A/2, n, massSand);
C = dt * stateDeriv(t + dt/2, z + B/2, n, massSand);
D = dt * stateDeriv(t + dt, z + C, n, massSand);

% Calculate the next state vector from the previous one using Runge-Kutta's
% update equation
znext = z + (1/6)*(A+2*B+2*C+D);