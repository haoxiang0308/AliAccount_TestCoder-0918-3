function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵 (n x n)
%   b - 常数向量 (n x 1)
% 输出:
%   x - 方程组的解向量 (n x 1)
%
% 示例:
%   A = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
%   b = [1; -2; 0];
%   x = solve_linear_system(A, b);

    % 检查输入矩阵的维度是否匹配
    [m, n] = size(A);
    if m ~= n
        error('系数矩阵A必须是方阵');
    end
    
    if length(b) ~= n
        error('常数向量b的长度必须与矩阵A的行数相等');
    end
    
    % 检查矩阵是否奇异
    if rcond(A) < eps
        warning('矩阵A接近奇异，解可能不准确');
    elseif det(A) == 0
        error('矩阵A是奇异的，方程组无唯一解');
    end
    
    % 使用左除运算求解线性方程组
    x = A \ b;
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning('解的精度较低，残差为: %e', residual);
    end
end