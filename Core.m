function [T, nodes, mesh] = Core(ops, scheme,nodes, Pe, T_,delta)

% Geomtry & flow data
[geom,flow] = CaseParameters(ops, Pe);

rho = flow.rho.*ones(nodes.y, nodes.x);

% Mesh generation
mesh = MeshGeneration(nodes, geom);

% Velocity field
v = ComputeVelocities(nodes, mesh,flow, ops);

% Boundaries definition
T = ComputeBoundaries(nodes, mesh, flow.alpha, ops,T_);

% Coefficients
[coefs] = ComputeCoefficients(nodes, mesh, rho, T, flow.gamma,...
    v, Pe, scheme);

% Temperature computation
[T, ~, ~] = Solver(mesh, nodes, T, coefs, delta, ops);

end