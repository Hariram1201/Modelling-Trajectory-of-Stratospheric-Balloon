function [finalHorDist,finalVertDist] = createFinArrM(t, vertDistColumn, horDistances, vertDistEnd)
%Creates final array for balloon position when moles of helium are dropped

%Tidies up the three arrays storing the positions of the balloon
%[vertDistColumn], [horDistances], [vertDistEnd].
    n = 1;
    while vertDistColumn(n) > vertDistEnd
        finalVertDist(n) = vertDistColumn(n);
        finalHorDist(n) = horDistances(n);

        n = n + 1;
    end
end