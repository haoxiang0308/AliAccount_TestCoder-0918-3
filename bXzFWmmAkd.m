% MATLAB script to plot a sine wave
% Clear workspace and close all figures
clear all;
close all;
clc;

% Define the x-axis values
x = linspace(0, 4*pi, 1000);

% Calculate the sine wave values
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;

% Add some styling
xlim([0, 4*pi]);