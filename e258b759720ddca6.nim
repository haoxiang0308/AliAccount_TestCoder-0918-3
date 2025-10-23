# Процедура для вывода таблицы умножения
proc multiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write align($((i * j)), 4)
    echo()

# Вызов процедуры для демонстрации
multiplicationTable()