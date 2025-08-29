function [vertDistStart, horiDistStart, vertDistEnd, horiDistEnd, n, massSand] = detInp()
%Feeds user input values into main script.

%User can adjust input values for following variables to simulate desired
%balloon trajectory:

    vertDistStart = 18000;
    horiDistStart = 0; 

    vertDistEnd = 15000;
    horiDistEnd = 3000;

    n = 1000;
    massSand = 10;

end