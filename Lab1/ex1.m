X = [ones(20,1), x];
xt = -1:0.1:1;
Beta = inv(X'*X)*X'*y;
yt = Beta(1) + Beta(2)*xt;
scatter(y,x);
hold on;
plot(yt,xt);
SSE = 0;
%syms k;
%SSE = symsum((y(k) - Beta(1) -Beta(2)*x(k))^2, k, 1, 20);
%SSE = symsum(k^2, k, 1, 10);
for k=1:20
    p = (y(k) - Beta(1) -Beta(2)*x(k))^2;
    SSE = SSE + p;
end