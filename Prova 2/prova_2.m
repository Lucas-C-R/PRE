% Lucas Coelho Raupp - Questao 8

% ----------------------------------------------------------------------------

% a) PMF conjunta de X e Y.

close all; clear all; clc;

N = 10000;

X = zeros(1, N);
Y = zeros(1, N);

% Gerando o X e o Y
for i = 1 : N
  A = [0 1 2];
  
  idx = randi([1 3]);
  U1 = A(idx);          % Descobrindo se o U1 está em 0, 1 ou 2
  
  idx = randi([1 3]);
  U2 = A(idx);          % Descobrindo se o U2 está em 0, 1 ou 2
  
  idx = randi([1 3]);
  U3 = A(idx);          % Descobrindo se o U3 está em 0, 1 ou 2
  
  X(i) = U1 + U2 + U3;  % Definicao do X
  Y(i) = U1 + U2 - U3;  % Definicao do Y
end

x = 0 : 1 : 6;          % O 'x' vai de 0 à 6
y = -2 : 1 : 4;         % O 'y' vai de -2 à 4

histXY = zeros(7, 7);

for i = 1 : 7
  for j = 1 : 7
    histXY(i, j) = sum(X == x(i) & Y == y(j));
  end
end

pmfXY_sim = histXY / N
pmfXY_teo = [ 0    0   1/27  0    0    0    0;
              0   1/27  0   2/27  0    0    0;
             1/27  0   2/27  0   3/27  0    0;
              0   2/27  0   3/27  0   2/27  0;
              0    0   3/27  0   2/27  0   1/27;
              0    0    0   2/27  0   1/27  0;
              0    0    0    0   1/27  0    0]
              
% ----------------------------------------------------------------------------

% b) PMFs marginais de X e Y

pmfX_sim = hist(X, x) / N;
pmfX_teo = [1/27 3/27 6/27 7/27 6/27 3/27 1/27];

pmfY_sim = hist(Y, y) / N;
pmfY_teo = pmfX_teo;

figure;
subplot(2, 2, 1); hold on; grid on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('p_X(x)');

subplot(2, 2, 2); hold on; grid on;
bar(y, pmfY_sim, 'y');
stem(y, pmfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('p_Y(y)');

% ----------------------------------------------------------------------------

% c) PMFs condicionais de X dado que Y = y, para y ∈ {-2, 1}

pmfX_condY_sim = zeros(2, 7);

XcondY = X(Y == -2);
pmfX_condY_sim(1, :) = hist(XcondY, x) / sum(Y == -2);

XcondY = X(Y == 1);
pmfX_condY_sim(2, :) = hist(XcondY, x) / sum(Y == 1);

pmfX_condY_teo = [0  0  1  0  0  0  0;
                  0 2/7 0 3/7 0 2/7 0];
                  
subplot(2, 2, 3); hold on; grid on;
bar(x, pmfX_condY_sim(1, :), 'y');
stem(x, pmfX_condY_teo(1, :), 'b', 'LineWidth', 4);
xlabel('x'); ylabel(sprintf('p_X(x | Y = -2)'));

subplot(2, 2, 4); hold on; grid on;
bar(x, pmfX_condY_sim(2, :), 'y');
stem(x, pmfX_condY_teo(2, :), 'b', 'LineWidth', 4);
xlabel('x'); ylabel(sprintf('p_X(x | Y = 1)'));
  