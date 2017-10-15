clear;
quad1ini;
anim = 0;
for a = [0.5 1 2 5]
    for eta = [0.001 0.01 0.03 0.1 0.3 1 3]
        quad1(a,eta);
    end
end