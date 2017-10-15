prompt = 'What is the file? ';
str = input(prompt,'s');
load(str);
[n,p]=size(X);
XT = ones(n,p);
for i=1:p
    XT(1:end,i) = X(1:end,i) - mean(X(1:end, i));
end
YT = Y - mean(YT);
Beta = inv(XT'*XT)*XT'*YT;
SSE=0;
for k=1:20
    p = (YT(k) - Beta(1) -Beta(2)*XT(k))^2;
    SSE = SSE + p;
end
BetaLasso = [2.7917,0,1.296]';
BetaRidge = [3.0198, 0.0663, 1.5485]';
YLasso = XT*BetaLasso;
YRidge = XT*BetaRidge;
%plot(YLasso);
hold on;
YLS = XT*Beta;
plot(YLS);
hold on;
plot(YRidge);
plot (YT);
SSELS = norm(YT - YLS)^2;
SSELasso = norm(YT - YLasso)^2;
SSERidge = norm(YT - YRidge)^2;

title('Comparison between training data, Ridge fit and LS fit for data3.mat');
legend('Output of Training Data','Fit using Ridge Regression', 'Fit using LS Regression');
xlabel('Sample');
ylabel('Output');