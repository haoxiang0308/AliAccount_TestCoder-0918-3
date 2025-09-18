def factorial(n)
  if n < 0
    raise ArgumentError, "Factorial is not defined for negative numbers"
  elsif n == 0 || n == 1
    1
  else
    (1..n).reduce(:*)
  end
end

# Example usage:
# puts factorial(5) # => 120
# puts factorial(0) # => 1