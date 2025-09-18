% This script plots a sine wave
x = linspace(0, 4*pi, 1000);
y = sin(x);
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('sin(x)');
title('Sine Wave');
grid on;