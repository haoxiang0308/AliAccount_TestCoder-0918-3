# 使用Ruby块遍历数组并打印元素

# 定义一个数组
fruits = ["apple", "banana", "cherry", "date"]

# 使用 each 块遍历数组并打印每个元素
puts "遍历数组中的元素："
fruits.each do |fruit|
  puts fruit
end

# 使用 times 块打印索引
puts "\n使用索引遍历："
fruits.length.times do |i|
  puts "#{i}: #{fruits[i]}"
end