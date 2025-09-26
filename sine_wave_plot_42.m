% This script plots a sine wave.
% It generates a vector of x values from 0 to 2*pi,
% calculates the corresponding sine values,
% and then plots the sine wave with labels and a grid.

% Define the x-axis values from 0 to 2*pi
x = linspace(0, 2*pi, 1000);

% Calculate the sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Save the figure as an image file
% saveas(gcf, 'sine_wave_plot.png');