function [D] = ComputeDiffusive(gamma, S, d)
    D = gamma.*S./d;
end