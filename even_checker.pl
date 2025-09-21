% Predicate to check if a number is even
% A number is even if it is divisible by 2 with no remainder

is_even(X) :-
    X mod 2 =:= 0.

% Example usage:
% ?- is_even(4).
% true.
% 
% ?- is_even(5).
% false.