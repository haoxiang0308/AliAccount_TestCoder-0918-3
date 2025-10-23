def factorial(n)
  if n < 0
    raise ArgumentError, "Factorial is not defined for negative numbers"
  elsif n == 0 || n == 1
    1
  else
    result = 1
    (2..n).each { |i| result *= i }
    result
  end
end

# Example usage:
# puts factorial(5)  # Output: 120