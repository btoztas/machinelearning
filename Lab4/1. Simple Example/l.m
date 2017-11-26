%O MIRAGAIA ? GAY POR ISSO ? MIRAGAYA

% o naive bayes classifier ? um classsificador baseado em probabilidades que, assume que todas as features s?o independetes
% entre si, sendo possivel 
% 
% 
% ? altamente escal?vel send que o n?mero de parametros de teste ? linear com o n?mero de feature necessarias 
% 
% 
% 








close all 
clear

load data1;

k=1;
j=1;
m=1;

for i=1:length(ytest)
    switch ytest(i);
        case 1
            X_1(:,k) =  xtest(:,i);
            k=k+1;
        case 2
            X_2(:,j) =  xtest(:,i);
            j=j+1;
        case 3
            X_3 (:,m)=  xtest(:,i);
            m=m+1;
    end
end

k=1;
j=1;
m=1;


for i=1:length(ytrain)
    switch ytrain(i);
        case 1
            X_1r(:,k) =  xtrain(:,i);
            k=k+1;
        case 2
            X_2r(:,j) =  xtrain(:,i);
            j=j+1;
        case 3
            X_3r (:,m)=  xtrain(:,i);
            m=m+1;
    end
end


figure  
hold on

scatter (X_1(1,:),X_1(2,:),'O','fill','red')

scatter (X_2(1,:),X_2(2,:),'O','fill','blue')

scatter (X_3(1,:),X_3(2,:),'O','fill','m')

scatter (X_1r(1,:),X_1r(2,:),'X','red')

scatter (X_2r(1,:),X_2r(2,:),'X','blue')

scatter (X_3r(1,:),X_3r(2,:),'X', 'm')

title('test data')
axis  equal

legend('class1_{test}','class2_{test}','class3_{test}','class1_{train}','class2_{train}','class3_{train}')

%% script pedido
% naive bayes classifier
% nao usando toolboxes do matlab para este modelo


% primeiro vamos descobrir qual a probabilidade da cada classe 




close all 
clear

load data1;

k=1;
j=1;
m=1;

for i=1:length(ytrain)
    switch ytrain(i);
        case 1
            X_1(:,k) =  xtrain(:,i);
            k=k+1;
        case 2
            X_2(:,j) =  xtrain(:,i);
            j=j+1;
        case 3
            X_3 (:,m)=  xtrain(:,i);
            m=m+1;
    end
end

% no vectres X_i est?o os elementos de teste que pertecem ? classe i 
P_1 = length(X_1)/length(ytrain);
P_2 = length(X_2)/length(ytrain);
P_3 = length(X_3)/length(ytrain);
% podemos verificae que s?o equiprov?veis tendo cada um dele 1/3 de
% probabilidade
%%

% o nosso objectivo ?, dado um elemento ap?s aplicado ao classificador este
% d? como o resultado a classe a que o elemento pertence
% ou seja temos de calcula as probabilidades ? posteriori e
% consequentemente ? priori.

%%
% $$ posteriori = \frac{priori* likelihood}{evidence} $$
% likelihood  = P(C_i) probability of class i
% como j? vimos vai ser igual para todas as classes por isso podemos
% ignorar este termo a evidence tamb?m ser? igual para todos os casos logo
% apenas teremos de calcular a probabilidade apriori de um classe dado um
% elemento
% neste caso parece que temos 



% para um dado elemento X = x1,x2  a sua classe ser? definida por :
%max {P(Y_1|X),P(Y_2|X),P(Y_3|X)} <=> max {P(X|Y_1),P(X|Y_2),P(X|Y_3)}
% onde P(X|Y_i) = P(x1|Y_i) * P(x2|Y_i) aqui ? aplicado o naive bayes
% classificator que assume que as feature s?o independentes
% vamos usar distribui??o gaussiana por isso precisamos da variacia e
% desvio padr?o

%slide 24 http://www.cs.cmu.edu/~guestrin/Class/10701-S06/Slides/naivebayes-logisticregression.pdf
% 
%this prob better http://cs229.stanford.edu/section/gaussians.pdf page 3
%https://stats.stackexchange.com/questions/49521/how-to-find-variance-between-multidimensional-points
%

