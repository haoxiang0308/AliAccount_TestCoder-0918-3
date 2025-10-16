# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int = 10) =
  # Печатаем заголовок
  stdout.write("    ")
  for j in 1..size:
    stdout.write(j, "\t")
  echo ""
  
  # Печатаем разделитель
  stdout.write("    ")
  for j in 1..size:
    stdout.write("---\t")
  echo ""
  
  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write(i, " | ")
    for j in 1..size:
      stdout.write(i * j, "\t")
    echo ""

# Пример использования
printMultiplicationTable(10)