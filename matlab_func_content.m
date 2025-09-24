function avg_value = compute_average(input_vector)
    % Вычисляет среднее значение элементов вектора
    if isempty(input_vector)
        error('Input vector is empty');
    end
    avg_value = mean(input_vector);
    
    % Сохраняет результат в текстовый файл с тем же именем
    [~, ~, ~, name, ~] = fileparts(mfilename('fullpath'));
    output_filename = [name, '.txt'];
    fid = fopen(output_filename, 'w');
    fprintf(fid, 'Average value: %.6f\n', avg_value);
    fclose(fid);
end