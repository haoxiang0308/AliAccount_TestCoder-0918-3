% Prolog predicate to check if a number is even.
% Usage: is_even(Number).
% This predicate succeeds if the Number is even, fails otherwise.

is_even(Number) :-
    Number mod 2 =:= 0.
