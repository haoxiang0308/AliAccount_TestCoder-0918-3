% Predicate to check if a number is even
% even(N) succeeds if N is an even number

even(N) :-
    N mod 2 =:= 0.

% Example usage:
% ?- even(4).
% true.
%
% ?- even(5).
% false.