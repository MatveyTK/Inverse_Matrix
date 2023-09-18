function [Rinv] = Inverse_R_MGS(R)
    n = length(R);
    Rinv = zeros(4);
    
    for j = 1:n
        for i = 1:(j - 1)
            for k = 1:(j - 1)
                Rinv(i, j) = Rinv(i, j) + Rinv(i, k) * R(k, j);
            end  
        end
        for k = 1:(j - 1)
            Rinv(k, j) = -Rinv(k, j) / R(j, j);
        end 
        Rinv(j, j) = 1 / R(j, j);
    end 
end

