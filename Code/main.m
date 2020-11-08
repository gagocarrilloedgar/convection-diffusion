%% Generic convection-diffusion equation
% Author: Edgar Gago Carrillo
% Date: October 2020
% Subject: Computational Engineering
% 
%% main
% Description
% Compute the convection diffusion for three different case studies 
% Three fors in order to evaluate the three case studies, different mesh
% sizes and different peclet numbers
%
%% CODE
clear; close all;

%% Inputs
Inputs

% Allocations in order to cover different case studies 
D = linspace(10,100,10);
d = numel(D);
itt = zeros(z,d,p);
time = zeros(z,d,p);

%% Core
for k = 1:d
    
    N = D(k);      % Number of mesh divisions in the x direction
    M = N;        % Number of mesh divisions in the y direction
    
    x = N+2;       % Mesh nodes in the x direction + boundaries
    y = M+2;       % Mesh nodes in the y direction + boundaries
    nodes = struct('x', x, 'y', y);
    
    %% Initializations
    T = zeros(x,y,p,z); % Space allocation that improves code's performance
    % [x_size, y_size, pe_options,case study]
    
    T_ = zeros(x,y);
    
    for i = 1:3
        for j = 1:p
            
            %Peclet number selection
            Pe = Peclet(j);
            
            % Solver
            [T_, nodes, mesh,time_, itt_] = Core(i, scheme, nodes,Pe,T_,delta);
            if (k == d)
                % Postprocess
                %Postprocess(mesh, T_, Pe, 'Temperature');
            end
            
            % Saving the results
            T(:,:,j,i) = T_;
            time(i,k,j) = time_;
            itt(i,k,j) = itt_;
            
        end
        Line 49         
Line 50 

    end
    
    %% Validation
    % Smith-Hutton
    if(k ==d )
        %Validation(nodes, mesh,T(:,:,:,3),Peclet);
    end
    
end

%% Computational cost
compCost.m






