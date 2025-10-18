# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int = 10) =
  # Выводим заголовок таблицы
  stdout.write("   |")
  for j in 1..size:
    stdout.write align($j, 4)
  echo ""
  
  # Выводим разделитель
  stdout.write("---|")
  for j in 1..size:
    stdout.write "----"
  echo ""
  
  # Выводим строки таблицы умножения
  for i in 1..size:
    stdout.write align($i, 3) & "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    echo ""

# Пример использования процедуры
printMultiplicationTable(10)