function result = calculate_mean(data)
% CALCULATE_MEAN computes the mean value of the input data
% Input: data - a vector or matrix of numeric values
% Output: result - the mean value

    if isempty(data)
        result = NaN; % Return NaN for empty input
    else
        result = sum(data(:)) / numel(data); % Calculate mean
    end
end