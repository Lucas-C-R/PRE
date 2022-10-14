% Lucas Coelho Raupp - Questão 10

% ----------------------------------------------------------------------------

% b) Pr[X >= Y]

clc; close all; clear all;

N = 100000;  % Numero de experimentos probabilisticos

X = zeros(1, N);
Y = zeros(1, N);

i = 1;
while i <= N
  X(i) = 20 * rand();
  Y(i) = 40 * rand() - 20;
  
  if (0 <= X(i) && X(i) <= 20 && -20 <= Y(i) && Y(i) <= 20) != (0 <= X(i) && X(i) <= 10 && -10 <= Y(i) && Y(i) <= 10)
    i += 1;
  end
end

PrX_maior_igual_Y_sim = mean(X >= Y)
PrX_maior_igual_Y_teo = 0.75

% ----------------------------------------------------------------------------

% c) PDF marginal de Y

y = -25 : 0.5 : 25;

histY = hist(Y, y);
pdfY_sim = histY / trapz(y, histY);
pdfY_teo = 2/60 .* (-20 <= y & y < -10) + ...
           1/60 .* (-10 <= y & y < 10) + ...
           2/60 .* (10 <= y & y < 20);

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y');
plot(y, pdfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('f_Y(y)');

% ----------------------------------------------------------------------------

% d) CDF marginal de Y

cdfY_sim = cumsum(histY) / N;
cdfY_teo = (2 * y + 40) / 60  .*  (-20 <= y & y < -10)  + ...
           (y + 30) / 60      .*  (-10 <= y & y < 10)   + ...
           (2 * y + 20) / 60  .*  (10 <= y & y < 20)    + ...
           1                  .*  (20 <= y);

subplot(3, 1, 2); grid on; hold on;
plot(y, cdfY_sim, 'g', 'LineWidth', 4);
plot(y, cdfY_teo, 'b--', 'LineWidth', 2);
xlabel('y'); ylabel('F_Y(y)');
xlim([-25 25]); ylim([-0.2, 1.2]);

% ----------------------------------------------------------------------------

% e) PDF condicional de Y dado que X = 5.

idx = (4 <= X) & (X <= 6);
histY_condX = hist(Y(idx), y);
pdfY_condX_sim = histY_condX / trapz(y, histY_condX);
pdfY_condX_teo = 1/20 .*  (-20 <= y & y < -10)  + ...
                 0    .*  (-10 <= y & y < 10)   + ...
                 1/20 .*  (10 <= y & y < 20);

subplot(3, 1, 3); grid on; hold on;
bar(y, pdfY_condX_sim, 'y');
plot(y, pdfY_condX_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('F_Y(y / X = 5)');

% ----------------------------------------------------------------------------

% f) Covariância entre X e Y

rhoXY_sim = cov(X, Y) / sqrt(var(X) * var(Y))
covXY_teo = 0