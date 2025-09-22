function avg = compute_average(numbers)
% compute_average calculates the average of a vector of numbers
%
% Input:
%   numbers - a vector of numbers
%
% Output:
%   avg - the average value of the numbers

if isempty(numbers)
    error('Input vector is empty');
end

avg = sum(numbers) / length(numbers);

end