lambda = 0:0.001:150;
b = ridge(Y,X,lambda);
plot(lambda,b);
set(gca,'XScale','log');
set(gca,'Xdir','reverse');

title(strcat('Trace plot of coefficients fit by Ridge'));
legend('beta1', 'beta3', 'beta2');
xlabel('Lambda');
ylabel('Coefficient Value');

