% Prolog predicate to check if a number is even
is_even(X) :- 
    integer(X),           % Check if X is an integer
    X mod 2 =:= 0.        % Check if X modulo 2 equals 0

% Alternative implementation using recursion for educational purposes
is_even_recursive(0).
is_even_recursive(X) :- 
    X > 0, 
    X1 is X - 2, 
    is_even_recursive(X1).
is_even_recursive(X) :- 
    X < 0, 
    X1 is X + 2, 
    is_even_recursive(X1).