function [t] = calcTimes(startTime, dt,tend)

    % Creates array to store time values and stores initial time
    t(1) = startTime;

    x = 1;
    while (t(x) <= tend)
        % Increment the time vector by one time step
        t(x+1) = t(x) + dt;

        x = x+1;
    end
end