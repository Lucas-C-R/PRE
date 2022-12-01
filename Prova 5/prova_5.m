% Lucas Coelho Raupp - Questão 10

close all; clear all; clc;

N = 10000000;

mu = [0; 0; 0; 0];  % Vetor média

C = [1 1 0 0;
     1 2 0 0;       % Matriz covariância
     0 0 3 3;
     0 0 3 4];  

vetX = mvnrnd(mu, C, N);    % Gera uma matriz de Nx4, com o vetor média e a matriz covariância fornecidos
X1 = vetX(:, 1)';           % O vetor X1, terá os valores da primeira coluna de vetX
X2 = vetX(:, 2)';           % O vetor X2, terá os valores da segunda coluna de vetX
X3 = vetX(:, 3)';           % O vetor X3, terá os valores da terceira coluna de vetX
X4 = vetX(:, 4)';           % O vetor X1, terá os valores da quarta coluna de vetX

% ----------------------------------------------------------------------------

% a) Pr[2 <= X2 <= 3]

Pr_a_sim = mean((2 <= X2) & (X2 <= 3))
Pr_a_teo = normcdf(3 / sqrt(2)) - normcdf(2 / sqrt(2))

% ----------------------------------------------------------------------------

% b) Pr[2 <= X2 <= 3 | X3 = 2] (Enunciado da questão alterado)

X_b_cond = X2((1.9 < X3) & (X3 < 2.1));

Pr_b_sim = mean((2 <= X_b_cond) & (X_b_cond <= 3))
Pr_b_teo = normcdf(3 / sqrt(2)) - normcdf(2 / sqrt(2))  % cov[X2,X3] = 0, então X2 e X3 são independentes

% ----------------------------------------------------------------------------

% c) Pr[2 <= X2 <= 3 | X3 = 2 e X1 = 3] (Enunciado da questão alterado)

X_c_cond = X2((1.9 < X3) & (X3 < 2.1) & (2.9 < X1) & (X1 < 3.1));

Pr_c_sim = mean((2 <= X_c_cond) & (X_c_cond <= 3))
Pr_c_teo = normcdf((3 - 3) / sqrt(1)) - normcdf((2 - 3) / sqrt(1))

% ----------------------------------------------------------------------------

% d) Pr[X2 - X4 > 4]

Pr_d_sim = mean((X2 - X4) > 4)
Pr_d_teo = 1 - normcdf((4-0)/sqrt(6))
