#!/usr/bin/env ruby

# 创建一个示例数组
fruits = ["apple", "banana", "orange", "grape", "kiwi"]

puts "使用 each 块遍历数组并打印元素："
fruits.each do |fruit|
  puts fruit
end

puts "\n使用 each_with_index 块遍历数组并打印元素及索引："
fruits.each_with_index do |fruit, index|
  puts "#{index}: #{fruit}"
end

puts "\n使用块对数组元素进行转换并打印："
fruits.collect { |fruit| fruit.upcase }.each { |fruit| puts fruit }

puts "\n使用 times 方法演示块的另一种用法："
5.times { |i| puts "这是第 #{i+1} 次迭代" }