load digits;
net = patternnet([15]);
net.performFcn='mse';
net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='tansig';
net.divideFcn='divideind';
net.divideParam.trainInd=1:400;
net.divideParam.testInd=401:560;
%net.trainFcn = 'traingdm'
net.trainFcn = 'traingdx'
net.trainParam.lr=8;
net.trainParam.mc=0.6;
net.trainParam.show=10000;
net.trainParam.epochs=10000;
net.trainParam.goal=0.05;
[net,tr] = train(net,X,T);
x_test=X(:,tr.testInd);
t_test=T(:,tr.testInd);
y_test = net(x_test);
plotconfusion(t_test,y_test);