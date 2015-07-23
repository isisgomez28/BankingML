function plotData(Xs, ys)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
X = Xs([1:100],:);
y = ys([1:100],:);
pos = find(y==1); 
neg = find(y == 0);
A = [1:length(X)];
A = A'
X = [X A];

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
for i =1 :16
    figure; hold on;
    plot(X(pos, 17), X(pos, i), 'k+','LineWidth', 2,'MarkerSize', 7);
    plot(X(neg, 17), X(neg, i), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
    hold off;
end





% =========================================================================




end
