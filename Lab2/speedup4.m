clear;
rosenini;
anim = 0;
fileID = fopen('results3.txt','w');
vmatrix = zeros(31, 30);
alfav = 0.7:0.01:1;
etav = 0.01:0.01:0.3;
etav = etav';
i = 1;
j = 1;
for alfa = 0.7:0.01:1
    for eta = 0.01:0.01:0.3
        rosen;
        %fprintf(fileID, "Alfa = %f Eta = %f iter = %d f = %f\n", alfa, eta, iter, f);
        fprintf("Test = %d\n", (i*j +j));
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