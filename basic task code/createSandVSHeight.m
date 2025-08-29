function [sandValues,finalTime, secantHeights] = createSandVSHeight(startTime, vertProp, dt, tend, vertDistEnd, n, massSand)
%Creates array of sand and the height of the balloon after dropping

 %Creates an array [sandValues] to store the different sand values to be dropped in
 %increments of 0.5 and stores the altitude of the balloon [secantHeights]
 %at each time step. For each iteration the time taken to reach the final
 % position is stored in [finaltime]

    vertDistStart = vertProp(1,:);
    vertVeloStart = vertProp(2,:);

%Creates areas to store sand dropped and the heights the balloon
%reaches with these number of sand values
    sandValues = (0:0.5:9);
    secantHeights = [];

  %Determines the height of the balloon at each time step and stores it
  %into the secantHeights array and the time at which the balloon
  %reaches the final height and stores into finalTime
    for w = 1:length(sandValues)
        [time,massHeights] = ivpSolver(startTime, [vertDistStart; vertVeloStart], dt, tend, vertDistEnd, n, sandValues(w));
        heightColumn = massHeights(1,:);

        for y = 1:length(heightColumn)
            secantHeights(w, y) = heightColumn(y);
        end

        m = 1;
        while secantHeights(w,m) < vertDistEnd && m < length(time)
            m = m + 1;
        end
        finalTime(w) = time(m);
    end
end