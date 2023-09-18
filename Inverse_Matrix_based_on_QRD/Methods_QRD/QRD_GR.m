function [Q,A] = QRD_GR(A)
    [m,n] = size(A);
    Q = eye(m);

    for j = 1:n
        for i = m:-1:(j+1)
        G = eye(m);
        [c, s] = GivensRotation(A(i-1, j), A(i ,j));
        G([i-1, i], [i-1, i]) = [c -s; s c];
        A = G' * A;
        Q = Q * G;
        end
    end

end