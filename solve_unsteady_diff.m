function u = solve_unsteady_diff(uinitial, Lx, Ly, Mx, My, ...
                                 nu, maxIter, dt, ...
                                 xperiodic, yperiodic, ...
                                 tBC, bBC, lBC, rBC, ...
                                 showplot)

%Check inputs are correct format
% if ~isnumeric(uninitial) | ~isnumeric(Lx) | | ~isnumeric(Ly) | ...
%         ~isnumeric(Mx) | ~isnumeric(My) | ~isnumeric(nu) | ...
%         ~isnumeric(maxIter) | ~isnumeric(dt) | | ~isnumeric(xperiodic) | ...
%         ~isnumeric(yperiodic) | ~isnumeric(tBC) | ~isnumeric(bBC) | ...
%         ~isnumeric(lBC) | ~isnumeric(rBC) 
%     error('Inputs must be numeric, try again!')
% end
    
% Define the grid
x = linspace(0,Lx,Mx); % Mesh
y = linspace(0,Ly,My);
dx = Lx/Mx % dx = x(2)-x(1); % Mesh size
dy = Ly/My % dy = y(2)-y(1);
%Error check uinitial is of size Mx by My
if length(uinitial)~= Mx
    error('Input accurate length')
end

%Define u to be uinitial
u = uinitial 

% Initialize matrices
N = Mx*My; % of unknowns
M = zeros(N, N); % N rows and N columns of zeros
B = zeros(N,1);     % N rows and 1 column of zeros

%Loop over all timesteps
for t = 1:maxIter
    u(1) = 0; u(Mx) = 0; u(My) = 0;
    %Enforce Boundary Conditions
    % for Left BC phi
    i = lBC;
    for j = 1:My
        n = i + (j-1)*Mx;
        M(n,n) = 1;
        B(n,1)= lBC(j); % Boundary condition at y_j
    end
    % for LBC
    i = lBC;
    for j = 1:My
        n = i + (j-1)*Mx;
        M(n,n) = 1;
        B(n,1)= lBC(j); % Boundary condition at y_j
    end    
    
    %Set u at next timestep (un) to include boundary values
    utp1 = u;
    
    %Loop over all points and update un from 5 point stencil of u values
    for i=2:Mx-1
        utp1(i)=u(i)+dt*nu*(u(i+1) ...
            -2*u(i)+u(i-1))/dx^2;
    end

    
    %Overwrite u array with new u at t+1
    u = utp1;
        
    %Plotting
    if (showplot)
        %Note transpose as u arrays defined with Mx x My so flip to plot
        plot(x,utp1)
        contourf(u'); %surf also possible
        colorbar;
        pause(0.01)
    end

end

