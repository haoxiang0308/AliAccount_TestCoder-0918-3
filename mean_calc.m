function result = mean_calc(data)
% MEAN_CALC вычисляет среднее значение вектора или матрицы
% Вход:
%   data - вектор или матрица чисел
% Выход:
%   result - среднее значение элементов

    result = sum(data(:)) / numel(data);
end