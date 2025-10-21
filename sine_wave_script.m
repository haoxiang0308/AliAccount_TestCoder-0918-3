% MATLAB script to plot a sine wave
x = linspace(0, 4*pi, 1000);  % Create x values from 0 to 4π
y = sin(x);                   % Calculate sine values

% Plot the sine wave
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;