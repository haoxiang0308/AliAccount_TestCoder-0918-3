proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения n x n
  # Вывод заголовка
  stdout.write("    ")
  for j in 1..n:
    stdout.write(j, "\t")
  stdout.write("\n")

  # Вывод разделителя
  stdout.write("    ")
  for j in 1..n:
    stdout.write("---", "\t")
  stdout.write("\n")

  # Вывод строк таблицы
  for i in 1..n:
    stdout.write(i, " | ")
    for j in 1..n:
      stdout.write(i * j, "\t")
    stdout.write("\n")

printMultiplicationTable(9)