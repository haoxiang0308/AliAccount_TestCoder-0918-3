# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  echo "Таблица умножения:"
  echo ""
  
  # Заголовки столбцов
  stdout.write "   |"
  for j in 1..10:
    stdout.write align($j, 4)
  echo ""
  
  # Разделитель
  stdout.write "---|"
  for j in 1..10:
    stdout.write "----"
  echo ""
  
  # Строки таблицы
  for i in 1..10:
    stdout.write align($i, 3) & "|"
    for j in 1..10:
      stdout.write align($(i * j), 4)
    echo ""

# Вызов процедуры
printMultiplicationTable()