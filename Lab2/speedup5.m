clear;
rosenini;
a = 100;
assact;
anim = 0;
fileID = fopen('results3.txt','w');
vmatrix = zeros(5, 11);
alfav = 0.9:0.01:1;
etav = [0 0.01 0.02 0.03 0.04 0.05];
etav = etav';
i = 1;
j = 1;
for alfa = 0.9:0.01:1
    for eta = 0.01:0.01:0.05
        rosen;
        %fprintf(fileID, "Alfa = %f Eta = %f iter = %d f = %f\n", alfa, eta, iter, f);
        vmatrix(j,i) = iter;
        j=j+1;
    end
    i=i+1;
    j=1;
end
fmatrix = [alfav;vmatrix];
ffmatrix = [etav fmatrix];
filename = 'testdata5.xls';
A = ffmatrix;
xlswrite(filename, A);