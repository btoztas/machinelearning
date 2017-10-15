clear;
quad2ini;
anim = 0;
a = 20;
fileID = fopen('results3.txt','w');
vmatrix = zeros(8, 5);
alfav = [0 0.5 0.7 0.9 0.95];
etav = [0 0.003 0.01 0.03 0.1 0.3 1 3 10];
etav = etav';
i = 1;
j = 1;
for alfa = [0 0.5 0.7 0.9 0.95]
    for eta = [0.003 0.01 0.03 0.1 0.3 1 3 10]
        quad2;
        fprintf(fileID, "Alfa = %f Eta = %f iter = %d f = %f\n", alfa, eta, iter, f);
        vmatrix(j,i) = iter;
        j=j+1;
    end
    i=i+1;
    j=1;
end
fmatrix = [alfav;vmatrix];
ffmatrix = [etav fmatrix];
filename = 'testdata4.xls';
A = [fmatrix];
xlswrite(filename, A);