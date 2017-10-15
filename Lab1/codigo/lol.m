%% Loading data files
load('mfiles1/data3.mat');

[B,FitInfo] = lasso(X,Y);
lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','log');
hold on
hline = refline(0, 2.9388)
hline.LineStyle = '--';
hline2 = refline(0, 0.0648)
hline2.LineStyle = '--';
hline2.Color = 'g';
hline3 = refline(0, 1.4252)
hline3.LineStyle = '--';
hline3.Color = 'r';
legend('beta1', 'beta3', 'beta2');