proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write($ (i * j))
      if j < size:
        stdout.write("\t")
    stdout.write("\n")

# Example usage
printMultiplicationTable(10)