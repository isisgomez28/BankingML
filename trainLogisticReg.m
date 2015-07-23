function [theta] = trainLogisticReg(X, y, lambda)
% Initialize Theta
initial_theta = zeros(size(X, 2), 1); 

% Create "short hand" for the cost function to be minimized
costFunctionr = @(t) costFunctionReg(t, X, y , lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200, 'GradObj', 'on');

% Minimize using fmincg
theta = fmincg(costFunctionr, initial_theta, options);

end
