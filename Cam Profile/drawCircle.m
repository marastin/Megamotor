function drawCircle(x,y,r)
hold on
X = zeros(1,360);
Y = zeros(1,360);
for i = 1:360
    X(i) = x + r*cosd(i);
    Y(i) = y + r*sind(i);
end
plot(X,Y)

hold off