mu_1 = [sum(X_1(1,:))/length(X_1) ,sum(X_1(2,:))/length(X_1) ];
%mu_1 = mean(X_1') n?o estou a por esta op??o pq no enunciado parece que
%quer que facamos tudo ? m?o

cov = (1/(length(X_1)+1)) * (X_1(1,:)-mu_1(1)) * (X_1(2,:)-mu_1(2))';
var_1 = (1/length(X_1)) * (sum((X_1(1,:)-mu_1(1)).^2)) ;
var_2 = (1/length(X_1)) * (sum((X_1(2,:)-mu_1(2)).^2)) ;

% R matrix 2 by 2 [var(x1) , cov(x1,x2) ; cov (x2,x1) , var (x2)] 
sigma_1 = [var_1 ,0 ; 0, var_2];


mu_2 = [sum(X_2(1,:))/length(X_2) ,sum(X_2(2,:))/length(X_2) ];
cov = (1/(length(X_2)+1)) * (X_2(1,:)-mu_2(1)) * (X_2(2,:)-mu_2(2))';
var_1 = (1/length(X_2)) * (sum((X_2(1,:)-mu_2(1)).^2)) ;
var_2 = (1/length(X_2)) * (sum((X_2(2,:)-mu_2(2)).^2)) ;
sigma_2 = [var_1 ,0 ; 0, var_2];


mu_3 = [sum(X_3(1,:))/length(X_3) ,sum(X_3(2,:))/length(X_3) ];
cov = (1/(length(X_3)+1)) * (X_3(1,:)-mu_3(1)) * (X_3(2,:)-mu_3(2))';
var_1 = (1/length(X_3)) * (sum((X_3(1,:)-mu_3(1)).^2)) ;
var_2 = (1/length(X_3)) * (sum((X_3(2,:)-mu_3(2)).^2)) ;
sigma_3 = [var_1 ,0 ; 0, var_2];

%podemos mais ou menos ver que os valores do 1 s?o maiores mas iso ? devido
%ao conjunto dos 1 estar mais espalhado pelo mundo




y_res = zeros(1,length(xtest));

for i =1:length(xtest)
    [num , y_res(i)] = max([mvnpdf(xtest(:,i),mu_1',sigma_1) , mvnpdf(xtest(:,i),mu_2',sigma_2) , mvnpdf(xtest(:,i),mu_3',sigma_3)]);
end

%n?o tenho a certeza se a equa??o funcionar? assim
% 
% disp('Acertou')
% 
% sum(abs(y_res-ytest))
% disp('de 150')
%n la placian, draw , se e pode usar mean e var e pode usar cov

erro_percentual = nnz(y_res-ytest)/length(xtrain) * 100

%% Versao ramiro

%clears workspace and closes images
close all 
clear

%loads dataset
load data1;

%initializes sets as empty
[X_1 , X_2 ,X_3 ,X_1r , X_2r, X_3r]=deal([]);

%separates classes of test set
for i=1:length(ytest)
    switch ytest(i);
        case 1
            X_1 =[X_1,xtest(:,i)];
        case 2
           X_2 =[X_2,xtest(:,i)];
        case 3
            X_3 =[X_3,xtest(:,i)];
    end
end

%separates classes of train set
for i=1:length(ytrain)
    switch ytrain(i);
        case 1
           
            X_1r =[X_1r,xtrain(:,i)];
        case 2
            X_2r =[X_2r,xtrain(:,i)];
        case 3
           X_3r =[X_3r,xtrain(:,i)];
    end
end

%creates figure and makes scatter of test and train data
f=figure  
hold on

scatter (X_1(1,:),X_1(2,:),'O','fill','red')

scatter (X_2(1,:),X_2(2,:),'O','fill','blue')

scatter (X_3(1,:),X_3(2,:),'O','fill','m')

scatter (X_1r(1,:),X_1r(2,:),'X','red')

scatter (X_2r(1,:),X_2r(2,:),'X','blue')

scatter (X_3r(1,:),X_3r(2,:),'X', 'm')

%sets titles and legend 
title('test data')
legend('class1_{test}','class2_{test}','class3_{test}','class1_{train}','class2_{train}','class3_{train}')
xlabel('feature 1')
ylabel('feature 2')

%ensures axis have same scale
axis  equal

%calculates the mean for each class and feature
mu1=mean(X_1r');
mu2=mean(X_2r');
mu3=mean(X_3r');

%calculates the standard deviation for each class and feature (PERGUNTAR SE E MSM PRECISO POR CALCULAR A VARIANCIA E POR VAR n em vez de n-1)
sig1=sqrt(var(X_1r')*(size(X_1r',1)-1)/size(X_1r',1));% as opera??es descritas servem para que no calculo da variancia se divida por N em vez do habitual n-1
sig2=sqrt(var(X_2r')*(size(X_2r',1)-1)/size(X_2r',1));
sig3=sqrt(var(X_3r')*(size(X_3r',1)-1)/size(X_3r',1));

%calculates probablility for each class
p1=length(X_1r)/length(xtest)
p2=length(X_2r)/length(xtest)
p3=length(X_3r)/length(xtest)
%[p1,p2,p3]=deal(1/3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%goes throush the test set
for i =1:length(xtest)
    
    %calculates the posterior probability for each class ignoring the scale factor
   
    %Posterior1=P('1')*P(feature1|'1')*P(feature2|'1');
    p1post=p1*normpdf(xtest(1,i),mu1(1),sig1(1))*normpdf(xtest(2,i),mu1(2),sig1(2));
    p2post=p2*normpdf(xtest(1,i),mu2(1),sig2(1))*normpdf(xtest(2,i),mu2(2),sig2(2));
    p3post=p3*normpdf(xtest(1,i),mu3(1),sig3(1))*normpdf(xtest(2,i),mu3(2),sig3(2));
    
    %finds maximum and predicts class
    [num , y_res(i)] = max([p1post , p2post , p3post]);
end

%plots test data as a function of the test pattern index
figure
plot(y_res,'.');

title('Predictions')
xlabel('index')
ylabel('class predicted')



figure(f)
%usar para as conclusoes apagar depois
for i=1:length(xtest)
    if(y_res(i)-ytest(i)~=0)
      scatter (xtest(1,i),xtest(2,i),'O','fill','black')
      hold on
    end
end

%calculates error
erro_percentual = nnz(y_res-ytest)/length(xtrain) * 100