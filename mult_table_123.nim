proc printMultiplicationTable() =
  ## Выводит таблицу умножения 10x10
  for i in 1..10:
    for j in 1..10:
      var product = $(i * j)
      while product.len < 4:
        product = " " & product
      stdout.write(product)
    echo ""

printMultiplicationTable()