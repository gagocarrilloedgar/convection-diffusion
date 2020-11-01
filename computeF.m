%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% computeF
% Description
% Integration scheme computation
%
% Inputs
% Pe: Peclet numer
% scheme: scheme selection EDS / UDS
%
% Ouputs
% f: integration scheme value
%
%% CODE

function f = computeF(scheme, Pe)

switch scheme
    case 'UDS'
        f = 1;
    case 'EDS'
        f = abs(Pe)/(exp(abs(Pe))-1);
end
end