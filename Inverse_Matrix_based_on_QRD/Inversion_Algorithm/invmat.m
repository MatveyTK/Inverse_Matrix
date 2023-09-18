%% Inverse Matrix
clc
clear

A           = rand(4,4);                           % исходная матрица 
fraction    = 13;                                  % округление разрядности дробной части
A           = round(A, fraction);                  % округление исходной матрица 

% Matlab Inverse Matrix

    Ainv_matlab  = inv(A);                         % инверсия исходной матрицы 
    Apinv_matlab = pinv(A);                        % псевдоинверсия исходной матрицы
    Ainv_matlab  = round(Ainv_matlab, fraction);   % округление полученной обратной матрицы
%------------------------------------------------------------

% QRD-GR (Givens Rotation)

    [Q_gr, R_gr]    = QRD_GR(A);                   % QR разложение
    [Rinv_gr]       = Inverse_R_GR(R_gr);          % получение обратной верхней треугольной матрицы R  
    Ainv_gr         = Rinv_gr * Q_gr';             % получение обратной исходной матрицы
    Ainv_gr         = round(Ainv_gr, fraction);    % округление полученной обратной матрицы
    Compare_gr      = Ainv_gr == Ainv_matlab;      % сравниение исходной и полученной матриц
%------------------------------------------------------------

clear fraction Q_gr R_gr Rinv_gr