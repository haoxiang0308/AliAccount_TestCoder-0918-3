function avg = calculate_mean(data)
    % Функция для вычисления среднего значения
    % Вход: data - вектор или матрица чисел
    % Выход: avg - среднее значение
    
    if isempty(data)
        avg = NaN; % Возвращаем NaN для пустого массива
    else
        avg = sum(data(:)) / numel(data); % Вычисляем среднее значение
    end
end