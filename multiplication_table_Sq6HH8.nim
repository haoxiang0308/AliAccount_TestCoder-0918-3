proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..i:
      let result = i * j
      stdout.write(j, " * ", i, " = ", result)
      if j < i:
        stdout.write("\t") # Добавляем табуляцию между выражениями в одной строке
    stdout.write("\n") # Переходим на новую строку после каждой строки таблицы

printMultiplicationTable()