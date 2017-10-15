%% Loading data files
load('mfiles1/data2a.mat');

%% Creating X matrix and Fingind beta0 and beta1
X = [ones(51,1), x, x.^2];
Beta = inv(X'*X)*X'*y;

%% Ploting training data and fit
xt = -1:0.1:1;
yt = Beta(1) + Beta(2)*xt + Beta(3)*xt.^2;
scatter(y,x);
hold on;
plot(yt,xt);

%% Finding error
%syms k;
%SSE = symsum((y(k) - Beta(1) -Beta(2)*x(k))^2, k, 1, 20);
%SSE = symsum(k^2, k, 1, 10);

SSE = 0;
for k=1:20
    p = (y(k) - Beta(1) - Beta(2)*x(k) - Beta(3)*x(k)^2)^2;
    SSE = SSE + p;
end