% Prolog predicate to check if a number is even
% Usage: is_even(4). -> true.
%        is_even(5). -> false.

is_even(Number) :-
    0 is Number mod 2.