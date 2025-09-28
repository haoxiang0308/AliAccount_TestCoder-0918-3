function avg = calculateMean(inputArray)
% This function calculates the mean of the input array.
%   Input: inputArray - a numeric vector
%   Output: avg - the mean value of the input vector

    if isempty(inputArray)
        avg = NaN; % Return NaN if the input array is empty
    else
        avg = sum(inputArray) / length(inputArray);
    end
end