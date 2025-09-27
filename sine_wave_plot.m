% This script plots a sine wave
x = linspace(0, 4*pi, 1000);
y = sin(x);

figure;
plot(x, y);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;