load('regression_data.mat');

net = fitnet(40);
net.layers{2}.transferFcn='purelin';

net.performFcn='mse'; 

net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005; % training goal

net.divideFcn = 'divideind';
net.divideParam.trainInd=1:70;
net.divideParam.testInd=71:100;

[net,tr] = train(net,X,T);

x_test=X(:,tr.testInd);
t_test=T(:,tr.testInd);
y_test = net(x_test);