proc printMultiplicationTable(n: int) =
  ## Prints an n x n multiplication table
  # Print header row
  stdout.write("    ")
  for j in 1..n:
    stdout.write(j, "\t")
  echo ""
  
  # Print separator
  stdout.write("    ")
  for j in 1..n:
    stdout.write("---\t")
  echo ""
  
  # Print each row
  for i in 1..n:
    stdout.write(i, " | ")
    for j in 1..n:
      stdout.write(i * j, "\t")
    echo ""

# Example usage
printMultiplicationTable(10)