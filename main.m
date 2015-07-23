%% Initialization
clear ; close all; clc
%% Cargando la Data
 load('data');
 X = data(:,(1:16));
 y = data(:,(17));
 [X_norm,mu,sig] = featureNormalize(X);
 Xval = X_norm((1:900),:);
 yval = y((1:900),:);
 y = y((901:length(y)),:);
 X_norm = X_norm((901:length(X)),:); 
 %plotData(X,y);
%  Tamaño de la matriz
[m, n] = size(X_norm);

% Agregando una columna de 1
X_norm = [ones(m, 1) X_norm];

% %% ============= Regularizacion  =============
% % Compute and display initial cost and gradient
thetaReg = zeros(n+1,1);
lambda = 1;
[costReg, gradReg] = costFunctionReg(thetaReg, X_norm, y, lambda);
% 
% %% =========== Train Logistic Regression =============
train_theta = trainLogisticReg(X_norm, y, lambda);
% 

[error_train, error_val] = ...
    learningCurve(X_norm, y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda);
% 
plot(1:m, error_train, 1:m, error_val);
title('Learning curve for logistic regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])

fprintf('Cost at theta found by fminunc: %f\n', costReg);
fprintf('theta: \n');
fprintf(' %f \n', train_theta);
[recall,precision] = calcRecallPrecision(X_norm,train_theta,y);
fprintf('recall: %f\n', recall);
fprintf('precision:%f \n', precision);
% Hacer cambios aca para hacer predicciones
p = predict(train_theta, X_norm);

fprintf('Precisión del Train: %f\n', mean(double(p == y)) * 100);

fprintf('\nFinalizacion del Programa\n');

