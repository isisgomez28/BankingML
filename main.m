%% Initialization
clear ; close all; clc
%% Cargando la Data
 data = load('DatasetInfo\cleanTrainingDS_Copy2.txt');
 X = data(:,[1:16]);
 y = data(:,[17]);
 [X_norm,mu,sig] = featureNormalize(data);

%  Tamaño de la matriz
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

%% ============= Regularizacion  =============
% Compute and display initial cost and gradient
thetaReg = zeros(n+1,1);
[costReg, gradReg] = costFunctionReg(thetaReg, X, y, 1);

%% =========== Train Logistic Regression =============
lambda = 0;
train_theta = trainLogisticReg([ones(m, 1) X], y, lambda);

%% =========== Learning Curve for Logistic Regression =============
lambda = 0;
[error_train, error_val] = ...
    learningCurve([ones(m, 1) X], y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda);

plot(1:m, error_train, 1:m, error_val);
title('Learning curve for logistic regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])

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
prob = sigmoid([58 2 2 2 0 2143 1 0 0 5 5 261 1 -1 0 0 0] * theta);
fprintf(['Probabilidad de Aceptacion de Oferta Mercadologica %f\n\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Precisión del Train: %f\n', mean(double(p == y)) * 100);

fprintf('\nFinalizacion del Programa\n');
pause;

