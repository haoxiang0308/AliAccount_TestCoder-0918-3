# Процедура для вывода таблицы умножения
import std/strutils

proc printMultiplicationTable(size: int = 10) =
  ## Выводит таблицу умножения размером size x size
  # Печатаем заголовок
  stdout.write("    ")
  for j in 1..size:
    stdout.write(j.intToStr().align(4))
  stdout.write("\n")
  
  # Печатаем разделитель
  stdout.write("    ")
  for j in 1..size:
    stdout.write("----")
  stdout.write("\n")
  
  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write(i.intToStr().align(2) & " |")
    for j in 1..size:
      stdout.write((i*j).intToStr().align(4))
    stdout.write("\n")

# Пример использования
printMultiplicationTable(10)