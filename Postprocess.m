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