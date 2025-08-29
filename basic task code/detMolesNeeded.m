function [secantMoles] = detMolesNeeded(nValues,finalDistances, horiDistEnd, horiDistStart,dt, startTime, vertDistStart, vertVeloStart, tend, vertDistEnd)
%Determines whether the balloon will reach the final position with the
%current moles dropped.

%Determines whether the balloon will reach the final position whilst venting the least amount of helium as
%possible. The code then determines the two 20 mole
%intervals the required number of moles is within and will calculate
%the fianl positions of this values and the error 
% at this value. If the errors is not within
% 0.5 the secant formula is used to provide the next
%more accurate guess and determine the error of this value.
%This will keep repeating until a number of moles value within an error
%of 0.5 is found stored in [secantMoles].   

%Determines the x and y axis variables
    x = nValues;
    Y = finalDistances;

    %Determines the two 20 mole intervals the final moles is within
    index = length(nValues);
    found = false;
    while found == false
        if finalDistances(index) < horiDistEnd 
            foundValue = index;
            found = true;
        end
        index = index - 1;
    end

    %Determines the two initial guesses for the number of moles needed
    x0 = nValues(index);
    x1 = nValues(index+1);

    %Initial easting ditances with the two initial guesses for moles
    Y0 = finalDistances(index);
    Y1 = finalDistances(index+1);

    %Determines the initial errors with the initial guesses for easting
    %distance
    err0 = Y0 - horiDistEnd;
    err1 = Y1 - horiDistEnd;

    while abs(err1) > 0.5
        %Determines the next two values for x0 and x1
        newX = x1 - ((x1 - x0) * err1) / (err1 - err0);
        x0 = x1;
        x1 = newX;

        %Returns the altitude of balloon at different times
        [t,z] = ivpSolver(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, x1, 10);
        vertDistColumn = z(1,:);

        %Determines the easting and northing positions of the balloon,
        %then creates the final array ending at the final position of
        %the balloon
        horDistanceColumn = finalHoriDist(horiDistStart,dt, vertDistColumn);
        [finalHorDist, finalVertDist] = createFinArrM(t, vertDistColumn, horDistanceColumn, vertDistEnd); 

        %Determines the new error for the new number of moles
        finalPos = finalHorDist(length(finalHorDist));
        err0 = err1;
        err1 = finalPos - horiDistEnd;
    end

    secantMoles = newX;

end