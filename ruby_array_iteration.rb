# 使用Ruby块遍历数组并打印元素

# 定义一个数组
my_array = [1, 2, 3, 4, 5]

# 使用 .each 块遍历数组
my_array.each do |element|
  puts element
end

# 也可以使用大括号语法
my_array.each { |element| puts element * 2 }