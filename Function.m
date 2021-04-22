function u = solve_unsteady_diff(uinitial, Lx, Ly, Mx, My, ...
                                 nu, maxIter, dt, ...
                                 xperiodic, yperiodic, ...
                                 tBC, bBC, lBC, rBC, ...
                                 showplot)

%Check inputs are correct format

%Error check uinitial is of size Mx by My

%Define u to be uinitial

%Loop over all timesteps
for it = 1:maxIter
    
    %Enforce Boundary Conditions
    
    %Set u at next timestep (un) to include boundary values
    utp1 = u;
    
    %Loop over all points and update un from 5 point stencil of u values


    
    %Overwrite u array with new u at t+1
    u = utp1;
        
    %Plotting
    if (showplot)
        %Note transpose as u arrays defined with Mx x My so flip to plot
        contourf(u'); %surf also possible
        colorbar;
        pause(0.01)
    end

end

