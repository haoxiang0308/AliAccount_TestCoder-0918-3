# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  # Вывод заголовка таблицы
  stdout.write("   ")
  for j in 1..size:
    stdout.write(j, "\t")
  echo()
  
  # Вывод строк таблицы
  for i in 1..size:
    stdout.write(i, "\t")
    for j in 1..size:
      stdout.write(i * j, "\t")
    echo()

# Пример использования процедуры
printMultiplicationTable(10)