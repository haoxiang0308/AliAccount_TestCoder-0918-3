proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      let result = i * j
      stdout.write($result & "\t")
    stdout.write("\n")

printMultiplicationTable()