% Generate x values from 0 to 4π
x = linspace(0, 4*pi, 1000);

% Generate y values (sine wave)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('x (radians)');
ylabel('sin(x)');
title('Sine Wave Plot');
grid on;

% Add some formatting
xlim([0, 4*pi]);
ylim([-1.2, 1.2]);