proc printMultiplicationTable() =
  ## Выводит таблицу умножения размером 10x10
  echo "Таблица умножения:"
  echo ""
  
  # Выводим заголовки столбцов
  stdout.write "   |"
  for j in 1..10:
    stdout.write align($j, 4)
  echo ""
  
  # Выводим разделительную линию
  stdout.write "---+"
  for j in 1..10:
    stdout.write "----"
  echo ""
  
  # Выводим строки таблицы
  for i in 1..10:
    stdout.write align($i, 3) & "|"
    for j in 1..10:
      stdout.write align($(i * j), 4)
    echo ""

# Вызов процедуры
printMultiplicationTable()