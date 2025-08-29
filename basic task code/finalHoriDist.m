function [horDistances] = finalHoriDist(horiDistStart,dt, vertDistColumn)
    %Creates array to store horizontal displacement values and stores initial
    %value
    horDistances = [];
    currHorDist = horiDistStart; %Stores the current horizontal displacement of the balloon
    horDistances(1) = currHorDist;

    %Retrieves the velocities at different altitudes
    [altitudes, horVelocities] = importWindForecast1D('exampleForecast.csv');

    n = 1;
    while n < length(vertDistColumn)
        %Calculates the change in horizontal distance for each time step
        horVelocity = evaluateWindForecast1D(vertDistColumn(n), altitudes, horVelocities);
        horDistance = horVelocity * dt;
        currHorDist = currHorDist + horDistance;
        horDistances(n+1) = currHorDist;

        n = n+1;
    end

    horDistances = transpose(horDistances);
end