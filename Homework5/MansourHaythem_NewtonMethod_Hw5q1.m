% Thermal Systems Design - Homework 5 - Question 1
% Using the Newton Method, Solve for Vdot

Tf = 105; % deg F
Ti = 110; % deg F
Tin = 70; % deg F
Qdot = 12000; % btu
Density = 61.991; % lbm / ft^3
Cp = 0.99893; % Btu / lbm * R
Vt = 9; % Gallons
t = 3; % mins

% Define arglist to pass to vDot function
argList = [Tf, Ti, Tin, Qdot, Density, Cp, Vt, t];

% Define initial guess
Vdot = 1;

% Define delta Vdot for the function!
addVdot = 0.000001;

% Initial error that is significantly bigger than 1e-6
eps = 1;

while eps > 1e-6
    % Define old Vdot
    oldVdot = Vdot;
    
    % Get our initial function Vdot
    fcnVdot = MansourHaythem_VdotFunc(Vdot, argList);
    
    % Get our next-step function Vdot
    fcnVdotaddVdot = MansourHaythem_VdotFunc(Vdot+addVdot, argList);
    
    % Get the slope of the next place
    slope = (fcnVdotaddVdot - fcnVdot) / addVdot;
    
    % Get the change in Vdot and add it to the old one
    delVdot = -fcnVdot / slope;
    Vdot = oldVdot + delVdot;
    
    % Get the relative error of the function
    eps = abs(delVdot/oldVdot);
    
end


Vdot
