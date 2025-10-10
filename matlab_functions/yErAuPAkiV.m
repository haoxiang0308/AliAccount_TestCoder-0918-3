function avg = calculateMean(numbers)
% This function calculates the mean of an array of numbers.
% Input: numbers - a vector of numbers
% Output: avg - the mean value

if isempty(numbers)
    avg = NaN; % Return NaN if the input array is empty
    return;
end

avg = sum(numbers(:)) / numel(numbers);
end

