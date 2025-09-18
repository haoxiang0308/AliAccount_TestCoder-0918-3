% This script plots a sine wave
x = linspace(0, 2*pi, 100); % Create 100 points from 0 to 2*pi
y = sin(x); % Calculate the sine of each point
plot(x, y); % Plot the sine wave
xlabel('x'); % Label the x-axis
ylabel('sin(x)'); % Label the y-axis
title('Sine Wave'); % Add a title to the plot
grid on; % Turn on the grid