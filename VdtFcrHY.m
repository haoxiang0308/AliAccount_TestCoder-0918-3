function [x, info] = VdtFcrHY(A, b)
% VdtFcrHY Solves linear system Ax = b with detailed information
% Input:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   x - the solution vector
%   info - structure with additional information about the solution

% Initialize info structure
info = struct();

% Check if the inputs are valid
if size(A, 1) ~= size(A, 2)
    error('Matrix A must be square');
end

if size(A, 1) ~= length(b)
    error('Matrix A and vector b dimensions do not match');
end

% Store matrix properties
info.size = size(A);
info.condition_number = cond(A);
info.determinant = det(A);
info.rank = rank(A);

% Determine solution method based on matrix properties
if info.condition_number < 1e12
    % Well-conditioned matrix, use LU decomposition via backslash
    x = A \ b;
    info.method = 'LU decomposition';
elseif info.rank == size(A, 1)
    % Rank-deficient but consistent system, use QR decomposition
    x = A \ b;
    info.method = 'QR decomposition';
else
    % Use pseudoinverse for singular or ill-conditioned matrices
    x = pinv(A) * b;
    info.method = 'Pseudoinverse';
end

% Calculate residual and relative error
info.residual = norm(A * x - b);
info.solution_norm = norm(x);

% Check if the solution is accurate
if info.residual > 1e-10
    warning('Large residual detected: %e', info.residual);
end

end