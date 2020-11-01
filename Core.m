%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Core
% Description
% Main operations of the program
%
% Inputs
% ops: case selector
% Pe: Peclet numer
% T_: study parameter matrix 
% nodes: struct with the mesh number size ( .x, .y)
% scheme: scheme selection EDS / UDS
% delta: minimum admissible error
%
% Ouputs
% T: study parameter matrix 
% nodes: struct with the mesh number size ( .x, .y)
% mesh: struct with the vectors distributions parametrs
% time: time taken by the core of the program to compute the solution
% itt: numer of iteration fo the core og the program to compute the 
% solution
%
%% CODE

function [T, nodes, mesh,time, itt] = Core(ops, scheme,nodes, Pe, T_,delta)

% Geomtry & flow data
[geom,flow] = CaseParameters(ops, Pe);

rho = flow.rho.*ones(nodes.y, nodes.x);

% Mesh generation
mesh = MeshGeneration(nodes, geom);

% Velocity field
v = ComputeVelocities(nodes, mesh,flow, ops);

% Boundaries definition
T = ComputeBoundaries(nodes, mesh, flow.alpha, ops,T_);

% Coefficients
[coefs] = ComputeCoefficients(nodes, mesh, rho, T, flow.gamma,...
    v, Pe, scheme);

% Temperature computation
[T, time, itt] = Solver(mesh, nodes, T, coefs, delta, ops);

end