% Lucas Coelho Raupp - Questão 3

close all; clear all; clc;

N = 1000;  % Número de experimentos probabilísticos
dt = 0.005;
t = 0 : dt : 20;
Nt = length(t);
lambda1 = 1.5;  % eventos / s
lambda2 = 1.0;
lambda = lambda1 + lambda2;

% ----------------------------------------------------------------------------

% a) Função média do processo estocástico

X = zeros(N, Nt);

for i = 1 : N
  T = 0;
  while T < t(end)
    T = T + exprnd(1/lambda);
    X(i, :) = X(i, :) + (t > T);
  end
end

muX_sim = mean(X);
muX_teo = lambda * t .* (t >= 0);

figure; hold on; grid on;
plot(t, muX_sim, 'y', 'LineWidth', 4);
plot(t, muX_teo, 'b', 'LineWidth', 2);

% ----------------------------------------------------------------------------

% b) Pr[X4,5 >= 3 / X2,3 = 2]

idx4 = (4 / dt) + 1;
idx5 = (5 / dt) + 1;

X4 = X(:, idx4);
X5 = X(:, idx5);

PrX3_5_maior_3_sim = mean(X5 - X4 >= 3)
PrX3_5_maior_3_teo = 0.456187

% ----------------------------------------------------------------------------

% c) Pr[Δ6 > 1]

T = diff(X')';

T5 = zeros(1, N);
T6 = zeros(1, N);
for i = 1 : size(T, 1)
    row = T(i, :);
    indices = find(row);
    
    T5(i) = (indices(5) - 1) * dt;
    T6(i) = (indices(6) - 1) * dt;
end;

delta6_sim = mean((T6 - T5) > 1)
delta6_teo = 0.082085

% ----------------------------------------------------------------------------

% d) Cx

idx7 = (7 / dt) + 1;
X7 = X(:, idx7);

Cx_sim = cov(X4, X7)
Cx_teo = [10 10;
          10 17.5]