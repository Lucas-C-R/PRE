clear all; close all; clc;

N = 100000;

% Gera N variáveis aleatórias gaussianas com N(0,1)
X = randn(1, N);

% ----------------------------------------------------------------------------

% a) Função autocovariância de X[n]

% Calcula a autocovariância de X[n]
[C_X, l] = xcorr(X, 'unbiased');

figure; hold on; grid on;
stem(l, C_X);
xlim([-3 3]); ylim([-1 2]);
xlabel('l');
ylabel('C_X');
title('Autocovariância de X[n]');

% ----------------------------------------------------------------------------

% b) Função autocovariância de Y[n]

% Calcula Y[n]
Y = zeros(1, N); 
for i = 3 : N
    Y(i) = X(i) + X(i-1) + X(i-2);
end

% Calcula a autocovariância de Y[n]
[C_Y, l] = xcorr(Y, 'unbiased');

figure; hold on; grid on;
stem(l, C_Y);
xlim([-3 3]); ylim([-1 4]);
xlabel('l');
ylabel('C_Y');
title('Autocovariância de Y[n]');

% ----------------------------------------------------------------------------

% c) Função densidade de probabilidade de Y[3]

y = -5 : 0.25 : 5;

X1 = randn(1, N);
X2 = randn(1, N);
X3 = randn(1, N);

Y3 = X3 + X2 + X1;

% Calcula a PDF de Y[3]
histY = hist(Y3, y);
pdfY_sim = histY / trapz(y, histY);

pdfY_teo = 1 / sqrt(6 * pi) * exp(-y.^2 / 6);

figure; hold on; grid on;
bar(y, pdfY_sim, 'y');
plot(y, pdfY_teo, 'b');
xlabel('y');
ylabel('f_Y(y)');
title('PDF de Y[3]');

% ----------------------------------------------------------------------------

% d) Covariância entre Y[3] e Y[4]

X4 = randn(1, N);

Y3 = X3 + X2 + X1;
Y4 = X4 + X3 + X2;

covY = cov(Y3, Y4);

% Obtém o valor contido na primeira linha e segunda coluna da matriz covY
covY3_Y4_sim = covY(1, 2)

covY3_Y4_teo = 2
% ----------------------------------------------------------------------------

% e) Pr[Y[3] > 0 | Y[0] = 1]

X_2 = randn(1, N);
X_1 = randn(1, N);
X0 = randn(1, N);

Y0 = X0 + X_1 + X_2;

Pr_cond = Y3((0.9 < Y0) & (Y0 < 1.1));

Pr_sim = mean(Pr_cond > 0)
Pr_teo = 0.5
