% MATLAB script to plot a sine wave
% Generate x values from 0 to 4*pi
x = linspace(0, 4*pi, 1000);

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add title and labels
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');

% Add grid for better visualization
grid on;

% Set axis limits for better view
xlim([0, 4*pi]);

% Display the plot
disp('Sine wave plot created successfully!');