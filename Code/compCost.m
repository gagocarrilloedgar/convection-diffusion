%% Computational cost
figure(1)
contourf(Peclet,D,reshape(time(3,:,:),[10 10]));
title("Smith-Hutton computational time","Interpreter","latex");
xlabel("Péclet number [Pe]", 'Interpreter', 'latex');
ylabel("Mesh size [N]", 'Interpreter', 'latex');

figure(2)
contourf(D,Peclet,reshape(itt(3,:,:)',[10 10]));
title("Smith-Hutton iterations","Interpreter","latex");
xlabel("Péclet number [Pe]", 'Interpreter', 'latex');
ylabel("Mesh size [N]", 'Interpreter', 'latex');