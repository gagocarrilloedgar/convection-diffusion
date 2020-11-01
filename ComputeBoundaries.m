%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% ComputeBoundaries
% Description
% Update phi qith the boudanry conditions
%
% Inputs
% ops: case selector
% Phi: study parameter matrix (T)
% angle: angle of the flow for the SM & Diagonal flow
% mesh: struct with the vectors distributions parametrs
% nodes: struct with the mesh number size ( .x, .y)
%
% Ouputs
% Phi: study parameter matrix (T)
%
%% CODE
function [phi] = ComputeBoundaries(nodes, mesh, angle, ops,phi)

phi_low = 273;
phi_high = 373;

switch ops
    
    case 1
        phi(end,:) = phi(end-1,:);
        phi(1,:) = phi(2,:);
        phi(:,1) = phi_high;
        phi(:,end) = phi_low;
        
    case 2
        phi(end,:) = phi_high;
        phi(1,:) = phi_low;
        phi(:,1) = phi_high;
        phi(:,end) = phi_low;
        
        
    case 3
        phi(1, 1:nodes.x/2) = 1+tanh(angle.*(2.*mesh.x(1,1:nodes.x/2) + 1));
        phi(1, nodes.x/2+1:end) = phi(2,nodes.x/2+1:end);
        phi_ = 1-tanh(angle);
        phi(:,1) = phi_;
        phi(end,:) = phi_;
        phi(:,end) = phi_;
        
        
    otherwise
        error('Invalid case study');
end
end