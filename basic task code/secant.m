function [secantMoles] = secant(coefficients, coefficientsInv, vertDistEnd)
    % vertDistEnd and coefficients used to construct the secant equation to
    % solve

    % x0 and x1 are initial guesses determiend by the function m(y) which is the inverse of f(x).

z = 5;

    
x4Coefficient = coefficients(1);
x3Coefficient = coefficients(2);
x2Coefficient = coefficients(3);
x1Coefficient = coefficients(4);
x0Coefficient = coefficients(5);

y4Coefficient = coefficientsInv(1);
y3Coefficient = coefficientsInv(2);
y2Coefficient = coefficientsInv(3);
y1Coefficient = coefficientsInv(4);
y0Coefficient = coefficientsInv(5);

% Define the function f(x) to slove
f = @(x) x4Coefficient*x.^4 + x3Coefficient*x.^3 + x2Coefficient*x.^2 + x1Coefficient*x + x0Coefficient - vertDistEnd;

% Define the function m(x) as the inverse of f(x)
m = @(y) y4Coefficient*y.^4 + y3Coefficient*y.^3 + y2Coefficient*y.^2 + y1Coefficient*y + y0Coefficient;

%Determine inital guesses
A = vertDistEnd-5;
B = vertDistEnd+5;
x0 = m(A);
x1 = m(B);
y0 = f(x0);
y1 = f(x1);

    for i = 1:z
        x = x1 - (x1 - x0) * y1 / (y1 - y0);
        y = f(x);

        % Update for the next iteration
        x0 = x1;
        y0 = y1;
        x1 = x;
        y1 = y;
    end

    secantMoles = x;  % Return the final result
    
    
    %ivp solver
end
