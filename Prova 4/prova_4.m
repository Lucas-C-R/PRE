% Lucas Coelho Raupp - Questão 4

% ----------------------------------------------------------------------------

% a) Vetor média e matriz covariância de Y

clc; close all; clear all;

format short g;

N = 10000;

Y1 = zeros(1, N);
Y2 = zeros(1, N);
Y3 = zeros(1, N);

for i = 1 : N
  A = [0 1 2];
  
  idx = randi([1 3]);
  X1 = A(idx);          
  
  idx = randi([1 3]);
  X2 = A(idx);
  
  Y1(i) = X1;
  Y2(i) = X2;
  Y3(i) = X1 * X2;
end

muY_sim = mean([Y1' Y2' Y3'])'
muY_teo = [1; 1; 1]

covY_sim = cov([Y1' Y2' Y3'])
covY_teo = [2/3 0 2/3; 0 2/3 2/3; 2/3 2/3 16/9]

% ----------------------------------------------------------------------------

% a) Vetor média e matriz covariância de Z

Z1 = Y1 + Y2;
Z2 = Y2 + Y3;
Z3 = Y3 + Y1;

muZ_sim = mean([Z1' Z2' Z3'])'
muZ_teo = [2; 2; 2]

covZ_sim = cov([Z1' Z2' Z3'])
covZ_teo = [4/3 2 2; 2 34/9 28/9; 2 28/9 34/9]
