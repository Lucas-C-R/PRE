% Lucas Coelho Raupp - Questao 3

% ----------------------------------------------------------------------------

% a)

clc;
close all;

N = 100000;

U = randi([1 6], 1, N);           % Dados sendo lancados N vezes

% Encontra as posicoes em que o dado caiu com as respectivas faces para cima
idx1 = U == 0;
idx2 = U == 2 | U == 3;
idx3 = U == 4;
idx4 = U == 5 | U == 6;

X = zeros(1, N);                  % Preenche a matriz X, 1 linha e N colunas, com 0

X(idx1) = 0;                      % Se U = 1,      X = 0
X(idx2) = 1/2;                    % Se U = 2 ou 3, X = 1/2
X(idx3) = 1;                      % Se U = 4,      X = 1
X(idx4) = 2 * rand(1, sum(idx4)); % Se U = 5 ou 6, X ∈ [0 2]

x = -0.5 : 0.01 : 2.5;

freqX = hist(X, x);

figure;

subplot(2, 1, 1); hold on; grid on;
xlim([-0.5 2.5]);
ylim([-0.1 1]);
xlabel('x');
ylabel('f_X(x)');

% Grafico da PDF simulada
pdfX_sim = freqX / trapz(x, freqX);
bar(x, pdfX_sim, 'y');

% Grafico da PDF calculada
pdfX_teo = (1/6) .* (0 < x & x < 2);
plot(x, pdfX_teo, 'r', 'LineWidth', 3);

% Desenho dos impulsos
plot([0, 0], [0, 1/6], 'b', 'LineWidth', 3');
plot([0], [1/6], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
plot([1/2, 1/2], [0, 1/3], 'b', 'LineWidth', 3');
plot([1/2], [1/3], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
plot([1, 1], [0, 1/6], 'b', 'LineWidth', 3');
plot([1], [1/6], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

% ----------------------------------------------------------------------------

% b)

subplot(2, 1, 2); hold on; grid on;
xlim([-0.5 2.5]); ylim([-0.2, 1.2]);
xlabel('x');
ylabel('F_X(x)');

% Grafico da CDF simulada
cdfX_sim = cumsum(freqX) / N;
plot(x, cdfX_sim, 'y', 'LineWidth', 4);

% Grafico da CDF calculada
cdfX_teo = 0           .* (0 > x) + ...
           (1/6 + x/6) .* (0 <= x & x < 1/2) + ...
           (1/2 + x/6) .* (1/2 <= x & x < 1) + ...
           (2/3 + x/6) .* (1 <= x & x < 2) + ...
           1           .* (2 <= x);
plot(x, cdfX_teo, 'b--', 'LineWidth', 2);

% ----------------------------------------------------------------------------

% c)

EX_sim = mean(X)                  % Experanca matematica simulada
EX_teo = 2/3                      % Experanca matematica calculada

% ----------------------------------------------------------------------------

% d)

PrX_menor_1_sim = mean(X < 1)     % Probabilidade de X < 1 simulada
PrX_menor_1_teo = 2/3             % Probabilidade de X < 1 calculada