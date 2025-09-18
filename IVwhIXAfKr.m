% Generate x values from 0 to 2*pi
x = linspace(0, 2*pi, 100);

% Calculate y values (sine of x)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Sine Wave');

% Add grid
grid on;