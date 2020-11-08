%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Solver
% Description
% Core of the solver, iterationd over T unitl it's solved, GS Solver
%
% Inputs
% coefs: struct with the different matrix coefficients
% T: study parameter matrix
% delta: minimum admissible error
% ops: case selector
% nodes: struct with the mesh number size ( .x, .y)
% mesh: struct with the vectors distributions parametrs
%
% Ouputs
% T: solution of the conv-diff case study
% time: time taken by the core of the program to compute the solution
% itt: numer of iteration fo the core og the program to compute the 
%
%% CODE

function [T, time, itt] = Solver(mesh, nodes, T, coefs, delta, ops)

k = 1;
itt = 1;
tic;
converged = false;
T_ = T;
while ~converged
    for i=2:nodes.y-1
        for j=2:nodes.x-1
            T_(i,j) = (   coefs.aE(i,j).*T_(i,j+1)  + ...
                coefs.aW(i,j).*T_(i,j-1)  + ...
                coefs.aN(i,j).*T_(i+1,j)  + ...
                coefs.aS(i,j).*T_(i-1,j)  + ...
                coefs.bP(i,j))/coefs.aP(i,j);
        end
    end
    
    % BC
    [T_] = ComputeBoundaries(nodes, mesh, 10, ops,T_);
    
    % Check convergence
    err(k) = max(max(abs(T - T_)));
    if err(k) < delta
        disp(err(k));
        time = toc;
        converged = true;
    end
    % Update values
    T = T_;
    k = k+1;
    itt = itt + 1;
end

end