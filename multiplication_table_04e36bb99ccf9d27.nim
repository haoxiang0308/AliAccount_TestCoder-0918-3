# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int = 10) =
  ## Выводит таблицу умножения размером size x size
  # Функция для выравнивания текста
  proc pad(s: string, width: int): string =
    result = s
    while result.len < width:
      result = " " & result

  # Выводим заголовок
  stdout.write pad("", 3) & "|"
  for j in 1..size:
    stdout.write pad($j, 4)
  echo ""
  
  # Выводим разделитель
  stdout.write "---|"
  for j in 1..size:
    stdout.write "----"
  echo ""
  
  # Выводим строки таблицы
  for i in 1..size:
    stdout.write pad($i, 3) & "|"
    for j in 1..size:
      stdout.write pad($(i * j), 4)
    echo ""

# Пример использования
printMultiplicationTable(10)