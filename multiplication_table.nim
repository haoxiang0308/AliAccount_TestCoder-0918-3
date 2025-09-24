import strformat

proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write(fmt"{i*j:4}")
    stdout.write("\n")

printMultiplicationTable()