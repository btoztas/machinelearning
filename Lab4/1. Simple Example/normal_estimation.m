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
mu_class1 = [mean(xtrain11), mean(xtrain12)];
sigma_class1 = [cov(xtrain11), 0; 0,  cov(xtrain12)];

mu_class2 = [mean(xtrain21), mean(xtrain22)];
sigma_class2 = [cov(xtrain21), 0; 0,  cov(xtrain22)];

mu_class3 = [mean(xtrain31), mean(xtrain32)];
sigma_class3 = [cov(xtrain31), 0; 0,  cov(xtrain32)];

F1 = mvnpdf(xtest', mu_class1, sigma_class1);
F2 = mvnpdf(xtest', mu_class2, sigma_class2);
F3 = mvnpdf(xtest', mu_class3, sigma_class3);

F_total = [];
errors = 0;
for i = 1:150
    res = max([F1(i,1) F2(i,1) F3(i,1)]);
    if res == F1(i,1)
        F_total = cat(1, F_total, 1);
    elseif res == F2(i,1)
        F_total = cat(1, F_total, 2);
    elseif res == F3(i,1)
        F_total = cat(1, F_total, 3);
    end
    
    if F_total(i) ~= ytest(i)
        errors = errors+1;
    end
end

x = 1:1:150;
scatter(x, ytest);
hold on
scatter(x, F_total, 'x');


error = errors/length(ytest) * 100


% 
% x1 = -5:.2:5; x2 = -5:.2:5;
% [X1,X2] = meshgrid(x1,x2);
% F = mvnpdf([X1(:) X2(:)], mu_class1, sigma_class1);
% F = reshape(F,length(x2),length(x1));
% surf(x1, x2,F);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
% axis([-5 5 -5 5 0 .3])
% xlabel('x1'); ylabel('x2'); zlabel('Probability Density');