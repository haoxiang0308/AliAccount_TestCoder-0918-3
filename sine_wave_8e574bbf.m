% MATLAB script to plot a sine wave
% This script generates and plots a sine wave with default parameters

% Define the x-axis values
x = linspace(0, 4*pi, 1000);  % 1000 points from 0 to 4π

% Calculate the sine wave values
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Sine Wave Plot');

% Add grid for better visualization
grid on;

% Set axis limits to show the full range
xlim([0, 4*pi]);
ylim([-1.1, 1.1]);

% Add horizontal line at y=0 for reference
hold on;
plot([0, 4*pi], [0, 0], 'k--', 'LineWidth', 0.5);
hold off;

% Display the plot
disp('Sine wave plot generated successfully!');
