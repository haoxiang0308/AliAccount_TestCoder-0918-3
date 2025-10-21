% MATLAB script to plot a sine wave
% Define x values from 0 to 2*pi
x = linspace(0, 2*pi, 1000);

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;