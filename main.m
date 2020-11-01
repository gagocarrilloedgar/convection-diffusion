%% Generic convection-diffusion equation
% Author: Edgar Gago Carrillo
% Date: October 2020
clear; close all;

%% Main Code
Inputs

D = [10 200];
d = numel(D);

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
    
    for i = 3:3
        
        for j = 1:p
            
            %Peclet number selection
            Pe = Peclet(j);
            
            % Solver
            [T_, nodes, mesh] = Core(i, scheme, nodes,Pe,T_,delta);
            if (k == d)
                % Postprocess
                Postprocess(mesh, T_, Pe, 'Temperature');
            end
            
            % Saving the results
            T(:,:,j,i) = T_;
            
        end
        
    end
    
    %% Validation
    % Smith-Hutton
    if(k ==d )
        Validation(nodes, mesh,T(:,:,:,3),Peclet);
    end
    
end




