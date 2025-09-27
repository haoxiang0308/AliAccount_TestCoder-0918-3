def factorial(n)
  if n < 0
    raise ArgumentError, "Факториал не определен для отрицательных чисел"
  elsif n == 0 || n == 1
    1
  else
    (2..n).reduce(:*)
  end
end

# Пример использования:
# puts factorial(5) # => 120