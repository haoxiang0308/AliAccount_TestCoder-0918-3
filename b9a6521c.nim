proc printMultiplicationTable(size: int) =
  ## Выводит таблицу умножения размером size x size
  for i in 1..size:
    for j in 1..size:
      stdout.write((i * j).align(4))  # Выравнивание для лучшего отображения
    stdout.write("\n")

# Пример использования: вывод таблицы 10x10
printMultiplicationTable(10)