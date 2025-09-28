# 定义一个 3x3 矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 计算矩阵的转置
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)