%% Run
clear variables
%Define all variables
Lx = 1; Ly = 1; Mx = 20; My = 20;
nu = 1; maxIter = 10; dt = 0.0001;
showplot = true;

%Boundary Conditions
tBC = 0; bBC = 0;
lBC = 0; rBC = 0;
xperiodic = false; yperiodic = false;
%Initial condition
uinitial = zeros(Mx, My); uinitial(Mx/2, My/2) = 1;

u = solve_unsteady_diff(uinitial, Lx, Ly, Mx, My, ...
    nu, maxIter, dt, ...
    xperiodic, yperiodic, ...
    tBC, bBC, lBC, rBC, ...
    showplot);