% Lucas Coelho Raupp - Questão 8

close all; clear all; clc;

N = 10000;  % Número de experimentos probabilísticos
dt = 0.02;  % Passo do tempo
t = -5: dt :5;
t1 = t; t2 = t;
Nt = length(t);

% ----------------------------------------------------------------------------

% a) 3 Realizacoes do processo

A0 = 0;
B0 = 0;

A0B0 = A0 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);
       
figure; grid on; hold on;
subplot(3, 1, 1);
plot(t, A0B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 0, B = 0');
xlabel('t'); ylabel('X(t)');
ylim([0 2]);  

A1 = 1;

A1B0 = A1 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);
       
subplot(3, 1, 2);
plot(t, A1B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 0');
xlabel('t'); ylabel('X(t)');

B1 = 1;

A1B1 = A1 * (0 <= t & t < 1) + ...
       B1 * (1 <= t & t < 2);

subplot(3, 1, 3);
plot(t, A1B1, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 1');
xlabel('t'); ylabel('X(t)');

% ----------------------------------------------------------------------------

% b) Funcao media X(t)

X = zeros(N, Nt);
for i = 1 : N
  A = rand() * 4;
  B = rand() * 4;
  
  X(i, :) = A * (0 <= t & t < 1) + ...
            B * (1 <= t & t < 2);
end

muX_sim = mean(X);
muX_teo = 2 * (0 <= t & t < 2);

figure; grid on; hold on;
plot(t, muX_sim, 'y', 'LineWidth', 4);
plot(t, muX_teo, 'b--', 'LineWidth', 2);
title('Função média'); xlabel('t'); ylabel('\mu_X(t)');

% ----------------------------------------------------------------------------

% c) Função autocovariância

CX_sim = cov(X, X);
[T1, T2] = meshgrid(t1, t2);
CX_teo = 16/3 .* ((0 <= T1 & T1 < 1) .* (0 <= T2 & T2 < 1)  + ...
                  (1 <= T1 & T1 < 2) .* (1 <= T2 & T2 < 2)) + ...
         4    .* ((0 <= T1 & T1 < 1) .* (1 <= T2 & T2 < 2)  + ...
                  (1 <= T1 & T1 < 2) .* (0 <= T2 & T2 < 1)) - ...
         4    .*  (0 <= T1 & T1 < 2) .* (0 <= T2 & T2 < 2);

figure;
subplot(1, 2, 1); grid on; hold on; view(30, 45);
surf(t1, t2, CX_sim);
shading flat;
title('Função autocovariância (simulada)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');

subplot(1, 2, 2); grid on; hold on; view(30, 45);
surf(t1, t2, CX_teo);
shading flat;
title('Função autocovariância (teórica)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');
