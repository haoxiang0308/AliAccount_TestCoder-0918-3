# 创建一个矩阵
A = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵 A:")
display(A)

# 对矩阵进行转置操作
A_transpose = transpose(A)

println("\n转置后的矩阵 A':")
display(A_transpose)

# 也可以使用 ' 符号进行转置
B = [1 4 7; 2 5 8; 3 6 9]
println("\n另一个矩阵 B:")
display(B)
println("\nB 的转置 (使用 ' 符号):")
display(B')

# 创建一个非方阵进行测试
C = [1 2 3 4; 5 6 7 8]
println("\n非方阵 C:")
display(C)
println("\nC 的转置:")
display(C')