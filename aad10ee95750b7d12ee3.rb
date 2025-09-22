def factorial(n)
  (1..n).reduce(1, :*)
end

puts "Factorial of 5 is: #{factorial(5)}"
