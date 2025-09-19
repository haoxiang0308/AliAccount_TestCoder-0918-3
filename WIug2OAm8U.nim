import strformat

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:3} ")
    stdout.write("\\n")

printMultiplicationTable(10)
