proc printMultiplicationTable(size: int) =
  ## Выводит таблицу умножения размером size x size
  # Вывод заголовков столбцов
  stdout.write("    ")
  for j in 1..size:
    stdout.write(j)
    stdout.write(" ")
  stdout.write("\n")

  # Вывод горизонтальной линии
  stdout.write("   ")
  for j in 1..size:
    stdout.write("--")
  stdout.write("-\n")

  # Вывод строк таблицы
  for i in 1..size:
    stdout.write(i)
    stdout.write(" | ")
    for j in 1..size:
      stdout.write(i * j)
      stdout.write(" ")
    stdout.write("\n")

# Пример вызова процедуры
printMultiplicationTable(10)