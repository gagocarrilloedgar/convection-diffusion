%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% CaseParameters
% Description
% Selection of the case study
%
% Inputs
% ops: case selector
% Pe: Peclet numer
%
% Ouputs
% geom: struct with the geometry of teh case study
% flow: stuct with the flow propoerties 
%
% % distribution
%
%% CODE
function [geom, flow] = CaseParameters(ops, Pe)

u0 = 1;                 % Velocity in [m/s]
H = 1;                   % Height [m]
gamma = 1;
rho = Pe*gamma;
switch ops
    case 1
        alpha = 0;          % Angle [rad]
        L = H;              % Longitude [m]
        
    case 2
        alpha = pi/4;       % Angle [rad]
        L = H;              % LOngitude [m]
        
    case 3
        alpha = 10;         % Angle [rad]
        L = 2*H;            % Longitude [m]
        
        
    otherwise
        error("Not valid case study.");
end

geom = struct("H",H,"L",L);
flow = struct("alpha",alpha,"u0",u0,"rho",rho,"gamma",gamma);

end