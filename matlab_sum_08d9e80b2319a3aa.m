% Bucle en MATLAB que calcula la suma de una serie
% Serie: suma de los primeros n números naturales

n = 100;  % Número de términos
suma = 0;

for i = 1:n
    suma = suma + i;
end

fprintf('La suma de los primeros %d números naturales es: %d\n', n, suma);
