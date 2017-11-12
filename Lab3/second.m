
load('regression_data.mat');

%% With Validation
net = fitnet(40);
net.layers{2}.transferFcn='purelin';

net.performFcn='mse'; 

net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005; % training goal

net.divideFcn = 'divideind';
net.divideParam.trainInd=1:70;
net.divideParam.valInd=71:85;
net.divideParam.testInd=86:100;

[net,tr] = train(net,X,T);


%% Without Validation
net2 = fitnet(40);
net2.layers{2}.transferFcn='purelin';

net2.performFcn='mse'; 

net2.trainParam.show=10000; % # of epochs in display
net2.trainParam.epochs=10000;% max epochs
net2.trainParam.goal=0.005; % training goal

net2.divideFcn = 'divideind';
net2.divideParam.trainInd=1:70;
net2.divideParam.testInd=71:100;

[net2,tr2] = train(net2,X,T);

%% Plot
x = -1:0.01:1;
y_true = cos(5*x);
plot(x,y_true)

hold on

y_val = net(x);
plot(x,y_val)
title('Comparação entre fits com e sem validação')
xlabel('Input') % x-axis label
ylabel('Output') % y-axis label

hold on;

y_no_val = net2(x);
plot(x,y_no_val)
legend('y=cos(5x)', 'Fit com validação', 'Fit sem validação')

y = cos(5*X);
immse(y, T) 



