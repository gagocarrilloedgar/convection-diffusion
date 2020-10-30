
function [geom, flow] = CaseParameters(ops, diffus)

u0 = 1;                 % Velocity in [m/s]
H = 1;                   % Height [m]
gamma = 1;
rho = diffus*gamma;
switch ops
    case 1
        alpha = 0;          % Angle [rad]
        L = H;              % Longitude [m]
        
    case 2
        alpha = pi/4;       % Angle [rad]
        L = H;              % LOngitude [m]
        
    case 3
        alpha = 10;         % Angle [rad]
        L = 2*H;            % Longitude [m]
        
        
    otherwise
        error("Not valid case study.");
end

geom = struct("H",H,"L",L);
flow = struct("alpha",alpha,"u0",u0,"rho",rho,"gamma",gamma);

end