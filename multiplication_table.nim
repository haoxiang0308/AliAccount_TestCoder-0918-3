proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      let result = i * j
      stdout.write($result)
      if j < 10:
        stdout.write("\t")
    stdout.write("\n")

printMultiplicationTable()