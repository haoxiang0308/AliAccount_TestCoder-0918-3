function x = solveLinearSystem(A, b)
% SOLVELINEARSYSTEM Solves the linear system Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   x - solution vector (n x 1)

% Check if A is square
[rows, cols] = size(A);
if rows ~= cols
    error('Matrix A must be square');
end

% Check if dimensions match
if length(b) ~= rows
    error('Dimensions of A and b do not match');
end

% Check if matrix is singular
if rcond(A) < eps
    warning('Matrix is close to singular, solution may be inaccurate');
end

% Solve the linear system
x = A \ b;

end
