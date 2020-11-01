%% Convection-Diffusion
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Postprocess
% Description
% Postprocess of the results (plots generation)
%
% Inputs
% mesh: mesh of the computed values
% Pe: Peclet number
% title_: title of the figure
% vairable: variable to plot
%
% Ouputs
% 
%
%% CODE

function Postprocess(mesh, variable, Pe, title_)

str_ = ['$\rho/\Gamma$ = ', num2str(Pe)];
xlabel_ = 'Longitude [m]';
ylabel_ = 'Height [m]';
figure;
contourf(mesh.x, mesh.y, variable);
str = sprintf('%s',title_);
c = colorbar; c.Label.String = str;
colormap(jet);

title(str_, 'FontWeight', 'bold', 'Interpreter', 'Latex');
xlabel(xlabel_, 'Interpreter', 'Latex');
ylabel(ylabel_, 'Interpreter', 'Latex');



end