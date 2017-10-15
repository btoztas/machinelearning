clear;
rosenini;
assdeact;
anim = 0;
a = 100;
fileID = fopen('results3.txt','w');
vmatrix = zeros(5, 6);
alfav = [0 0.5 0.7 0.9 0.95 0.99];
etav = [0 0.001 0.01 0.1 1 10];
etav = etav';
i = 1;
j = 1;
for alfa = [0 0.5 0.7 0.9 0.95 0.99]
    for eta = [0.001 0.01 0.1 1 10]
        rosen;
        fprintf(fileID, "Alfa = %f Eta = %f iter = %d f = %f\n", alfa, eta, iter, f);
        vmatrix(j,i) = iter;
        j=j+1;
    end
    i=i+1;
    j=1;
end
fmatrix = [alfav;vmatrix];
ffmatrix = [etav fmatrix];
filename = 'testdata7.xls';
A = ffmatrix;
xlswrite(filename, A);