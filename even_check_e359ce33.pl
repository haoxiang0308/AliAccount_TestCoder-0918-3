% Prolog predicate to check if a number is even
is_even(Number) :-
    integer(Number),
    Number mod 2 =:= 0.

% Alternative implementation that also works for negative numbers
is_even_alt(Number) :-
    integer(Number),
    abs(Number) mod 2 =:= 0.