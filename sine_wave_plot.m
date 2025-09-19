% Generate x values from 0 to 2π
x = linspace(0, 2*pi, 100);

% Calculate y values (sine of x)
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

% Display the plot
disp('Sine wave plot created successfully!');