# 创建一个 3x3 的随机整数矩阵
A = rand(1:10, 3, 3)
println("原始矩阵 A:")
display(A)
println()  # 换行

# 计算 A 的转置
A_transpose = A'
println("矩阵 A 的转置 A':")
display(A_transpose)
println()  # 换行

println("操作完成。")