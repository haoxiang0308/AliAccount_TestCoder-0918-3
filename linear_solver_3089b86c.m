function x = solve_linear_equations(A, b)
% SOLVE_LINEAR_EQUATIONS Solves the linear system Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   x - solution vector (n x 1)

    % Validate inputs
    [rows, cols] = size(A);
    if rows ~= cols
        error('Coefficient matrix A must be square');
    end
    
    if length(b) ~= rows
        error('Right-hand side vector b must have same number of rows as matrix A');
    end
    
    % Check for singular matrix
    if rank(A) < cols
        warning('Matrix A is singular or nearly singular');
        x = A \ b;
    else
        % Solve using Gaussian elimination (backslash operator in MATLAB)
        x = A \ b;
    end
end
