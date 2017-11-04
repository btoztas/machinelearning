load digits;
net = patternnet([15]);
net.performFcn='mse'; 
net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='tansig';
net.divideFcn='divideind';
net.divideParam.trainInd=1:400;
net.divideParam.testInd=401:560;

net.trainFcn = 'traingdm'
net.trainParam.lr=2; % learning rate
net.trainParam.mc=0.5;% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);