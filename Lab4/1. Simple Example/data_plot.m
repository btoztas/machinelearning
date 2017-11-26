load('data1.mat')



%% Dados de treino
[m,n] = size(xtrain);
xtest11=[];
xtest12=[];
xtest21=[];
xtest22=[];
xtest31=[];
xtest32=[];
for i = 1:150
    if ytest(i)==1
        xtest11=cat(1,xtest11,xtest(1,i));
        xtest12=cat(1,xtest12,xtest(2,i));
    end
    if ytest(i)==2
        xtest21=cat(1,xtest21,xtest(1,i));
        xtest22=cat(1,xtest22,xtest(2,i));
    end
    if ytest(i)==3
        xtest31=cat(1,xtest31,xtest(1,i));
        xtest32=cat(1,xtest32,xtest(2,i));
    end
end

scatter(xtrain11,xtrain12, 36, 'o', 'r');
hold on;
scatter(xtrain21,xtrain22, 36, 'o', 'g');
hold on;
scatter(xtrain31,xtrain32, 36, 'o', 'b');

ax = gca;
ax.XLim=[min(min(xtrain(1,1:150)),min(xtrain(2,1:150)))-1 max(max(xtrain(1,1:150)),max(xtrain(2,1:150)))+1];
ax.YLim=[min(min(xtrain(1,1:150)),min(xtrain(2,1:150)))-1 max(max(xtrain(1,1:150)),max(xtrain(2,1:150)))+1];
hold on
title('Classificação dos dados de treino');
legend('Classe 1', 'Classe 2', 'Classe 3');
xlabel('x_1');
ylabel('x_2');