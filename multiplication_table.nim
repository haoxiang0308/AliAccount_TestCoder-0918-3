# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  ## Печатает таблицу умножения размером size x size
  # Печатаем заголовок
  stdout.write "    "
  for j in 1..size:
    stdout.write align($j, 4)
  stdout.write "\n"

  # Печатаем разделитель
  stdout.write "    "
  for j in 1..size:
    stdout.write "----"
  stdout.write "\n"

  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write align($i, 4) # Печатаем номер строки
    for j in 1..size:
      stdout.write align($(i * j), 4) # Печатаем результат умножения
    stdout.write "\n"

# Пример использования
printMultiplicationTable(10)