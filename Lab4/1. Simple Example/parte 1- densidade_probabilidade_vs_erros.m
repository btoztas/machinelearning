load('data1.mat')

%% Separar os inputs por classes
% xtestYX --> classe Y, feature X
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




%% Plot

%Calculo da gaussiana multivariável para cada uma das classes

x = -4:.1:8; %// x axis
y = -4:.1:8; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
F1 = mvnpdf([X(:) Y(:)], mu_class1, sigma_class1);
F1 = reshape(F1,size(X)); %// put into same size as X, Y
%// contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...

F2 = mvnpdf([X(:) Y(:)], mu_class2, sigma_class2);
F2 = reshape(F2,size(X)); %// put into same size as X, Y

F3 = mvnpdf([X(:) Y(:)], mu_class3, sigma_class3);
F3 = reshape(F3,size(X)); %// put into same size as X, Y



%% Dados de teste
[m,n] = size(xtest);
xtest11=[];
xtest12=[];
xtest21=[];
xtest22=[];
xtest31=[];
xtest32=[];
for i = 1:150
    if i==14 || i==18 || i==26 || i ==28 || i==36 || i ==62 ||i==96
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
end

scatter(xtest11,xtest12, 36, 'x', 'r');
hold on;
scatter(xtest21,xtest22, 36, 'x', 'b');
hold on;
legend('Classe 1', 'Classe 2');

contour(X,Y,F1, 'ShowText','on', 'DisplayName', 'Classe 1', 'LineColor', 'r') %// ... or 3D plot
hold on
contour(X,Y,F2, 'ShowText','on', 'DisplayName', 'Classe 2', 'LineColor', 'b') %// ... or 3D plot
hold on
contour(X,Y,F3, 'ShowText','on', 'DisplayName', 'Classe 3', 'LineColor', 'g') %// ... or 3D plot
hold on

title('Comparação entre as densidades de probabilidade e os dados de teste mal classificados');
xlabel('x_1');
ylabel('x_2');
