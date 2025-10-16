% 示例：使用solve_linear_system函数求解线性方程组

% 定义线性方程组 Ax = b
% 3x + 2y - z = 1
% 2x - 2y + 4z = -2
% -x + 0.5y - z = 0

A = [3, 2, -1; 
     2, -2, 4; 
     -1, 0.5, -1];
     
b = [1; -2; 0];

% 调用函数求解
x = solve_linear_system(A, b);

% 显示结果
fprintf('方程组的解为:\n');
fprintf('x = %.4f\n', x(1));
fprintf('y = %.4f\n', x(2));
fprintf('z = %.4f\n', x(3));

% 验证解的正确性
fprintf('\n验证 A*x = b:\n');
result = A * x;
for i = 1:length(b)
    fprintf('%.4f = %.4f\n', result(i), b(i));
end