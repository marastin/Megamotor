clear
clc
close all

load('Data')
T = Data(:,1);
L = Data(:,2);

r = 8.9;
R = 18;
Dist = R + L + r;
for i = 45:45%length(T)
    for j = i:i+30
        T(j)
        x = Dist(j)*cosd(T(j))
        y = Dist(j)*sind(T(j))
        [xout, yout] = linecirc(tand(T(i)),0,Dist(j)*cosd(T(j)),Dist(j)*sind(T(j)),r)
        xj(j,[1,2]) = xout;
        yj(j,[1,2]) = yout;
    end
end

plot(sqrt(xj.^2+yj.^2))