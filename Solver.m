function [T, err, itt] = Solver(mesh, nodes, T, coefs, delta, ops)

k = 1;
itt = 1;
converged = false;
T_ = T;
while ~converged
    for i=2:nodes.y-1
        for j=2:nodes.x-1
            T_(i,j) = (   coefs.aE(i,j).*T_(i,j+1)  + ...
                coefs.aW(i,j).*T_(i,j-1)  + ...
                coefs.aN(i,j).*T_(i+1,j)  + ...
                coefs.aS(i,j).*T_(i-1,j)  + ...
                coefs.bP(i,j))/coefs.aP(i,j);
        end
    end
    
    % BC
    [T_] = ComputeBoundaries(nodes, mesh, 10, ops,T_);
    
    % Check convergence
    err(k) = max(max(abs(T - T_)));
    if err(k) < delta
        converged = true;
        disp(err(k));
    end
    % Update values
    T = T_;
    k = k+1;
    itt = itt + 1;
end

end