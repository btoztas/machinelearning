load('spiral.mat');

SVMStruct = svmtrain(X, Y, 'kernel_function', 'polynomial', 'polyorder', 14, 'showplot', 1, 'method', 'QP', 'boxconstraint', 10^4);

classifieddata = svmclassify(SVMStruct, X, 'showplot', true);

errors = 0;

for i = 1:100
    if classifieddata(i) ~= Y(i)
        errors = errors + 1;
    end
end

errors
