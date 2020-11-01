function Validation(nodes, mesh, T,Pe)

mesh_d = mesh.x(1,nodes.x/2+1:end);
num_pe1 = T(1,nodes.x/2+1:end,1);
num_pe2 = T(1,nodes.x/2+1:end,2);
num_pe3 = T(1,nodes.x/2+1:end,3);

theo_mesh = [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]';
theo_pe1 = [1.989 1.402 1.146 0.946 0.775 0.621 0.480 0.349 0.227 0.111 0.000]';
theo_pe2 = [2.0000 1.9990 1.9997 1.9850 1.8410 0.9510 0.1540 0.0010 0.0000 0.0000 0.0000]';
theo_pe3 = [2.000 2.000 2.000 1.999 1.964 1.000 0.036 0.001 0.000 0.000 0.000]';

%Plot
plotValidation(theo_pe1,theo_mesh,num_pe1,mesh_d,Pe(1));
plotValidation(theo_pe2,theo_mesh,num_pe2,mesh_d,Pe(2));
plotValidation(theo_pe3,theo_mesh,num_pe3,mesh_d,Pe(3));


end