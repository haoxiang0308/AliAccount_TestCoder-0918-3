# 创建一个3x3的矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 对矩阵进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 也可以使用 ' 来进行转置 (prime operator)
transposed_matrix2 = matrix'

println("\n使用 ' 运算符转置的矩阵:")
display(transposed_matrix2)

# 创建一个随机矩阵并转置
random_matrix = rand(3, 4)
println("\n随机矩阵:")
display(random_matrix)

random_transposed = transpose(random_matrix)
println("\n转置后的随机矩阵:")
display(random_transposed)