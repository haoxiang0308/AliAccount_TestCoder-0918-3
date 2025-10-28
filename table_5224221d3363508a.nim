proc printMultiplicationTable(size: int) =
  ## Выводит таблицу умножения размером size x size
  # Печатаем заголовок
  stdout.write("   |")
  for i in 1..size:
    stdout.write align($i, 4)
  stdout.write("\n")
  
  # Печатаем разделитель
  stdout.write("---|")
  for i in 1..size:
    stdout.write("----")
  stdout.write("\n")
  
  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write align($i, 3) & "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    stdout.write("\n")

# Пример использования
printMultiplicationTable(10)