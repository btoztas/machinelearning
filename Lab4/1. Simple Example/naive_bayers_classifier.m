load('data1.mat')

%% Separar os inputs por classes
% xtrainYX --> classe Y, feature X
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

%% Estimar a gaussiana multivariável

%Calculo da média e da matriz de covariâncias para cada uma das classes.
%Admite-se que x_1 e x_2 são independentes entre si.
mu_class1 = [mean(xtrain11), mean(xtrain12)];
sigma_class1 = [cov(xtrain11), 0; 0,  cov(xtrain12)];

mu_class2 = [mean(xtrain21), mean(xtrain22)];
sigma_class2 = [cov(xtrain21), 0; 0,  cov(xtrain22)];

mu_class3 = [mean(xtrain31), mean(xtrain32)];
sigma_class3 = [cov(xtrain31), 0; 0,  cov(xtrain32)];

%Calculo da gaussiana multivariável para cada uma das classes
F1 = mvnpdf(xtest', mu_class1, sigma_class1);
F2 = mvnpdf(xtest', mu_class2, sigma_class2);
F3 = mvnpdf(xtest', mu_class3, sigma_class3);

%Utiliza-se agora as gaussianas calculadas para analisar os dados de teste.
F_total = [];
errors = 0;
%Percorre-se os dados de teste
for i = 1:150
    %Em cada input verifica-se qual a maior probabilidade.
    res = max([F1(i,1) F2(i,1) F3(i,1)]);
    %Classifica-se
    if res == F1(i,1)
        F_total = cat(1, F_total, 1);
    elseif res == F2(i,1)
        F_total = cat(1, F_total, 2);
    elseif res == F3(i,1)
        F_total = cat(1, F_total, 3);
    end
    
    %Virifica-se aqui se a classe classificada é a correta ou não
    if F_total(i) ~= ytest(i)
        errors = errors+1;
        i
    end
end

%Este é apenas um plot para visualizar as classes classificadas.
x = 1:1:150;
scatter(x, ytest);
hold on
scatter(x, F_total, 'x');
title('Resultados do classificador para os dados de teste');
legend('Classe esperada', 'Classificação obtida');
xlabel('Índice do dado de teste');
ylabel('Classe');
%Cálculo do erro.
error = errors/length(ytest) * 100
