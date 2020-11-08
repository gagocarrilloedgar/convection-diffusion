%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% ComputeDiffusive
% Description
% Compute the diffussive parameter of the Con-Dif equation
%
% Inputs
%
%
% Ouputs
% 
%
%% CODE

% ops: case selector
% Pe: Peclet numer
% geom: struct with the geometry of teh case study
% flow: stuct with the flow propoerties 
% Phi: study parameter matrix (T)
% angle: angle of the flow for the SM & Diagonal flow
% mesh: struct with the vectors distributions parametrs
% nodes: struct with the mesh number size ( .x, .y)
% v: struct of the flow velocities
% scheme: scheme selection EDS / UDS
% S: Surface of the cv
% d: distance between nodes
% delta: minimum admissible error
% time: time taken by the core of the program to compute the solution
% itt: numer of iteration fo the core og the program to compute the 
% solution
% theo: theoretical values
% theo:mesh: mesh of the theoretical values
% num: computed values
% title_: title of the figure
% vairable: variable to plot
% coefs: struct with the different matrix coefficients
