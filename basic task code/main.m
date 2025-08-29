%clear all variables
clear 

%Determine inputs from detInp function
startTime = 0;
[vertDistStart, horiDistStart, vertDistEnd, horiDistEnd, n, massSand] = detInp();

%IVP solver parameters
vertVeloStart = 0;  %Dont do anything, needed for IVP solver
horiVeloStart = 0;
dt = 0.1;
tend = 1500;

%Returns the altitude of balloon at different times
[t,z] = ivpSolver(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, n, massSand);
vertDistColumn = z(1,:);

%Determines the final height of the balloon with initial conditions
finalInitialPos = vertDistColumn(length(vertDistColumn));

if (finalInitialPos > vertDistEnd)
    %Creates an Array of number of moles against vertical distance at the
    %requited horizontal distance
    [nValues,finalTime, secantHeights] = createMolesVSHeight(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, n, massSand);

    %Finds the horizontal distance from the start at each time step
    [horDistances, finalDistances] = findHorDistancesM(horiDistStart, dt, secantHeights, nValues, finalTime);


    %Determines number of moles needed to drop down to the required vertical
    %displacement at the final horizontal distance
    [secantMoles] = detMolesNeeded(nValues,finalDistances, horiDistEnd, horiDistStart,dt, startTime, vertDistStart, vertVeloStart, tend, vertDistEnd);
    secantSand = massSand;
    
else
    %Creates an Array of sand mass against vertical distance at the
    %requited horizontal distance
    [sandValues,finalTime, secantHeights] = createSandVSHeight(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, n, massSand);

    %Finds the horizontal distance from the start at each time step
    [horDistances, finalDistances] = findHorDistancesS(horiDistStart, dt, secantHeights, sandValues, finalTime);

    %Determines mass of sand needed to drop down to the required vertical
    %displacement at the final horizontal distance
    [secantSand] = detSandNeeded(sandValues,finalDistances, horiDistEnd, horiDistStart,dt, startTime, vertDistStart, vertVeloStart, tend, vertDistEnd);
    secantMoles = n;
end

%Returns the altitude of balloon at different times
[t,z] = ivpSolver(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, secantMoles, secantSand);

%Determines whether the balloon reaches final horizontal or vertical
%distance first
vertDistColumn = z(1,:);
horDistanceColumn = finalHoriDist(horiDistStart,dt, vertDistColumn);
if (finalInitialPos > vertDistEnd)
    [finalHorDist, finalVertDist] = createFinArrM(t, vertDistColumn, horDistanceColumn, vertDistEnd);
else
    [finalHorDist, finalVertDist] = createFinArrS(t, vertDistColumn, horDistanceColumn, vertDistEnd);
end

%Plot a graph of vertical displacement against horizontal displacement
figure(1)
plot(finalHorDist, finalVertDist, 'r')
xlabel('Horizontal Displacement, m', 'FontSize', 15);
ylabel('Vertical Displacement, m', 'FontSize', 15);
title('Trajectory of Balloon', 'FontSize', 25);

%Display final position reached
disp(max(finalHorDist));
disp(min(finalVertDist));