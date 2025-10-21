% Prolog predicate to check if a number is even
is_even(X) :-
    X mod 2 =:= 0.

% Alternative implementation using recursion
% is_even(0).
% is_even(X) :-
%     X > 0,
%     X1 is X - 2,
%     is_even(X1).
% is_even(X) :-
%     X < 0,
%     X1 is X + 2,
%     is_even(X1).