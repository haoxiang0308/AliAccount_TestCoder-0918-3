def factorial(n)
  if n < 0
    raise ArgumentError, "Factorial is not defined for negative numbers"
  elsif n == 0 || n == 1
    1
  else
    (2..n).reduce(1, :*)
  end
end

# Example usage:
# puts factorial(5) # => 120