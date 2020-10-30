function [f] = computeF(scheme, Pe)

switch scheme
    case 'UDS'
        f = 1;
    case 'EDS'
        f = abs(Pe)/(exp(abs(Pe))-1);
end
end