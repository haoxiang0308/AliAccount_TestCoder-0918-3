function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves the linear system Ax = b
% Input:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   solution - the solution vector x such that Ax = b

% Check if the inputs are valid
if size(A, 1) ~= size(A, 2)
    error('Matrix A must be square');
end

if size(A, 1) ~= length(b)
    error('Matrix A and vector b dimensions do not match');
end

% Check if the matrix is singular
if rcond(A) < eps
    warning('Matrix is close to singular, solution may be inaccurate');
end

% Solve the linear system Ax = b
solution = A \ b;

end