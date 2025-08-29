function [nValues,finalTime, secantHeights] = createMolesVSHeight(startTime, vertProp, dt, tend, vertDistEnd, n, massSand);
%Creates array of moles vented and the height of the balloon after venting

 %Creates an array [nValues] to store the different mole values to be vented in
 %increments of 20 and stores the altitude of the balloon [secantHeights]
 %at each time step. For each iteration the time taken to reach the final
 % position is stored in [finaltime]

    vertDistStart = vertProp(1,:);
    vertVeloStart = vertProp(2,:);

  %Creates areas to store number of moles and the heights the balloon
  %reaches with these number of moles values
    nValues = (0:20:n);
    secantHeights = [];
    
  %Determines the height of the balloon at each time step and stores it
  %into the secantHeights array and the time at which the balloon
  %reaches the final height and stores into finalTime
    
    for w = 1:length(nValues)
        [time,massHeights] = ivpSolver(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, nValues(w), massSand);
        heightColumn = massHeights(1,:);

        for y = 1:length(heightColumn)
            secantHeights(w, y) = heightColumn(y);
        end

        m = 1;
        while secantHeights(w,m) > vertDistEnd && m < length(time)
            m = m + 1;
        end
        finalTime(w) = time(m);
    end
end