load('chess33.mat');

SVMStruct = svmtrain(X, Y, 'kernel_function', 'rbf', 'rbf_sigma', 0.8 , 'showplot', 1, 'method', 'QP', 'boxconstraint', inf);

classifieddata = svmclassify(SVMStruct, X, 'showplot', true);

errors = 0;

for i = 1:90
    if classifieddata(i) ~= Y(i)
        errors = errors + 1;
    end
end

errors
size(SVMStruct.SupportVectors)