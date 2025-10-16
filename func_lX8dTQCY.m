function x = func_lX8dTQCY(A, b)
% 求解线性方程组 Ax = b
% 使用高斯消元法的MATLAB内置实现

% 检查矩阵是否为方阵
[n, ~] = size(A);
if n ~= size(A, 2)
    error('系数矩阵必须是方阵');
end

% 检查b的维度是否与A匹配
if size(b, 1) ~= n
    error('b的维度必须与A的行数匹配');
end

% 求解方程组
x = A \ b;  % MATLAB的左除运算符，自动选择最优算法

% 可选：返回解的验证
residual = A * x - b;
fprintf('解的残差范数: %e\n', norm(residual));

