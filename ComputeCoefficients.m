%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% ComputeCoefficients
% Description
% Calculation of the different matrix coefficients
%
% Inputs
% ops: case selector
% T: study parameter matrix (T)
% mesh: struct with the vectors distributions parametrs
% nodes: struct with the mesh number size ( .x, .y)
% gamma: 
% v: struct of the flow velocities
% Pe: Peclet numer
% rho: rho distribution matrix
% scheme: scheme selection EDS / UDS
%
% Ouputs
% coefs: struct with the different matrix coefficients
%
%% CODE

function [coefs] = ComputeCoefficients(nodes, mesh, rho, T, gamma, v, Pe, scheme)

%Initialization to keep a cleaner code
vx = v.vx; vy = v.vy;

dy = mesh.dy; 
dx = mesh.dx;
dPE = mesh.dPE;
dPW = mesh.dPW;
dPN = mesh.dPN;
dPS = mesh.dPS; 

x = nodes.x;
y = nodes.y;


% Compute diffusive terms
De = ComputeDiffusive(gamma, dy, dPE);
Dw = ComputeDiffusive(gamma, dy, dPW);
Dn = ComputeDiffusive(gamma, dx, dPN);
Ds = ComputeDiffusive(gamma, dx, dPS);

% Compute f parameter --> phischeme selection
fe = computeF(scheme, Pe);
fw = computeF(scheme, Pe);
fn = computeF(scheme, Pe);
fs = computeF(scheme, Pe);

% Initialization o mass flow
me = zeros(y, x);
mw = zeros(y, x);
mn = zeros(y, x);
ms = zeros(y, x);

% Compute mass flow
me(2:end-1, 2:end-1) = rho(2:end-1, 2:end-1).*dy.*vx(2:end-1, 3:end);
mw(2:end-1, 2:end-1) = rho(2:end-1, 2:end-1).*dy.*vx(2:end-1, 1:end-2);
mn(2:end-1, 2:end-1) = rho(2:end-1, 2:end-1).*dx.*vy(3:end, 2:end-1);
ms(2:end-1, 2:end-1) = rho(2:end-1, 2:end-1).*dx.*vy(1:end-2, 2:end-1);

% Compute coefficients
% Ass the mass flow can not be negative we force it to either be positive 
% or 0
aE = De.*fe + max(-me, 0);
aW = Dw.*fw + max(mw, 0);
aN = Dn.*fn + max(-mn, 0);
aS = Ds.*fs + max(ms, 0);


aP0 =0; % 0 as it is stationary
aP = aE + aW + aN + aS + aP0 + dx*dy;
bP = aP0.*T;

% Structu definition for cleaner code
coefs = struct("aE",aE,"aW",aW,"aN",aN,"aS",aS,"aP",aP,"bP",bP);
end