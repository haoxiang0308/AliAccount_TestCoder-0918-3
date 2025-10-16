import strutils

# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int = 10) =
  # Вывод заголовка таблицы
  stdout.write("    ")
  for i in 1..size:
    stdout.write align($i, 4)
  echo ""
  
  # Вывод разделителя
  stdout.write("    ")
  for i in 1..size:
    stdout.write "----"
  echo ""
  
  # Вывод строк таблицы
  for i in 1..size:
    stdout.write align($i, 4)
    for j in 1..size:
      stdout.write align($(i * j), 4)
    echo ""

# Пример использования
printMultiplicationTable(10)