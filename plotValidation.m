function plotValidation(theo,theo_mesh,num,mesh,Pe)

str = sprintf('Pe = %0.f, values at outlet', Pe);
ylabel_ = 'T';
xlabel_ = 'Outlet mesh x value [m]';


figure;
plot(theo_mesh, theo); 
hold on;
plot(mesh,num);

title(str, 'FontWeight', 'bold', 'Interpreter', 'Latex');
xlabel(xlabel_, 'Interpreter', 'Latex');
ylabel(ylabel_, 'Interpreter', 'Latex');
legend("Theoretical", "Numerical");

end