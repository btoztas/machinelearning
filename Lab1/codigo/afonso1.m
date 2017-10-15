%% Getting settings and loading files
prompt = 'What is the file? ';
file_name = input(prompt,'s');
prompt1 = 'What is the polynomial degree? ';
str = input(prompt1,'s');
t = str2num(str);
load(strcat('mfiles1/',file_name));

%% Creating X matrix
[n,p]=size(x);
X=ones(n,p);
for i=1:t
    X(1:end,i+1) = x.^i;
end

%% Finding Betas
Beta = inv(X'*X)*X'*y;

%% Plotting training data and fit

% Ploting training data
scatter(x,y);
hold on;

% Creating the fit
xt = -1:0.1:1;
xp = ones(21,t);
for i=1:t
    xp(1:end,i+1) = xt.^i;
end
yt = xp*Beta;
xtt = x';

% Ploting the fit
plot(xt,yt);
title(strcat('Least squares fitting a polynomial of degree 2 with training data form data2a.mat'));
legend('Training Data','Fit using LS fitting');
xlabel('Feature Value');
ylabel('Output');


%% Finding sum of square errors
YT=X*Beta;
SSE = norm(y-YT)^2
Beta