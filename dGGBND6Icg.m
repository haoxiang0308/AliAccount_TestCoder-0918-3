function result = calculate_mean(input_array)
% This function calculates the mean of an input array
% Input: input_array - a vector or matrix
% Output: result - the mean value

if isempty(input_array)
    result = 0;
    return;
end

result = sum(input_array(:)) / numel(input_array);
end