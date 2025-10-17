function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解向量
%
% 示例:
%   A = [2 1; 1 -1];
%   b = [3; 0];
%   x = solve_linear_system(A, b);

    % 检查输入矩阵的维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('系数矩阵A的行数必须与常数向量b的长度相等');
    end
    
    % 检查矩阵A是否为方阵
    if m ~= n
        warning('系数矩阵A不是方阵，使用最小二乘解');
        x = A \ b;  % 使用最小二乘法求解
    else
        % 检查矩阵A是否奇异
        if rcond(A) < eps
            warning('系数矩阵A接近奇异，解可能不准确');
            x = A \ b;
        else
            % 使用高斯消元法求解
            x = A \ b;
        end
    end
end