% Predicate to check if a number is even
is_even(N) :-
    N mod 2 =:= 0.

% Example usage:
% ?- is_even(4).  % returns true
% ?- is_even(5).  % returns false