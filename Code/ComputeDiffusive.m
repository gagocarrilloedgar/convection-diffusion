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
% S: Surface of the cv
% d: distance between nodes
% gamma: 
%
% Ouputs
% D: Diffusive parameter
%
%% CODE

function [D] = ComputeDiffusive(gamma, S, d)
    D = gamma.*S./d;
end