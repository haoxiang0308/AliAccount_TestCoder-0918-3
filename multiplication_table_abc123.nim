proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения размером n x n
  for i in 1..n:
    for j in 1..n:
      stdout.write((i * j).align(4)) # Выравнивание по 4 символам
    echo() # Переход на новую строку после каждой строки таблицы

# Пример использования
printMultiplicationTable(9)