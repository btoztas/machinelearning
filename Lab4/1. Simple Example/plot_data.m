load('data1.mat')

%% Dados de treino
xtrain11=[];
xtrain12=[];
xtrain21=[];
xtrain22=[];
xtrain31=[];
xtrain32=[];
for i = 1:150
    if ytrain(i)==1
        xtrain11=cat(1,xtrain11,xtrain(1,i));
        xtrain12=cat(1,xtrain12,xtrain(2,i));
    end
    if ytrain(i)==2
        xtrain21=cat(1,xtrain21,xtrain(1,i));
        xtrain22=cat(1,xtrain22,xtrain(2,i));
    end
    if ytrain(i)==3
        xtrain31=cat(1,xtrain31,xtrain(1,i));
        xtrain32=cat(1,xtrain32,xtrain(2,i));
    end
end


%% Dados de teste
[m,n] = size(xtest);
xtrain11=[];
xtrain12=[];
xtrain21=[];
xtrain22=[];
xtrain31=[];
xtrain32=[];
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

scatter(xtest11,xtest12, 36, 'x', 'r');
hold on;
scatter(xtest21,xtest22, 36, 'x', 'g');
hold on;
scatter(xtest31,xtest32, 36, 'x', 'b');

ax = gca;
ax.XLim=[min(min(xtrain(1,1:150)),min(xtrain(2,1:150)))-1 max(max(xtrain(1,1:150)),max(xtrain(2,1:150)))+1];
ax.YLim=[min(min(xtrain(1,1:150)),min(xtrain(2,1:150)))-1 max(max(xtrain(1,1:150)),max(xtrain(2,1:150)))+1];
hold on
title('Classificação dos dados de teste');
legend('Classe 1', 'Classe 2', 'Classe 3');
xlabel('x_1');
ylabel('x_2');