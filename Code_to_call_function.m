%% Run
clear variables

%Define all variables
Lx = 1; % Domain size for x
Ly = 1; % Domain size for y
Mx = 20; % Amount of grid points in the x-direction
My = 20; % % Amount of grid points in the y-direction

 
nu = 1; maxIter = 10; dt = 0.0001;
showplot = true;

%Initial condition
uinitial = zeros(Mx, My); uinitial(Mx/2, My/2) = 1;

%Boundary Conditions
tBC = 0; bBC = 0;
lBC = 0; rBC = 0;
xperiodic = false; yperiodic = false;


u = solve_unsteady_diff(uinitial, Lx, Ly, Mx, My, ...
    nu, maxIter, dt, ...
    xperiodic, yperiodic, ...
    tBC, bBC, lBC, rBC, ...
    showplot);