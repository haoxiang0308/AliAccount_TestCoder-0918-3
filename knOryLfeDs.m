function result = knOryLfeDs(A, b)
% knOryLfeDs Solves the linear system Ax = b using multiple methods
% Input:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   result - the solution vector x such that Ax = b

% Check if the inputs are valid
if size(A, 1) ~= size(A, 2)
    error('Matrix A must be square');
end

if size(A, 1) ~= length(b)
    error('Matrix A and vector b dimensions do not match');
end

% Determine which method to use based on matrix properties
if cond(A) < 1e10  % Well-conditioned matrix
    % Use backslash operator (LU decomposition)
    result = A \ b;
else
    % Use pseudoinverse for ill-conditioned matrix
    result = pinv(A) * b;
end

% Verify the solution
residual = norm(A * result - b);
if residual > 1e-10
    warning('Solution may be inaccurate, residual = %e', residual);
end

end