% Predicate to check if a number is even
is_even(N) :-
    N mod 2 =:= 0.

% Alternative implementation that also works for negative numbers
is_even_alt(N) :-
    0 is N mod 2.