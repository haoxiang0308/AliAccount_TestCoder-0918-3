% MATLAB script to plot a sine wave
% Define the x-axis values
x = linspace(0, 4*pi, 1000);

% Calculate the sine values
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
grid on;