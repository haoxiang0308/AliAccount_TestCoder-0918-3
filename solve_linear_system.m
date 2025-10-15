function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves the linear system Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   x - solution vector (n x 1)
%
% Example:
%   A = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
%   b = [1; -2; 0];
%   x = solve_linear_system(A, b);

    % Check if inputs are valid
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square');
    end
    
    if length(b) ~= n
        error('Dimensions of A and b do not match');
    end
    
    % Check if matrix is singular
    if rcond(A) < eps
        warning('Matrix is singular or nearly singular');
        x = A \ b;  % Use backslash operator which handles singular matrices better
    else
        % Solve the linear system using the backslash operator
        x = A \ b;
    end
end