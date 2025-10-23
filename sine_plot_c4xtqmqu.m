% MATLAB script to plot a sine wave
% Generate x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

% Calculate the sine values
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

% Optional: Add x-axis labels with π multiples
xticks(0:pi/2:4*pi);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi', '5\pi/2', '3\pi', '7\pi/2', '4\pi'});

% Display the plot
disp('Sine wave plot created and displayed.');