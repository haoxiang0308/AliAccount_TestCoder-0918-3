def factorial(n)
  (1..n).reduce(1, :*)
end

# Example usage:
puts factorial(5)
