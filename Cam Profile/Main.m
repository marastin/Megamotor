clear
clc
close all

load('Data')
T = Data(:,1);
L = Data(:,2);

% load('Data2')
% T = TH;
% L = Lift;

TT = [T-360;T;T+360];
LL = [L;L;L];

r = 8.9;
R = 18;
Dist = R + LL + r;
% plot(T,L)
c = sqrt(Dist.^2);
f = 0;
for i = length(T):2*length(T)
    f = f +1;
    if f == 10 
        x1 = Dist(i)*cosd(TT(i));
        y1 = Dist(i)*sind(TT(i));
        drawCircle(x1,y1,r);
        f = 0;
    end
    for j = i-90:i+90
        x = Dist(j)*cosd(TT(j));
        y = Dist(j)*sind(TT(j));
        [xout, yout] = linecirc(tand(TT(i)),0,x,y,r);
        c(i) = min(c(i), min(sqrt(xout.^2 + yout.^2)));
    end
end
axis square
axis([-45,45,-45,45])
line([0,0],[0,45])
figure
polar(TT(length(T):2*length(T))*pi/180,c(length(T):2*length(T)))

grid on
