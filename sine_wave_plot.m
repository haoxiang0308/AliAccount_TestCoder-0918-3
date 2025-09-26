% This script plots a sine wave
x = linspace(0, 2*pi, 1000);
y = sin(x);

figure;
plot(x, y);
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
grid on;