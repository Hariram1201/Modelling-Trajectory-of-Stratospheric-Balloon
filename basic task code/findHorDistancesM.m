function [horDistances, finalDistances] = findHorDistancesM(horiDistStart,dt, secantHeights, nValues, finalTime)

%Determines final horizontal position, wind speed, final position and
% altitude.

%Creates matrix to store the wind velocities. Calculates the final balloon position after reaching the required
%vertical distance and is then stored in [finalEastDistances,
%finalNorthDistances]

    %Retrieves the Velocities at different Altitudes
    [altitudes, horVelocities] = importWindForecast1D('exampleForecast.csv');

    for n = 1:length(nValues)
        horDistances(n,1) = horiDistStart;
        currentHoriDist = horiDistStart;

        currentTime = 0;
        x = 1;
        while currentTime < finalTime(n)
            currentTime = currentTime + dt;
            currentVertDist = secantHeights(n,x);
            horVelocity = evaluateWindForecast1D(currentVertDist, altitudes, horVelocities);
            horDistance = horVelocity * dt;
            currentHoriDist = currentHoriDist + horDistance;

            horDistances(n,x+1) = currentHoriDist;
        
            x = x + 1;
        end

        finalDistances(n) = currentHoriDist;
    end
end