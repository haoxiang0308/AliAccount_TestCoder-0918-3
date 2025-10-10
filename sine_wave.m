% This MATLAB script plots a sine wave
x = linspace(0, 2*pi, 1000);
y = sin(x);

% Create the plot
figure;
plot(x, y);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;