# 创建一个矩阵并进行转置操作的Julia程序

# 创建一个3x3的矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 创建另一个随机矩阵示例
println("\n创建一个随机矩阵示例:")
random_matrix = rand(1:10, 4, 3)  # 创建一个4x3的随机整数矩阵
println("随机矩阵:")
display(random_matrix)

println("\n随机矩阵的转置:")
display(transpose(random_matrix))