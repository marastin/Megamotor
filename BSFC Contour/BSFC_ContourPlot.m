clear
clc
close all

Data = csvread('Data.csv') ;
File_Name = 'Engine_A.bmp';

x = Data(:,1);
y = Data(:,2);
z = Data(:,3);

[xData, yData, zData] = prepareSurfaceData( x, y, z );

% Set up fittype and options.
% ft = 'cubicinterp';
ft = 'linearinterp';

[fitresult, gof] = fit( [xData, yData], zData, ft, 'Normalize', 'on' );

fig = figure;
h = plot( fitresult, [xData, yData], zData, 'Style', 'Contour' );
h(1).LevelList = [0 246 250 255 260 270 280 300 330 380 500 800];
h(1).ShowText = 'on';
h(2).Marker = 'none';
% Label axes
xlabel( 'Engine Speed', 'Interpreter', 'none' );
ylabel( 'BMEP', 'Interpreter', 'none' );
title( 'BSFC' )
grid on

saveas(fig,File_Name);