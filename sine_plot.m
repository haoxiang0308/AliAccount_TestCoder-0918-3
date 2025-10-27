% MATLAB script to plot a sine wave
% Clear workspace and close all figures
clear all;
close all;
clc;

% Define x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;

% Add some styling
xlim([0 4*pi]);