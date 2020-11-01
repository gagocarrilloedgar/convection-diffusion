%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% MeshGeneration
% Description
% Structu containing the different mesh distributions, distances, surfaces,
% nodes, etc
%
% Inputs
% geom: struct with the geometry of teh case study
% nodes: struct with the mesh number size ( .x, .y)
%
% Ouputs
% mesh: struct with the vectors distributions parametrs
%
%% CODE
function [mesh] = MeshGeneration(nodes, geom)

%Inits
L = geom.L;
H = geom.H;

x_ = linspace(-L/2,L/2, nodes.x-1);
y_ = linspace(0,H, nodes.y-1);


mesh.dx = x_(2)-x_(1);
mesh.dy = y_(2)-y_(1);

x = zeros(1,nodes.x);
y = zeros(1,nodes.y);

% Center block
x(2:end-1) = x_(1:end-1) + mesh.dx/2;
y(2:end-1) = y_(1:end-1) + mesh.dy/2;

% Boundaries
x([1,end]) = x_([1,end]);
y([1,end]) = y_([1,end]);

% Mesh generation using vertical and horizontal distribution
[mesh.x,mesh.y] = meshgrid(x, y);
mesh.xlines = x_;
mesh.ylines = y_;

% Compute distances between control volumes centers
dPN = zeros(nodes.y, nodes.x);
dPS = zeros(nodes.y, nodes.x);
dPW = zeros(nodes.y, nodes.x);
dPE = zeros(nodes.y, nodes.x);

for i = 2:nodes.y-1
    for j = 2:nodes.x-1
        
        % North
        dNx = abs(mesh.x(i,j)-mesh.x(i+1, j));
        dNy = abs(mesh.y(i,j)-mesh.y(i+1, j));
        dPN(i,j) = sqrt(dNx^2 + dNy^2);
        
        % South
        dSx = abs(mesh.x(i,j)-mesh.x(i-1, j));
        dSy = abs(mesh.y(i,j)-mesh.y(i-1, j));
        dPS(i,j) = sqrt(dSx^2 + dSy^2);
  
        % West
        dWx = abs(mesh.x(i,j)-mesh.x(i, j-1));
        dWy = abs(mesh.y(i,j)-mesh.y(i, j-1));
        dPW(i,j) = sqrt(dWx^2 + dWy^2);
        
        % East
        dEx = abs(mesh.x(i,j)-mesh.x(i, j+1));
        dEy = abs(mesh.y(i,j)-mesh.y(i, j+1));
        dPE(i,j) = sqrt(dEx^2 + dEy^2);
    end
end

mesh.dPN = dPN;
mesh.dPS = dPS;
mesh.dPW = dPW;
mesh.dPE = dPE;

end