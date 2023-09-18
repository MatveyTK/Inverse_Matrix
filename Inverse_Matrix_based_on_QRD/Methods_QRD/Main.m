%% QR Decomposition
clc
clear

A = rand(4,4);              % исходная матрица
fraction = 10;              % округление разрядности дробной        |методы начинают располазться|
A = round(A, fraction);     % округление исходной матрица           |после 15 разряда            |


% Matlab QRD

    [Q_matlab, R_matlab] = qr(A);               % QR разложение
    B_matlab = Q_matlab * R_matlab;             % получение исходной матрицы
    B_matlab = round(B_matlab, fraction);       % округление полученной матрицы
    compare_matlab = A == B_matlab;             % сравниение исходной и разложенной матриц
%------------------------------------------------------------

% QRD-MGS (Modified Gram-Schmidt)

    [Q_mgs, R_mgs] = QRD_MGS(A);
    B_mgc = Q_mgs * R_mgs;
    B_mgc = round(B_mgc, fraction);
    compare_mgc = A == B_mgc;
%------------------------------------------------------------

% QRD-GR (Givens Rotation)

    [Q_gr, R_gr] = QRD_GR(A);
    B_gr = Q_gr * R_gr;
    B_gr = round(B_gr, fraction);
    compare_gr = A == B_gr;
%------------------------------------------------------------

% QRD-CGS (Classic Gram-Schmidt)

    [Q_cgs, R_cgs] = QRD_CGS(A);
    B_cgs = Q_cgs * R_cgs;
    B_cgs = round(B_cgs, fraction);
    compare_cgs = A == B_cgs;
%------------------------------------------------------------
clear Q_cgs Q_gr Q_mgs Q_matlab R_cgs R_gr R_mgs R_matlab fraction

%% Inverse Matrix
clc
clear

A           = rand(4,4);                           % исходная матрица
fraction    = 10;                                  % округление разрядности дробной
A           = round(A, fraction);                  % округление исходной матрица

% Matlab Inverse Matrix

    Ainv_matlab  = inv(A);                         % инверсия исходной матрицы 
    Apinv_matlab = pinv(A);                        % псевдоинверсия исходной матрицы
    Ainv_matlab  = round(Ainv_matlab, fraction);   % округление полученной обратной матрицы
%------------------------------------------------------------

% QRD-MGS (Modified Gram-Schmidt)

    [Q_mgs, R_mgs]  = QRD_MGS(A);                   % QR разложение
    [Rinv_mgs]      = Inverse_R_MGS(R_mgs);         % получение обратной верхней треугольной матрицы R
    Ainv_mgs        = Rinv_mgs * Q_mgs';            % получение обратной исходной матрицы
    Ainv_mgs        = round(Ainv_mgs, fraction);    % округление полученной обратной матрицы
    Compare_mgs     = Ainv_mgs == Ainv_matlab;      % сравниение исходной и полученной матриц
%------------------------------------------------------------

% QRD-GR (Givens Rotation)

    [Q_gr, R_gr]    = QRD_GR(A);
    [Rinv_gr]       = Inverse_R_GR(R_gr);             
    Ainv_gr         = Rinv_gr * Q_gr';
    Ainv_gr         = round(Ainv_gr, fraction);
    Compare_gr      = Ainv_gr == Ainv_matlab;
%------------------------------------------------------------

clear fraction Q_gr Q_mgs R_gr R_mgs Rinv_gr Rinv_mgs









