% Prolog predicate to check if a number is even
is_even(X) :-
    X mod 2 =:= 0.

% Alternative implementation with explicit check for integer
is_even_safe(X) :-
    integer(X),
    X mod 2 =:= 0.