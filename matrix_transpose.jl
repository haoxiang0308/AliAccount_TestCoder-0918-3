# 创建一个 3x3 的矩阵
A = [1 2 3; 4 5 6; 7 8 9]

# 对矩阵 A 进行转置
A_transposed = A'

# 打印原始矩阵和转置后的矩阵
println("Original Matrix A:")
display(A)
println("\nTransposed Matrix A':")
display(A_transposed)

# 保存当前工作区变量到一个 .jld2 文件 (需要 HDF5 或 JLD2 包)
# 或者，我们可以将结果写入一个简单的文本文件
file_name = tempname() * ".jl"  # 生成一个唯一的临时文件名
open(file_name, "w") do io
    println(io, "# Generated Julia script for matrix transpose")
    println(io, "A = ", A)
    println(io, "A_transposed = ", A_transposed)
end
println("\nResult saved to: ", file_name)
