function [Q,R] = QRD_CGS(A)
[m, n] = size(A);
z = zeros(n, 1);
Q = zeros(m, n);
R = zeros(n, n);

for i = 1:m
    Q(i, 1) = A(i, 1) / norm(A(:, 1));
end 

for i = 2:n
    sum = zeros(m, 1);
    for k = 1:i-1
        sum = sum + (A(:, i)' * Q(:, k)) * Q(:, k);
    end
    z = A(:, i) - sum;
    for j = 1:m
        Q(j, i) = z(j)/norm(z);
    end
end

for i = 1:m
    for j = i:n
        R(i, j) = Q(:, i)' * A(:, j);
    end
end