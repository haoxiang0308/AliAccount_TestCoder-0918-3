# Method to calculate factorial of a number
def factorial(n)
  if n < 0
    raise ArgumentError, "Factorial is not defined for negative numbers"
  elsif n == 0 || n == 1
    1
  else
    result = 1
    (2..n).each do |i|
      result *= i
    end
    result
  end
end

# Example usage:
# puts factorial(5)  # Output: 120
# puts factorial(0)  # Output: 1