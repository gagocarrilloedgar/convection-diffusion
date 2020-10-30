
function v = ComputeVelocities(nodes, mesh,flow, ops)

M = ones(nodes.y, nodes.x);

% Initialization to matain a clean code

alpha = flow.alpha;
u0 = flow.u0;

x = mesh.x;
y = mesh.y;

switch ops
    
    case 1
        vx = u0.*M;
        vy = M;
        
    case 2
        vx = (u0*cos(alpha)).*M;
        vy = (u0*sin(alpha)).*M;
        
    case 3
        vx = 2.*y.*(1-x.^2);
        vy = -2.*x.*(1-y.^2);
        
    otherwise
        error('Inval option');
end

%Struct definition for eseiar management
v = struct("vx",vx,"vy",vy);

end