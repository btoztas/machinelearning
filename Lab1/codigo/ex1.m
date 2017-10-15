%% Loading data files
load('mfiles1/data1.mat');

%% Creating X matrix and Fingind beta0 and beta1
X = [ones(20,1), x];
Beta = inv(X'*X)*X'*y;

%% Ploting training data and fit
xt = -1:0.1:1;
yt = Beta(1) + Beta(2)*xt;
scatter(y,x);
hold on;
title(strcat('Least squares fitting a polynomial of degree 1 with training data form data1.mat'));
legend('Training Data','Fit using LS fitting');
plot(yt,xt);

%% Finding error
sse = norm(y-X*Beta)^2
