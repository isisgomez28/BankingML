%% Initialization
clear ; close all; clc
%% Cargando la Data
 load('data.mat');
 X = data(:,[1:16]);
 y = data(:,[17]);
 [X_norm,mu,sig] = featureNormalize(data);

%  Tama�o de la matriz
[m, n] = size(X);

% Agregando una columna de 1
X = [ones(m, 1) X];

% Initialize Theta con 0 
initial_theta = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n');


%% ============= Part 3: Optimizing using fminunc  =============
%  In this exercise, you will use a built-in function (fminunc) to find the
%  optimal parameters theta.

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);
% Hacer cambios aca para hacer predicciones
% De un nuevo cliente.
prob = sigmoid([58 3 0 0 0 2143 1 -4 1 5 5 261 1 -1 0 1 0] * theta);
fprintf(['Probabilidad de Aceptacion de Oferta Mercadologica %f\n\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Precisi�n del Train: %f\n', mean(double(p == y)) * 100);

fprintf('\nFinalizacion del Programa\n');
pause;

