function [finalHorDist,finalVertDist] = createFinArr(t, vertDistColumn, horDistances)
    lenVertDist = length(vertDistColumn);
    lenHoriDist = length(horDistances);

    if lenVertDist <= lenHoriDist
        lowestValue = lenVertDist;
    else
        lowestValue = lenHoriDist;
    end

    for x = 1:lowestValue
        finalT(x) = t(x);
        finalHorDist(x) = horDistances(x);
        finalVertDist(x) = vertDistColumn(x);
    end
end