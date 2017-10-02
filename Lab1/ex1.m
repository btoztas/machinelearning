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
plot(yt,xt);

%% Finding error
SSE = 0;
%syms k;
%SSE = symsum((y(k) - Beta(1) -Beta(2)*x(k))^2, k, 1, 20);
%SSE = symsum(k^2, k, 1, 10);
for k=1:20
    p = (y(k) - Beta(1) -Beta(2)*x(k))^2;
    SSE = SSE + p;
end