function [Rinv] = Inverse_R_GR(R)
    E = eye(4);
    Rinv = R\E; 
end

